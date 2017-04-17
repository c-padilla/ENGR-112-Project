% IDENTIFIER
clear, clc;
myev3 = legoev3('USB');
motorA = motor(myev3, 'A');
motorB = motor(myev3, 'B');
motorA.Speed = 20;
ColorSensor1 = colorSensor(myev3, 1);
ColorSensor2 = colorSensor(myev3, 2);
TouchSensor = touchSensor(myev3, 3);

motorB.Speed = 20;
color1=[];
howMany1=[];
howMany2=[];

color1, howMany1(1), howMany2(1) = readCard(1, myev3);
while (readTouch(TouchSensor) == 0) 
end
color2, howMany1(2), howMany2(2) = readCard(2, myev3);
%howMany1(2) = 0;
%howMany2(2) = 0;
%color2 = 'yellow';
if(strcmp(color1, 'STEEL_HDPE')
    if(howMany1(1) > 0 && howMany2(1) == 0)
        color1 = 'steel';
    elseif(howMany1(1) == 0 && howMany2(1) > 0)
        color1 = 'HDPE';    
    end
end

if(strcmp(color2, 'STEEL_HDPE')
    if(howMany1(2) > 0 && howMany2(2) == 0)
        color2 = 'steel';
    
    elseif(howMany1(2) == 0 && howMany2(2) > 0)
        color2 = 'HDPE';            
    end
end    
% color1 = input('Input color or materials: ', 's'); % lowercase only (red, blue, ..., steel_hdpe)
% howMany1(1) = input('Input quantity type1: '); % large (or steel)
% howMany2(1) = input('Input quantity type2: '); % small (or HDPE)...

% color2 = input('Input color or materials: ', 's'); % lowercase only (red, blue, ..., steel_hdpe)
% howMany1(2) = input('Input quantity type1: '); % large (or steel)
% howMany2(2) = input('Input quantity type2: '); % small (or HDPE)...

while (howMany1(1) ~= 0 || howMany2(1) ~= 0 || howMany1(2) ~= 0 || howMany2(2) ~= 0)        
    if (howMany1(1) > 0 || howMany1(2) > 0)
        start(motorA);
        motorB.Speed = -20;
        start(motorB);
        
        COLOR = readColorr(myev3, 1, ColorSensor1);
        if (isequal(color1, COLOR) && howMany1(1) > 0)
            pause(2.2);
            howMany1(1) = howMany1(1) - 1;
            stop(motorA);
            stop(motorB);
            motorB.Speed = 20;
        elseif (isequal(color2, COLOR) && howMany1(2) > 0)
            pause(2.2);
            howMany1(2) = howMany1(2) - 1;
            stop(motorA);
            stop(motorB);
            motorB.Speed = 20;
        else
            motorA.Speed = -20;
            pause(2.5);
            stop(motorA);
            stop(motorB);
            motorA.Speed = 20;
            motorB.Speed = 20;
        end
    end % big
    
    if (howMany2(1) > 0 || howMany2(2) > 0)
        start(motorB);
        motorA.Speed = -20;
        start(motorA);
        
        COLOR = readColorr(myev3, 2, ColorSensor2);
        if (isequal(color1, COLOR) && howMany2(1) > 0)
            pause(4);
            howMany2(1) = howMany2(1) - 1;
            stop(motorA);
            stop(motorB);
            motorA.Speed = 20;
        elseif (isequal(color2, COLOR) && howMany2(2) > 0)
            pause(4);
            howMany2(2) = howMany2(2) - 1;
            stop(motorA);
            stop(motorB);
            motorA.Speed = 20;    
        else
            motorB.Speed = -20;
            pause(4);
            stop(motorA);
            stop(motorB);
            motorB.Speed = 20;
            motorA.Speed = 20;
        end
        
    end % small
    
end % while loop

fprintf('\n\nDone...\n\n');
