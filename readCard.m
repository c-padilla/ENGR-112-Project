function[color, type1, type2] = readCard(p, myev3)
array=[];
motorB=motor(myev3,'C');
ColorSensor=colorSensor(myev3, 4);


motorB.Speed=-10;
for (i = 1:8)
   
    start(motorB);
    pause(1.1)
    stop(motorB)
    pause(1)
    x = readColor(ColorSensor) ; 
    beep(myev3)
    if (x == 'black')
        array(i) = 1;
    else
        array(i) = 0;
    end
end
stop(motorB);

material = array([1 2 3]);
material_code = flip(material);
pelletnum=array([4 5 6 7 8]);
type_code = flip(pelletnum);
mat='a';
color = '';
    if isequal(material_code, [0 0 1])
        mat = 'WHITE_GLASS';
        color = 'white';
    elseif isequal(material_code, [0 1 0])
        mat = 'RED_GLASS';
        color = 'red';
    elseif isequal(material_code, [0 1 1])
        mat = 'BLUE_GLASS';
        color = 'blue';
    elseif isequal(material_code, [1 0 0])
        mat = 'STEEL_HDPE';
        color = 'HDPE';
    end

type1=0; 
type2=0;


if isequal(type_code,[0 0 0 0 1])
        type1 = 0;
        type2 = 0;
elseif isequal(type_code,[0 0 0 1 0])
        type1 = 1;
        type2 = 0;

elseif isequal(type_code,[0 0 0 1 1 ])
        type1 = 2;
        type2 = 0;

elseif isequal(type_code,[0 0 1 0 0])
        type1 = 3;
        type2 = 0;

elseif isequal(type_code,[0 0 1 0 1])
        type1 = 0;
        type2 = 1;
        
elseif isequal(type_code,[0 0 1 1 0])
        type1 = 1;
        type2 = 1;    

elseif isequal(type_code,[0 0 1 1 1])
        type1 = 2;
        type2 = 1;

elseif isequal(type_code,[0 1 0 0 0])
        type1 = 3;
        type2 = 1;

elseif isequal(type_code,[0 1 0 0 1])
        type1 = 0;
        type2 = 2;

elseif isequal(type_code,[0 1 0 1 0])
        type1 = 1;
        type2 = 2;

elseif isequal(type_code,[0 1 0 1 1])
        type1 = 2;
        type2 = 2;

elseif isequal(type_code,[0 1 1 0 0])
        type1 = 3;
        type2 = 2;

elseif isequal(type_code,[0 1 1 0 1])
        type1 = 0;
        type2 = 3;

elseif isequal(type_code,[0 1 1 1 0])
        type1 = 1;
        type2 = 3;

elseif isequal(type_code,[0 1 1 1 1])
       type1 = 2;
       type2 = 3;

elseif isequal(type_code,[1 0 0 0 0])
        type1 = 3;
        type2 = 3;
    
end
switch(mat)
    case 'STEEL_HDPE'
        fprintf('Card %i dispenses %i steel and %i HDPE marbles. \n', p, type1, type2);
    otherwise
        fprintf('Card %i dispenses %i large and %i small %s marbles. \n', p, type1, type2, mat);
end
end
