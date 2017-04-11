% IDENTIFIER
clear, clc;
myev3 = legoev3('USB');
motorA = motor(myev3, 'A');
motorB = motor(myev3, 'B');
motorA.Speed = 20;
ColorSensor1 = colorSensor(myev3, 1);
ColorSensor2 = colorSensor(myev3, 2);
motorB.Speed = 30;


color = input('Input color or materials: ', 's'); % lowercase only (red, blue, ..., steel_hdpe)
howMany1 = input('Input quantity type1: '); % large (or steel)
howMany2 = input('Input quantity type2: '); % small (or HDPE)... 
% STEEL AND HDPE HAVE NOT BEEN IMPLEMENTED YET (mostly because idfk know how)

total = howMany1 + howMany2;

while (howMany1 ~= 0 || howMany2 ~= 0)        
    if (howMany1 > 0)
        start(motorA);
        motorB.Speed = -30;
        start(motorB);
        
        COLOR = readColorr(myev3, 1, ColorSensor1);
        if (isequal(color, COLOR))
            pause(2.2);
            howMany1 = howMany1 - 1;
            stop(motorA);
            stop(motorB);
            motorB.Speed = 30;
        else
            motorA.Speed = -20;
            pause(2.5);
            stop(motorA);
            stop(motorB);
            motorA.Speed = 20;
            motorB.Speed = 30;
        end
    end % big
    
    if (howMany2 > 0)
        start(motorB);
        motorA.Speed = -20;
        start(motorA);
        
        COLOR = readColorr(myev3, 2, ColorSensor2);
        if (isequal(color, COLOR))
            pause(4);
            howMany2 = howMany2 - 1;
            stop(motorA);
            stop(motorB);
            motorA.Speed = 20;
        else
            motorB.Speed = -25;
            pause(4);
            stop(motorA);
            stop(motorB);
            motorB.Speed = 30;
            motorA.Speed = 20;
        end
        
    end % small
    
end % while loop

fprintf('\n\nDone...\n\n');
