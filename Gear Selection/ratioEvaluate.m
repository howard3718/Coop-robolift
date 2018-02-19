% Evaluate the ratio of the chosen gear combination

function ratio = ratioEvaluate(gearCombination)

w = gearCombination(1);
h1 = gearCombination(2)/gearCombination(2);
h2 = gearCombination(3)/gearCombination(4);

wIndicate = 1;
h1Indicate = 2;
h2Indicate = 4;

if w == 0
    wIndicate = 0;
end
if h1 == 0
    h1Indicate = 0;
end
if h2 == 0
    h2Indicate = 0;
end

check = wIndicate + h1Indicate + h2Indicate;

if check == 0
    disp('Combination Error!');
elseif check == 1
    ratio = w;
elseif check == 2
    ratio = h1;
elseif check == 3
    ratio = w*h1;
elseif check == 4
    ratio = h2;
elseif check == 5
    ratio = w*h2;
elseif check == 6
    ratio = h1*h2;
elseif check == 7
    ratio = w*h1*h2;
end

end