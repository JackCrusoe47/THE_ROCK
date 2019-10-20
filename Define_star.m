
function STAR = Define_star(R_star, M_star)

% *****************************
% NASA SPACEAPPS CHALLENGE 2019
% *****************************
% 
% AUTHORS:
% Barcelona Moreno, Iván
% Charls, Kevin
% Durán Jiménez, Cristina
% Montenero, Domenico
% Sardelli, Paolo
% -----------------------------------------------------------------------------
% DESCRIPTION:
% 
% INPUTS:
%     R_star              Radius of the star [km]   
%     M_star              Mass of the star [kg]
% 
% OUTPUTS:
%     STAR.L_star         Luminosity of the star [W]
%
%     STAR.T_surf         Surface temperature [K]
%
%     STAR.rho            Density of the star [Kg/m^3]
%
%     STAR.tau_star       Timelife of the star [years]
%
%     STAR.P_core         Pressure in the core [Pa]
%
%     STAR.T_core         Temperature in the core [K]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Physical constants values
G     = phy_const('C01'); % Universal gravitational constant [km^3/(kg*s^2)]
c     = phy_const('C02'); % Speed of light in perfect vacuum [km/s]
K     = phy_const('C03'); % Boltzmann constant [m^2*kg/s^2/K]
sigma = phy_const('C05'); % Stefan–Boltzmann constant [W/m^2/K^4]
M_sun = phy_const('U05'); % Mass of the Sun [kg]
L_sun = phy_const('U14'); % Luminosity of the Sun [W]
m_p   = phy_const('U12'); % Mass of proton [kg]


% Luminosity of the star [W]
L_star   = L_sun * (M_star/M_sun)^3.5;

% Surface temperature[K]
T_surf    = (L_star /(4*pi*(R_star*1e3)^2*sigma))^(1/4);

% Density of the star [kg/m^3]
rho       = M_star/(4/3*pi*(R_star*1e3)^3);

% Timelife of the star [years]
tau_star = M_star*c^2/L_star /3600/24/365.25;

% Pressure in the core [Pa]
P_core   = G *1e9 * M_star^2/(R_star*1e3)^4;

% Temperature in the core [K]
T_core   = m_p * 2/3 *pi*(R_star*1e3)^3* P_core/K/M_star;


T_low=3000; %Lowest possible surface temperature as defined by Hayasi track. [K]
T_upp=30000; %Higuest possible surface temperature in O-type stars that remain bounded to the main sequence. [K]

%Star structure elements:
STAR.luminosity           = L_star; %[W]
STAR.temperature_surface  = T_surf; %[K]
STAR.density              = rho; %[kg/m^3]
STAR.life_time            = tau_star; %[years]
STAR.press_core           = P_core; %[Pa]
STAR.temperature_core     = T_core; %[K]

STAR.mass_lim_low         = 0.2*M_sun; %Lower limit in mass for stars in main sequence [kg]
STAR.mass_lim_upp         = 15*M_sun;  %Upper limit in mass for stars in main sequence [kg]
STAR.radius_lim_low       = sqrt((1e-4*L_sun)/(4*pi*sigma*T_low^4))/1000; %Lower limit in star radius. [km]
STAR.radius_lim_upp       = sqrt((1e6*L_sun)/(4*pi*sigma*T_upp^4))/1000; %Upper limit in star radius. [km]

STAR.radius               =R_star; %Input star radius
STAR.mass               =M_star; %Input star mass

%SPECTRAL TYPE DEFINITION:
if T_surf>30000
    STAR.spec_type='O-type';
    STAR.color=[0 0 0.72];

elseif T_surf>10000 && T_surf<30000
    STAR.spec_type='B-type';
    STAR.color=[0.34 0.36 0.67];
    
elseif T_surf>7500 && T_surf<10000
    STAR.spec_type='A-type';
    STAR.color=[0.58 0.58 0.83];
    
elseif T_surf>6000 && T_surf<7500
    STAR.spec_type='F-type';
    STAR.color=[0.9 0.9 0.9];
    
elseif T_surf>5000 && T_surf<6000
    STAR.spec_type='G-type';
    STAR.color=[0.87 0.87 0.37];
    
elseif T_surf>3500 && T_surf<5000
    STAR.spec_type='K-type';
    STAR.color=[0.91 0.62 0.27];
    
elseif T_surf<3500
    STAR.spec_type='M-type';
    STAR.color=[0.83 0.25 0.25];
 
end

end






