function[COLOR] = readColorr(myev3, port, ColorSensor)
COLOR = 'black';
while(true)
    COLOR = readColor(ColorSensor);
    if (isequal(COLOR, 'red'))
        break;
    elseif (isequal(COLOR, 'blue'))
        pause(.1);
        break;
    elseif (isequal(COLOR, 'white'))
        pause(.1);
        COLOR = readColor(ColorSensor);
        break;
    elseif (isequal(COLOR, 'yellow'))
        break;
    elseif (isequal(COLOR, 'brown'))
        break;
    elseif (isequal(COLOR, 'green'))
        pause(.02);
        COLOR = readColor(ColorSensor);
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
        fprintf('This is a %s %s_%s OR a small steel marble\n', size, COLOR, material);
    else
        fprintf('This is a %s %s_%s marble\n', size, COLOR, material);
    end
else
fprintf('This is a %s %s_%s marble\n', size, COLOR, material);
end
end