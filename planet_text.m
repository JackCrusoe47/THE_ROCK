function tp=planet_text(PLANET,ATMOSPHERE,planet_type)

if planet_type==1 %Rocky planet
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ptr=0;
        for i=1:8 %Go through all the components

            if ATMOSPHERE.SPECIES(i).amount_remain>0
                ptr=ptr+1;
            end
        end

        if ptr>=5 %Kind of atmosphere present (in a rough way) depending on the amount of components present
            atm_type='THICK';
        elseif ptr==0
            atm_type='NO';
        else
            atm_type='THIN';
        end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
    
tp={'**********************'
    'PLANET TYPE: Rocky '
    '**********************'
    sprintf('ACCELERATION GRAVITY (m/s^2): %d',PLANET.gravitational_acceleration)
    sprintf('AVERAGE DENSITY (kg/m^3): %d',PLANET.density)
    sprintf('REVOLUTION PERIOD (y): %d',PLANET.period_revolution)
    ' '
    sprintf('ATMOSPHERE PRESENCE: %s',atm_type)
    sprintf('ATMOSPHERE AVERAGE TEMPERATURE: %d K',ATMOSPHERE.temprature)
    'ATMOSPHERE PROBABLE COMPONENTS: '
    sprintf('Probability H2: %d %',ATMOSPHERE.SPECIES(1).amount_remain*100)
    sprintf('Probability He: %d %',ATMOSPHERE.SPECIES(2).amount_remain*100)%percent of H2 present probability
    sprintf('Probability CH4: %d %',ATMOSPHERE.SPECIES(3).amount_remain*100)
    sprintf('Probability NH3: %d %',ATMOSPHERE.SPECIES(4).amount_remain*100)
    sprintf('Probability H2O: %d %',ATMOSPHERE.SPECIES(5).amount_remain*100)
    sprintf('Probability N2: %d %',ATMOSPHERE.SPECIES(6).amount_remain*100)
    sprintf('Probability O2: %d %',ATMOSPHERE.SPECIES(7).amount_remain*100)
    sprintf('Probability CO2: %d %',ATMOSPHERE.SPECIES(8).amount_remain*100)
%     ' '
%     'PLANET SURFACE COVERING: '
%     sprintf('Glacial ice: %d %',SURFACES(1).amount*100)
%     sprintf('Fresh snow: %d %',SURFACES(2).amount*100)
%     sprintf('Red sand: %d %',SURFACES(3).amount*100)
%     sprintf('Liquid water: %d %',SURFACES(4).amount*100)
%     sprintf('Dark regolith: %d %',SURFACES(5).amount*100)
%     sprintf('Gray regolith: %d %',SURFACES(6).amount*100)
%     sprintf('White surface: %d %',SURFACES(7).amount*100)
%     sprintf('Clay soil: %d %',SURFACES(8).amount*100)
%     sprintf('Gas jovian: %d %',SURFACES(9).amount*100)
%     sprintf('Gas saturnian: %d %',SURFACES(10).amount*100)
    '**********************'
    'DESCRIPTION: '
    'Metallic core mostly made of iron and nickel, with a series of silicate layers'
    'surrounding the nucleus, as well as a compact rocky surface. Typically inert'
    'but with internal radioactive activity giving rise to volcanism in most cases.'
    'Smaller in size than gaseous planets, if in the habitable region they can be'
    'candidates to sustain life. Depending on the effect of the solar wind, they can'
    'have lost their atmosphere.'};

elseif planet_type==0 %Gaseous planet
    
tp={'**********************'
    'PLANET TYPE: Gaseous '
    '**********************'
    sprintf('ACCELERATION GRAVITY (m/s^2): %d',PLANET.gravitational_acceleration)
    sprintf('AVERAGE DENSITY (kg/m^3): %d',PLANET.density)
    sprintf('REVOLUTION PERIOD (y): %d',PLANET.period_revolution)
    ' '
    'ATMOSPHERE PRESENCE: YES'
    sprintf('ATMOSPHERE AVERAGE TEMPERATURE: %d K',ATMOSPHERE.temprature)
    'ATMOSPHERE PROBABLE COMPONENTS: '
    sprintf('Probability H2: %d %',ATMOSPHERE.SPECIES(1).amount_remain*100)
    sprintf('Probability He: %d %',ATMOSPHERE.SPECIES(2).amount_remain*100)%percent of H2 present probability
    sprintf('Probability CH4: %d %',ATMOSPHERE.SPECIES(3).amount_remain*100)
    sprintf('Probability NH3: %d %',ATMOSPHERE.SPECIES(4).amount_remain*100)
    sprintf('Probability H2O: %d %',ATMOSPHERE.SPECIES(5).amount_remain*100)
    sprintf('Probability N2: %d %',ATMOSPHERE.SPECIES(6).amount_remain*100)
    sprintf('Probability O2: %d %',ATMOSPHERE.SPECIES(7).amount_remain*100)
    sprintf('Probability CO2: %d %',ATMOSPHERE.SPECIES(8).amount_remain*100)
%     ' '
%     'PLANET SURFACE COVERING: '
%     sprintf('Glacial ice: %d %',SURFACES(1).amount*100)
%     sprintf('Fresh snow: %d %',SURFACES(2).amount*100)
%     sprintf('Red sand: %d %',SURFACES(3).amount*100)
%     sprintf('Liquid water: %d %',SURFACES(4).amount*100)
%     sprintf('Dark regolith: %d %',SURFACES(5).amount*100)
%     sprintf('Gray regolith: %d %',SURFACES(6).amount*100)
%     sprintf('White surface: %d %',SURFACES(7).amount*100)
%     sprintf('Clay soil: %d %',SURFACES(8).amount*100)
%     sprintf('Gas jovian: %d %',SURFACES(9).amount*100)
%     sprintf('Gas saturnian: %d %',SURFACES(10).amount*100)
    '**********************'
    'DESCRIPTION: '
    'They have a much lower density. Their cores are rocky, but very small compared'
    'to the planet''s size. The mantle is very thick and usually made of metallic hydrogen'
    'due to the extreme pressure. A huge magnetic field is generated, and they are usually'
    'surrounded by a system of rings. Hidrogen, helium, ammonia and methane are the major'
    'components of its atmosphere. The core temperature is very high, but not enough to'
    'start the reactions typical of a star. Accreting material has led to the formation of'
    'several natural moons'};

end
        
end