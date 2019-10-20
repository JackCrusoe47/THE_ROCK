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

function SURFACES = SurfaceAlbedos(user_selection)
% List of surface albedo types

% Initializing struct SURFACES
SURFACES = struct();

ptr = 1;

SURFACES(ptr).name = "Glacial Ice";
SURFACES(ptr).albedo = 0.35;
SURFACES(ptr).amount = user_selection(1)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "Fresh Snow";
SURFACES(ptr).albedo = 0.9;
SURFACES(ptr).amount = user_selection(2)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "Red Sand";
SURFACES(ptr).albedo = 0.25;
SURFACES(ptr).amount = user_selection(3)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "Liquid Water";
SURFACES(ptr).albedo = 0.5;
SURFACES(ptr).amount = user_selection(4)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "Dark Regolith";
SURFACES(ptr).albedo = 0.05;
SURFACES(ptr).amount = user_selection(5)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "Gray Regolith";
SURFACES(ptr).albedo = 0.15;
SURFACES(ptr).amount = user_selection(6)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "White Surface";
SURFACES(ptr).albedo = 0.9;
SURFACES(ptr).amount = user_selection(7)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "Clay Soil";
SURFACES(ptr).albedo = 0.35;
SURFACES(ptr).amount = user_selection(8)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "Gas Jovian";
SURFACES(ptr).albedo = 0.5;
SURFACES(ptr).amount = user_selection(9)/100;
ptr = ptr + 1;

SURFACES(ptr).name = "Gas Saturnian";
SURFACES(ptr).albedo = 0.35;
SURFACES(ptr).amount = user_selection(10)/100;

end

