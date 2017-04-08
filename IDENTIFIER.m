% IDENTIFIER
clear, clc;
myev3 = legoev3('USB');
motorA = motor(myev3, 'A');
motorB = motor(myev3, 'B');
motorA.Speed = 20;
ColorSensor1 = colorSensor(myev3, 1);
ColorSensor2 = colorSensor(myev3, 2);
motorB.Speed = 15;


color = input('Input color or materials: ', 's'); % lowercase only (red, blue, ..., steel_hdpe)
howMany1 = input('Input quantity type1: '); % large (or steel)
howMany2 = input('Input quantity type2: '); % small (or HDPE)... 
% STEEL AND HDPE HAVE NOT BEEN IMPLEMENTED YET!

total = howMany1 + howMany2;

while (howMany1 ~= 0 && howMany2 ~= 0)    
    if (mod(i, 2) == 1)    
        if (howMany1 > 0)
            start(motorA);
            motorB.Speed = -15;
            start(motorB);
            
            COLOR = readColorr(myev3, 1, ColorSensor1);
            if (isequal(color, COLOR))
                pause(2.2);
                howMany1 = howMany1 - 1;
                stop(motorA);
                stop(motorB);
                motorB.Speed = 15;
            else
                motorA.Speed = -20;
                pause(2.5);
                motorA.Speed = 20;
            end
            
        end % big
    
    else % mod    
        if (howMany2 > 0)
            start(motorB);
            motorA.Speed = -20;
            start(motorA);
            
            COLOR = readColorr(myev3, 2, ColorSensor2);
            if (isequal(color, COLOR))
                pause(2.2);
                howMany2 = howMany2 - 1;
                stop(motorA);
                stop(motorB);
                motorA.Speed = 20;
            else
                motorB.Speed = -15;
                pause(4);
                motorB.Speed = 15;            
            end
        
        end % small
        
    end % mod if
end % for loop

fprintf('Done...\n\n\n\n also fuck you in the butt\n');
