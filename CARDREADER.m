clear, clc
myev3 = legoev3('USB');
TouchSensor = touchSensor(myev3);
for (i = 1:4)
    while (readTouch(TouchSensor) == 0) 
    end
    readCard(i, myev3);
end