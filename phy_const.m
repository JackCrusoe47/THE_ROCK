function [const] = phy_const(id)
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

% << Function Description >>
% Function containing physical constants used in astrophysics with the
% highest accuracy currently avaliable (check last update)
%
% Note : Units of length (distance) in "km", NOT "m" ! Done for ease of
% computation in orbital dynamics problems.
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% << Prototype >> 
%
% [const] = phy_const(id)
% -------------------------------------------------------------------------
% << Variables >>
%
% id : Specific ID of required constant
% const : the neumerical value of specified constant
% -------------------------------------------------------------------------
% << Additional Information >>
%
% ID values of Constants
%
% C01 : Universal gravitational constant ( km^3/(kg*s^2) )
% C02 : Speed of light in perfect vacuum ( km/s )
% C03 : Boltzmann constant (m^2*kg/s^2/K)
% C04 : Universal gas constant (J/K/mol)
% C05 : Stefan–Boltzmann constant (W/m^2/K^4)
% C06 : Planks-constant (J*s)
%
% U01 : Astronomical Unit (km)
% U02 : Light Year (km)
% U03 : Parsec (km)
% U04 : Hubble Length (km)
%
% U05 : Solar Mass M? (kg)
% U06 : Solar Radius R? (km)
% U07 : Mass of Jupiter M? (kg)
% U08 : Radius of Jupiter R? (km)
% U09 : Earth Mass M? (kg)
% U10 : Earth Radius M? (km)
%
% U11 : Atomic Mass Unit (kg)
% U12 : Mass of Proton (kg)
% U13 : Mass of Electron (kg)
% U14 : Solar Luminosity (W)
%
% U15 : Year (s)
% U16 : Asteroid belt distance from Sun (upper limit) (AU)
% U17 : Minimum habitability radius [AU]
% U18 : Maximum habitability radius [AU]
% -------------------------------------------------------------------------
% << Required Subfunctions >>
%
% None
% -------------------------------------------------------------------------

% Astronomical Constants
switch(id)
    
    case "C01" % Universal gravitational constant ( km^3/(kg*s^2) )
        const = 0.5 * ( 6.674184e-20 + 6.674484e-20 ); 
        % Ref : Qing L et al 2018. Measurements of the gravitational constant using two independent methods. Nature. 560.
    case "C02" % Speed of light in perfect vacuum ( km/s )
        const = 299792.458 ;
        % Ref : "Base unit definitions: Second", www.physics.nist.gov. Retrieved April 7, 2018
    case "C03" % Boltzmann constant (m^2*kg/s^2/K)
        const = 1.38064852e-23;
    case "C04" % Universal gas constant (J/K/mol)
        const = 8.3144621;
    case "C05" % Stefan–Boltzmann constant (W/m^2/K^4)
        const = 5.670374419e-8;
    case "C06" % Planks-constant (J*s)
        const = 6.62607015e-34;
        
    case "U01" % Astronomical Unit (km)
        const = 149597870.7;
    case "U02" % Light Year (km)
        const = 9460730472580.8;
    case "U03" % Parsec (km)
        const = 648000/pi * 149597870.7;
    case "U04" % Hubble Length (km)
        const = 4228e6 * 648000/pi * 149597870.7;
        
    case "U05" % Solar Mass M? (kg)
        const = 1.98847e30;
    case "U06" % Solar Radius R? (km)
        const = 695700;
    case "U07" % Mass of Jupiter M? (kg)
        const = 1.89813e27;
    case "U08" % Radius of Jupiter R? (km)
        const = 69911;
    case "U09" % Earth Mass M? (kg)
        const = 5.97237e24;
    case "U10" % Earth Radius M? (km)
        const = 6371;
        
    case "U11" % Atomic Mass Unit (kg)
        const = 1.661e-27;
    case "U12" % Mass of Proton (kg)
        const = 1.672621e-27;
    case "U13" % Mass of Electron (kg)
        const = 9.109383e-31;
    case "U14" % Solar Luminosity (W)
        const = 3.828e26;
        
    case "U15" % Year (s)
        const = 365.242190*24*3600;
    case "U16"
        const = 3.2; % Asteroid belt distance from Sun (upper limit) (AU)
    case "U17"
        const = 0.95; % Minimum habitability radius [AU]
    case "U18"
        const = 2.4; % Maximum habitability radius [AU]
end

end