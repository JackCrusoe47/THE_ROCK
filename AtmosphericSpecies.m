function SPECIES = AtmosphericSpecies()
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
% Function with defintion of all atmospheric species considered
% Additional infromation like presence and if possible concentration will
% be added to this struct for the given planet
% -------------------------------------------------------------------------
% << Prototype >> 
%
% SPECIES = AtmosphericSpecies()
% -------------------------------------------------------------------------
% << Variables >>
%
% SPECIES : Strcut with all atmospheric species considered
% -------------------------------------------------------------------------
% << Additional Information >>
%
% -------------------------------------------------------------------------

% Atomic mass unit (kg)
amu =  phy_const("U11");

% Initializing struct SPECIES
SPECIES = struct();

ptr = 1;

SPECIES(ptr).name = "H2";
SPECIES(ptr).mass = 2.01588*amu;
ptr = ptr + 1;

SPECIES(ptr).name = "He";
SPECIES(ptr).mass = 4.0026*amu;
ptr = ptr + 1;

SPECIES(ptr).name = "CH4";
SPECIES(ptr).mass = 16.04246*amu;
ptr = ptr + 1;

SPECIES(ptr).name = "NH3";
SPECIES(ptr).mass = 17.03052*amu;
ptr = ptr + 1;

SPECIES(ptr).name = "H2O";
SPECIES(ptr).mass = 18.01528*amu;
ptr = ptr + 1;

SPECIES(ptr).name = "N2";
SPECIES(ptr).mass = 28.014*amu;
ptr = ptr + 1;

SPECIES(ptr).name = "O2";
SPECIES(ptr).mass = 31.9988*amu;
ptr = ptr + 1;

SPECIES(ptr).name = "CO2";
SPECIES(ptr).mass = 44.0095*amu;

end