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
DESCRIPTION: computing of the average bond albedo in the planet surface

INPUTS:
    SYSTEM
    PLANET
    SURFACES

OUTPUTS:
    ATMOSPHERE

FUNCTIONS REQUIRED:
 None
-----------------------------------------------------------------------------
%}

function ATMOSPHERE = Compute_Albedo(SYSTEM,PLANET,SURFACES)

amount_sum = 0; % initialization
amount_albedo = 0;

if PLANET.distance_planet<SYSTEM.radius_hab_min
    SURFACES(1).amount = 0; % Setting Ice amount to zero
    SURFACES(2).amount = 0; % Setting Snow amount to zero
end

for i = 1:size(SURFACES,2)
    amount_sum = amount_sum + SURFACES(i).amount;
    amount_albedo = amount_albedo + SURFACES(i).amount*SURFACES(i).albedo;
end

ATMOSPHERE.albedo = amount_albedo/amount_sum;

end