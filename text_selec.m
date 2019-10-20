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

function [tt,im]=text_selec(STAR)

    if isequal(STAR.spec_type,'O-type')

        tt={'You have an O-type star!.'
        ' '
        'INTRINSIC COLOUR: Blue'
        'SURFACE TEMPERATURE:  from 30000 to 52000 K'
        'TYPICAL RADIATION EMISSION: UV radiation'
        'IMPORTANT SPECTRAL LINES: H, He, He++,O++,Si++,Ni++'
        ' '
        'DESCRIPTION:'
        'Stars of this type are particularly rare; only 0.00002% (1 in 5,000,000) to'
        '0.00005% (1 in 2,000,000) of all stars are O-type but due to their brightness they' 
        'can be easily seen from the Earth. Due to their high mass, O-type star has a' 
        'short lifetime which ends in violent supernova explosions, resulting in black holes or neutron stars.'
        'Example: Nebula IC 405 around AE Aurigae'};
    
        im='Image_stars\O_STAR___AE Aurigae.jpg';

    elseif isequal(STAR.spec_type,'B-type')

        tt={'You have an B-type star!.'
            ' '
        'INTRINSIC COLOUR: Blue'
        'SURFACE TEMPERATURE:  from 10000 and 30000 K'
        'TYPICAL RADIATION EMISSION: UV radiation'
        'IMPORTANT SPECTRAL LINES: He, H, O+, C+, N+, Si+'
        ' '
        'DESCRIPTION:'
        'These stars typically have from 2 to 16 times the mass of the Sun. Type-B stars do not '
        'have a corona and lack a convection zone in their outer atmosphere. They have '
        'a higher mass loss rate than smaller stars such as the Sun, and their stellar '
        'wind has velocities of about 3000 km/s. These stars tend torotate at a curiously rapid rate.'
        'Example: Regulus'};
    
        im='Image_stars\B-STAR__Regulus.jpg';


    elseif isequal(STAR.spec_type,'A-type')

        tt={'You have an A-type star!.'
            ' '
        'INTRINSIC COLOUR: Blue-white'
        'SURFACE TEMPERATURE:  from 7600 and 10000  K '
        'TYPICAL RADIATION EMISSION: UV radiation'
        'IMPORTANT SPECTRAL LINES: H(strongest), Ca+, Mg+, Fe+'
        ' '
        'DESCRIPTION: '
        'They have masses from 1.4 to 2.1 times the mass of the Sun. A-type stars do'
        'not have a convective zone and a magnetic dynamo can not take place. As a '
        'consequence, because they do not have strong stellar winds they lack a means '
        'to generate X-ray emission. '
        'Example: Altair'};
    
        im='Image_stars\A-STAR__Altair.jpg';


    elseif isequal(STAR.spec_type,'F-type')

        tt={'You have an F-type star!.'
            ' '
        'INTRINSIC COLOUR: White'
        'SURFACE TEMPERATURE: from 6000 and 7600 K'
        'TYPICAL RADIATION EMISSION: visible radiation - UV radiation'
        'IMPORTANT SPECTRAL LINES: H(weaker), Ca+, ionized metals'
        ' '
        'DESCRIPTION:' 
        'Hydrogen-fusing compact star. These stars have from 1.0 to 1.4 times the mass' 
        'of the Sun. Some studies show that there is a possibility that life could' 
        'also develop on planets that orbit a F-type star. However, relative to a' 
        'G-type star the main problems for a hypothetical lifeform in this particular' 
        'scenario would be the more intense light and the shorter stellar lifespan of' 
        'the home star.'
        'Example: Procyon'};
    
        im='Image_stars\F-STAR__Procyon.jpg';


    elseif isequal(STAR.spec_type,'G-type')

        tt={'You have an G-type star!.'
            ' '
        'INTRINSIC COLOUR: Yellow-white'
        'SURFACE TEMPERATURE: 5300 and 6000 K' 
        'TYPICAL RADIATION EMISSION: visible radiation'
        'IMPORTANT SPECTRAL LINES: H(weaker), Ca+, ionized & neutral metal'
        ' '
        'DESCRIPTION:'
        'A G-type main-sequence star is converting the element hydrogen to helium in' 
        'its core by means of nuclear fusion. G-type stars actually range in color' 
        'from white, for more luminous types like the Sun, to only very slightly yellow' 
        'for the less massive and luminous G-type main-sequence stars. The Sun is in' 
        'fact white, and its spectrum peaks in blue and green light, but it can often' 
        'appear yellow, orange or red through Earth''s atmosphere due to atmospheric' 
        'Rayleigh scattering, especially at sunrise and sunset. Yellow dwarfs like' 
        'the Sun outshine 90% of the stars in the Milky Way.'
        'Example: Sun'};
    
        im='Image_stars\G_Star_SUN.jpg';


    elseif isequal(STAR.spec_type,'K-type')

        tt={'You have an K-type star!.'
            ' '
        'INTRINSIC COLOUR: Orange'
        'SURFACE TEMPERATURE: from 3900 and 5200 K'
        'TYPICAL RADIATION EMISSION: visible radiation'
        'IMPORTANT SPECTRAL LINES: Ca+(strongest), neutral metals strong, H(weak)'
        ' '
        'DESCRIPTION:' 
        'These stars are intermediate in size between red M-type main-sequence stars '
        '("red dwarfs") and yellow G-type main-sequence stars. They have masses between' 
        '0.5 and 0.8 times the mass of the Sun. These stars are of particular interest' 
        'in the search for extraterrestrial life because they are stable on the main' 
        'sequence for a very long time (20 to 70 billion years). they tend to have a '
        'very small mass, leading to their extremely long lifespan that offers plenty '
        'of time for life to develop on orbiting Earth-like, terrestrial planets. In' 
        'addition, K-type stars emit less ultraviolet radiation (which can damage DNA' 
        'and thus hamper the emergence of nucleic acid based life) than G-type stars' 
        'like the Sun. K-type main-sequence stars are also about three to four times' 
        'as abundant as G-type main-sequence stars.'
        'Example:Alpha Centauri AB'};
    
        im='Image_stars\K-STAR__Alpha_Centauri_AB.jpg';


    elseif isequal(STAR.spec_type,'M-type')

        tt={'You have an M-type star!.'
            ' '
        'INTRINSIC COLOUR: Red'
        'SURFACE TEMPERATURE: from 3000 to 3900 K'
        'TYPICAL RADIATION EMISSION: IF radiation'
        'IMPORTANT SPECTRAL LINES: Strong neutral atoms, TiO'
        ' '
        'DESCRIPTION: '
        'Class M stars are by far the most common. About 76% of the main-sequence '
        'stars in the solar neighborhood are class M stars. However, class M main-sequence '
        'stars (red dwarfs) have such low luminosities that none are bright enough '
        'to be seen with the unaided eye, unless under exceptional conditions. They '
        'are more likely to have tidally locked planets in orbit and are more prone '
        'to produce solar flares that would more easily strike nearby rocky planets, '
        'making it much harder for life to develop. '
        'Example: Beta Andromeda'};
    
        im='Image_stars\M-STAR__Beta_Andromeda.jpg';

    end

end