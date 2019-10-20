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
% -------------------------------------------------------------------------

function y=solar_wind(u,r,rc,T_plasm,m,STAR)
k = phy_const("C03")/1e6; %[km^2...]
G=phy_const("C01"); %[km^3...]
Mstar=STAR.mass; %[kg]

y=u^2-2*k*T_plasm/m-2*k*T_plasm/m*log(m*u^2/(2*k*T_plasm))-8*k*T_plasm/m*log(r/rc)-2*G*Mstar*(1/r-1/rc);
% y=u-2*(2*k*T_plasm/m)^(1/2)*(log(r/rc))^(1/2);
end