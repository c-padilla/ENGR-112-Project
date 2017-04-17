function[COLOR] = readColorr(myev3, port, ColorSensor)
COLOR = 'black';
while(true)
    COLOR = readColor(ColorSensor);
    colorRGB = readColorRGB(ColorSensor);
    
    if(colorRGB(1) < 15 && colorRGB(2) > 20 && colorRGB(2) < 30 && colorRGB(3) < 5)
        disp(colorRGB);
        break;
    
    elseif (isequal(COLOR, 'red'))
        break;
    elseif (isequal(COLOR, 'blue'))
        fprintf('it read blue\n');
        intensity = readLightIntensity(ColorSensor,'reflected');
        %if (intensity <= ...)
         %   COLOR = 'steel';
        %end  
        break;
    elseif (isequal(COLOR, 'white'))
        fprintf('it read white\n');
        pause(.05);
        intensity = readLightIntensity(ColorSensor,'reflected')
        if (intensity < 25 && port == 2)
            COLOR = 'HDPE';
        end
        break;
    elseif (isequal(COLOR, 'yellow'))
        fprintf('it read yellow\n');
        break;
    elseif (isequal(COLOR, 'brown'))
        fprintf('it read brown\n');
       % if (intensity <= 10)
        %    COLOR = 'steel';
        %end
        break;
    elseif (isequal(COLOR, 'green'))
        fprintf('it read green\n');
        break;
    end
end
material = 'GLASS';
size = 'SMALL';

if (port == 1)
    size = 'LARGE';
else
    size = 'SMALL';
end


if (isequal(COLOR, 'brown'))
    COLOR = 'yellow';
    if(size == 'SMALL')
        fprintf('This is a small yellow glass marble\n', size, COLOR, material);

    else
        fprintf('This is a %s %s_%s marble\n', size, COLOR, material);
    end
% elseif isequal(COLOR, 'blue') && strcmp(size, 'SMALL')
%        fprintf('This is a small steel marble\n');

elseif (isequal(COLOR, 'HDPE'))
    fprintf('This is a High-Density Polyethelyne Plasitic Marble');

else        
fprintf('This is a %s %s_%s marble\n', size, COLOR, material);
end
end
