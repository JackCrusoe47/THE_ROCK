%{
*****************************
NASA SPACEAPPS CHALLENGE 2019
*****************************

AUTHORS:
Barcelona Moreno, Iván
Charls, Kevin
Durán Jiménez, Cristina
Montenero, Domenico
Sardelli, Paolo Alessandro
-----------------------------------------------------------------------------
DESCRIPTION:

INPUTS:
    SYSTEM[struct]

OUTPUTS:
    STAR[struct]

FUNCTIONS REQUIRED:
    -phy_const
    -solar_wind


-----------------------------------------------------------------------------
%}
function SYSTEM=Define_system(STAR)

%HELIOPAUSE (star system upper bond):
mp=phy_const("U12");
me=phy_const("U13");
G=phy_const("C01"); %[km^3....]
k=phy_const("C03")/1e6; %[km^2]
sigma=phy_const("C05");
Msun=phy_const("U05"); %[kg]


T_surf=STAR.temperature_surface; %[kg]
T_plasm=1.5e5; %[K]-->Plasma temperature reference
Mstar=STAR.mass; %[kg]
Rstar=STAR.radius; %[km]
Lstar=STAR.luminosity; %[W]

m=mp+me; %[kg]
rc=G*Mstar*m/(4*k*T_plasm); %Critical radius for equivalence in the equation of solar wind [km]
mass_loss=1e9*sigma*T_surf^4; %Mass loss rate, defined according to mass turned into energy, by a constant accounting for non linear effects:
%coronal mass ejection, solar storm... [kg/s]

r1=phy_const("U01"); %Test distance at 1AU [km]
u0=100; %Initialization speed wind speed [km/s]
u1=fzero(@(u) solar_wind(u,r1,rc,T_plasm,m,STAR),u0); %Solar speed at 1AU [km/s]

SYSTEM.vinf=u1/(1-Rstar/r1);%Terminal speed of solar wind at the edge of the system

%Calculation of the critical radius: pressure equilibrium between solar
%wind and ISM (interstellas pressure)
AU=r1;
SYSTEM.radius_helio = AU*311*(mass_loss/(1e-14*Msun))^(1/2)*(SYSTEM.vinf/400)^(1/2);

SYSTEM.radius_crit=(1/2*SYSTEM.radius_helio)/AU; %Last possible distance where a planet can be present in the system [AU]

%%
%FROST LINE:
Lstar = STAR.luminosity;
Lsun =  phy_const("U14"); %[W]
Rast =  phy_const("U16"); %[AU]

SYSTEM.radius_frost=sqrt(Lstar/Lsun)*Rast; %[AU]

%%
%HABITABILITY REGION:
Rhab_sol_min=phy_const("U17"); %[AU]
Rhab_sol_upp=phy_const("U18"); %[AU]

SYSTEM.radius_hab_min=sqrt(Lstar/Lsun)*Rhab_sol_min; %[AU]
SYSTEM.radius_hab_max=sqrt(Lstar/Lsun)*Rhab_sol_upp; %[AU]
%%
%MELTING POINT (star system lower bound):
T_ref=1000; %K
Ab_ref=0.1; %Reference albedo for a Mercury like planet
I0=4*sigma*T_ref^4/(1-Ab_ref); %Energy intensity at reference distance

SYSTEM.radius_min=sqrt(Lstar/(I0*4*pi))/1000/AU; %Nearest possible distance at which the planet can be present in the star system [AU]

end