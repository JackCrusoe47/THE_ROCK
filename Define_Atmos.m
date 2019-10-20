function [ATMOSPHERE] = Define_Atmos(STAR,PLANET,ATMOSPHERE)
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
% << Function Description >>
% Function to define atmosphere of the planet
%
% -------------------------------------------------------------------------
% << Prototype >> 
%
% [ATMOSPHERE] = Define_Atmos(PLANET,albedo)
% -------------------------------------------------------------------------
% << Variables >>
%
% STAR : Struct with Star data
% PLANET : Struct with Planet data
% albedo : Albedo value for planet stellar radiation reflection  
% ATMOSPHERE : Struct with Atmospheric data
% -------------------------------------------------------------------------
% << Additional Information >>
%
% -------------------------------------------------------------------------

% Initializing the struct
% ATMOSPHERE = struct();

k = phy_const("C03"); % Boltzmann constant (m^2*kg/s^2/K)
sigma = phy_const("C05"); % Stefan–Boltzmann constant (W/m^2/K^4)
AU = phy_const("U01"); % Astronomical Unit (km)

% creating speceies structure
SPECIES = AtmosphericSpecies();

% Escape velocity of planet (km/s)
v_esc = PLANET.velocity_escape;

% Distance of planet from star (m)
r = PLANET.distance_planet * AU * 1000; 

% Luminosity of Star (W)
L = STAR.luminosity; 

% Intensity or Flux of radiation arriving at planet (W/m^2)
I = L/(4*pi*r^2);

albedo=ATMOSPHERE.albedo;
% Temprature at planet stuface (from solar flux) (K)
T = (I*(1-albedo)/(4*sigma))^(1/4);

% computation of energies of speceis
for i = 1:size(SPECIES,2)
    
    m = SPECIES(i).mass;
    
    % Thermal velocity of species (km/s)
    v_thermal = sqrt(2*k*T/m)/1000; 
    
    % Assuming a max velocity for Maxwell-Boltzmann distribution (km/s)
    v_max =  v_thermal*5;
    
    % Maxwell-Boltzmann distribution function
    f_maxwell = @(v) 4*pi*v.^2 .* (m/(2*pi*k*T))^(3/2) .* exp(-m*v.^2./(2*k*T));
    
    % The idea is any gas with thermal velocity above sixth of escape
    % velocity is considered lost by kinetic atmospheric escape. This
    % definition is used to define the type of gases possible in
    % atmosphere in a pure Radiative case. Of course this does not take
    % into account the effect of magnetic fields, solar wind, acctual
    % thickness of atmosphere, ect...
    
    v_ratio = 1/6;
    
    v_lim_upper = v_max*1000; % upper limit of MW distribution (m/s)
    v_lim_thresh = v_esc*1000 * v_ratio; % threshold velocity of MW distribution(m/s)
    
    % Amount of particles with velocity above threshold (%)
    amount_escape = (integral(f_maxwell,v_lim_thresh,v_lim_upper)) / (integral(f_maxwell,0,v_lim_upper));
    if amount_escape < 0
        amount_escape = 0;
    end
    SPECIES(i).amount_remain = 1 - amount_escape;
    SPECIES(i).amount_lost = amount_escape;
    SPECIES(i).velocity_thermal = v_thermal;
    
end

ATMOSPHERE.temprature = T; % Surface Temprature (K)
ATMOSPHERE.SPECIES = SPECIES;



