function [] = make_System(STAR,SYSTEM,PLANET,fig_object)
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

% function to plot a planetary system around the star as defined along with
% bands and limits of given stellar system

star_name = sprintf('%s Star',STAR.spec_type);
planet_name = sprintf('%s Planet',PLANET.planet_type);

theta = 0:pi/50:2*pi;

% cords of planetary orbit
r_planet = PLANET.distance_planet * [cos(theta)' , sin(theta)']'; 

% cords of system limits
r_min = SYSTEM.radius_min * [cos(theta)' , sin(theta)']';

% cords of frost line
r_frost = SYSTEM.radius_frost * [cos(theta)' , sin(theta)']';

% cords of habitability limits
r_hab_min = SYSTEM.radius_hab_min * [cos(theta)' , sin(theta)']';
r_hab_max = SYSTEM.radius_hab_max * [cos(theta)' , sin(theta)']';

fig_object.Clipping = 'off';    % turn clipping off
xlabel(fig_object,'Distance (AU)');
ylabel(fig_object,'Distance (AU)');

% ploting star
plot(fig_object,0,0,'*g','HandleVisibility','off');
text(fig_object,0,0,star_name,'Color','k','VerticalAlignment','bottom');
hold (fig_object, 'on'); 

% ploting planet
plot(fig_object,r_planet(1,:),r_planet(2,:),'b');
plot(fig_object,r_planet(1,1),r_planet(2,1),'.g','HandleVisibility','off');
text(fig_object,r_planet(1,1),r_planet(2,1),planet_name,'Color','k','VerticalAlignment','top');

% ploting system limits
plot(fig_object,r_min(1,:),r_min(2,:),'--r');

% ploting frost line
plot(fig_object,r_frost(1,:),r_frost(2,:),'w');

% ploting habitability limits
plot(fig_object,r_hab_min(1,:),r_hab_min(2,:),'y');
plot(fig_object,r_hab_max(1,:),r_hab_max(2,:),'y');

legend(fig_object,'Planet Orbit','Inner limit','Frost line','Habitability limits');

hold (fig_object,'off');

end