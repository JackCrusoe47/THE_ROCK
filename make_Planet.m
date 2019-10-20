function [] = make_Planet(PLANET,SURFACES,fig_object)
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

% geting planet radius (earth radii)
r = PLANET.radius/phy_const("U10");

% figure settings
axis (fig_object, 'equal'); % setting axes equal
xlim(fig_object,[-2*r,2*r]);
ylim(fig_object,[-2*r,2*r]);
zlim(fig_object,[-2*r,2*r]);
xlabel(fig_object,'x-axis (earth radii)');
ylabel(fig_object,'y-axis (earth radii)');
zlabel(fig_object,'z-axis (earth radii)');

% Spectral color grading
switch PLANET.planet_type
    case "Terrestrial"
        texture = imread('planet_tera');
    case "Gaseous"
        texture = imread('planet_gas');
end

% generic sphere with points
[rx ,ry ,rz] = sphere(100);

rx_planet = rx*r; ry_photo = ry*r; rz_photo = rz*r; % Scaling Sphere cords
star_photo = surf(fig_object, rx_planet, ry_photo, rz_photo, 'EdgeColor','none','FaceColor','g' );
set(star_photo,'CData',texture,'FaceColor','texturemap');

hold (fig_object, 'on'); 

% setting cam view
campos(fig_object,[2*r,2*r,2*r]);
camtarget(fig_object,[0,0,0]);

hold (fig_object, 'off'); 

end