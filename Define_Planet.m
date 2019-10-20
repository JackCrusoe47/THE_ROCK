function PLANET = Define_Planet(STAR, Rp,Mp,dp,planet_type)
%
% -------------------------------------------------------------------------
% *****************************
% NASA SPACEAPPS CHALLENGE 2019
% *****************************
% AUTHORS:
% Barcelona Moreno, Iván
% Charls, Kevin
% Durán Jiménez, Cristina
% Montenero, Domenico
% Sardelli, Paolo Alessandro

%LEGEND: function taht computes all the properties of the planet chosen by
% the user
%
%INPUT
%STAR = structure obtaind by Define_Star function
%Rp = radius of the planet (km)
%Mp = mass of the planet (kg)
%dp = distance of the planet from the star (AU)
%planet_type = 1 if terrestrial (rocky) planet, else it is gaseous
%
%OUTPUT
%PLANET = structure obtained by Define_planet function
%
% VERSION: 19/10/2019

% constants
radius_Earth = phy_const("U10");
G = phy_const("C01");
Year = phy_const("U15");
AU = phy_const("U01");
mass_Jupiter = phy_const("U07");

% planet definition function
Min_mass = 5*10e20;
Min_radius = 800;

%planet characterizatuon by user
distance_planet = dp; %UA
mass_planet = Mp;   %kg
radius_planet = Rp; %km

% from STAR.struct
mass_star = STAR.mass;

% from SYSTEM.struct
% distance_frosting = SYSTEM.distance_frosting;

% %%
% % Planet type Gaseous or Rocky
% % only rocky planet
% if distance_planet < distance_frosting  
%     %radius of the planet
%     if radius_planet < Min_radius || radius_planet > 2*radius_Earth
%         return
%     end
%     
%     %mass of planet
%     if mass_planet < Min_mass
%         return 
%     end   
% end
% 
% % gaseous or rocky
% %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% if planet_type == 1
%     %rocky planet
%     
%     %radius of the planet
%     if radius_planet < Min_radius || radius_planet > 2*radius_Earth
%         return
%     end
%     
%     %mass of planet
%     if mass_planet < Min_mass
%         return 
%     end 
% else
%     %gaseous planet
%     
%     %radius of the planet
%     if mass_planet < Min_mass || mass_planet > 15*mass_Jupiter
%         return
%     end
% end         
%     
    
%% COMPUTATION
%g
g = G*mass_planet/(radius_planet)^2*10^3;
%rho
volume = 4/3*pi*(radius_planet*10^3)^3;
rho = mass_planet/volume;
%velocity_escape km/s
velocity_escape = sqrt(2*G*mass_planet/(radius_planet));
%period
%HP: circular orbit
period_revolution_second = 2*pi*sqrt((distance_planet*AU)^3/(G*mass_star));
period_revolution = period_revolution_second/Year;

%type
if planet_type == 1
    type = "Terrestrial";
else
    type = "Gaseous";
end

%% PLANET STRUCTURE
% radius (km)
PLANET.radius_planet = radius_planet;
% mass (kg)
PLANET.mass_planet = mass_planet;
% distance planet from star (AU)
PLANET.distance_planet = distance_planet;
% gravitational acceleration (m/s)
PLANET.gravitational_acceleration = g;
% planet density (kg/m^3)
PLANET.density = rho;
% escape velocity (km/s^2)
PLANET.velocity_escape = velocity_escape;
% period of revolution (year)
PLANET.period_revolution = period_revolution;
% planet type
PLANET.planet_type = type;

end
    


