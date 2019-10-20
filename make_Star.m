function make_Star(STAR,fig_object)
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

texture_photo = imread('photosphere_white.jpg');
texture_chromo = imread('chromosphere_white.jpg');
texture_corona = imread('Corona_white.jpg');


% radius of Star
r = STAR.radius/phy_const("U06");

% figure settings
axis (fig_object, 'equal'); % setting axes equal
fig_object.Clipping = 'off';    % turn clipping off
xlim(fig_object,[-2*r,2*r]);
ylim(fig_object,[-2*r,2*r]);
zlim(fig_object,[-2*r,2*r]);
xlabel(fig_object,'x axis (Solar radii)')
ylabel(fig_object,'y axis (Solar radii)')
zlabel(fig_object,'z axis (Solar radii)')

% Spectral color grading
switch STAR.spec_type
    case 'O-type'
        texture_photo = change_Texture(texture_photo,[0.34 0.36 1.85],[0,0,0],1.2);
        texture_chromo = change_Texture(texture_chromo,[0.34 0.36 1.45],[0,0,0],1.2);
        texture_corona = change_Texture(texture_corona,[0.1,0.1,0.1],[0,0,0],2);
    case 'B-type'
        texture_photo = change_Texture(texture_photo,[0.34 0.36 0.85],[0,0,0],1.2);
        texture_chromo = change_Texture(texture_chromo,[0.34 0.36 0.67],[0,0,0],1.2);
        texture_corona = change_Texture(texture_corona,[0.1,0.1,0.1],[0,0,0],2);
    case 'A-type'
        texture_photo = change_Texture(texture_photo,[0.58 0.58 0.61],[0,0,0],1.2);
        texture_chromo = change_Texture(texture_chromo,[0.58 0.58 0.6],[0,0,0],1.1);
        texture_corona = change_Texture(texture_corona,[0.1,0.1,0.1],[0,0,0],2.5);
    case 'F-type'
        texture_photo = change_Texture(texture_photo,[1. 0.98 0.65],[0,0,0],1.2);
        texture_chromo = change_Texture(texture_chromo,[0.93 0.90 0.1],[0,0,0],1.1);
        texture_corona = change_Texture(texture_corona,[0.2,0.1,0.1],[0,0,0],1.5);
    case 'G-type'
        texture_photo = change_Texture(texture_photo,[1.5 0.95 0.10],[0,0,0],1.2);
        texture_chromo = change_Texture(texture_chromo,[0.98 0.90 0.1],[0,0,0],1.1);
        texture_corona = change_Texture(texture_corona,[0.2,0.1,0.1],[0,0,0],1.5);
    case 'K-type'
        texture_photo = change_Texture(texture_photo,[1.5 0.5 0.10],[0,0,0],1.2);
        texture_chromo = change_Texture(texture_chromo,[1.2 0.4 0.1],[0,0,0],1.1);
        texture_corona = change_Texture(texture_corona,[0.2,0.1,0.1],[0,0,0],1.5);
    case 'M-type'
        texture_photo = change_Texture(texture_photo,[0.99 0.4 0.1],[0,0,0],1.2);
        texture_chromo = change_Texture(texture_chromo,[0.95 0.1 0.1],[0,0,0],1.1);
        texture_corona = change_Texture(texture_corona,[0.95,0.3,0.1],[0.01,0,0],1.2);
end

% generic sphere with points
[rx ,ry ,rz] = sphere(100);


rx_photo = rx*r; ry_photo = ry*r; rz_photo = rz*r; % Scaling Sphere cords
star_photo = surf(fig_object, rx_photo, ry_photo, rz_photo, 'EdgeColor','none','FaceColor','g' );
set(star_photo,'CData',texture_photo,'FaceColor','texturemap');
hold (fig_object, 'on'); 

rx_chromo = rx*r*1.1; ry_chromo = ry*r*1.1; rz_chromo = rz*r*1.1;
star_chromo = surf(fig_object, rx_chromo, ry_chromo, rz_chromo, 'EdgeColor','none','FaceColor','g' );
alpha(star_chromo,0.5);
set(star_chromo,'CData',texture_chromo,'FaceColor','texturemap');

rx_corona = rx*r*1.5; ry_corona = ry*r*1.5; rz_corona = rz*r*1.5;
star_corona= surf(fig_object, rx_corona, ry_corona, rz_corona, 'EdgeColor','none','FaceColor','g' );
alpha(star_corona,0.05);
set(star_corona,'CData',texture_corona,'FaceColor','texturemap');

hold (fig_object, 'off'); 

end