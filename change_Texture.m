function [texture_new] = change_Texture(texture,RGB_balance,RGB_hue,k_bright)

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

% Description: function to change tint and brightness of image
%
% texture : input MxNx3 unit8 texture array
% RGB_scaling : 3 element RGB balance values 
% RBG_hue : 3 element RGB_hue addition
% k_bright : Additional brightness addition to texture
%
% Note : set RGB_balance to [1,1,1] for no balancing
% NOTE : set RGB_hue to [0,0,0] for no hue addition
% NOTE : set k_bright = 0.2 (apparently matlab reduces brightness of
% orignal image after extraction from array.
% -------------------------------------------------------------------------

% normalizing the ratios
RGB_balance = RGB_balance/norm(RGB_balance);
RGB_hue = RGB_hue/norm(RGB_hue);

% extracting RGB values
R = texture(:,:,1);
G = texture(:,:,2);
B = texture(:,:,3);

% size of texture data points
[M, N, ~]=size(texture);

texture_new = zeros(M,N,3,'uint8');
R_new = zeros(M,N,'uint8');
G_new = zeros(M,N,'uint8');
B_new = zeros(M,N,'uint8'); 

for i = 1:M
    for j = 1:N
        % adding color balancing
        R(i,j) = R(i,j)*RGB_balance(1);
        G(i,j) = G(i,j)*RGB_balance(2);
        B(i,j) = B(i,j)*RGB_balance(3);
        
        % adding color hue
        R(i,j) = R(i,j) + (255 - R(i,j))*RGB_hue(1);
        G(i,j) = G(i,j) + (255 - G(i,j))*RGB_hue(2);
        B(i,j) = B(i,j) + (255 - B(i,j))*RGB_hue(3);
        
        % adding brightness
        RGB_left = 255 - max([R(i,j),G(i,j),B(i,j)]);
        R(i,j) = R(i,j) + RGB_left*k_bright;
        G(i,j) = G(i,j) + RGB_left*k_bright;
        B(i,j) = B(i,j) + RGB_left*k_bright;
        
        % new texture
        texture_new(i,j,1) = R(i,j);
        texture_new(i,j,2) = G(i,j);
        texture_new(i,j,3) = B(i,j);
    end
end

end

