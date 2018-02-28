% A FUNCTION TO CALCULATE WHICH GEARS TO USE %



function [potential] = gearSelectionFun(ratio,teethOptionsWheel,teethOptionsSpur)
    
    %determine combinations
    spurRatios = spurRatio(teethOptionsSpur); %ratio|gear1|gear2
    wormRatios = teethOptionsWheel; %gear/ratio
    
    %initialte potential and rows
    potential = zeros(1,5);
    rows = size(potential,1);
    
    %Will any worm/wheel alone meet the requirements
    potential2 = wCombinations(wormRatios,ratio);
    rows2 = size(potential2,1);
    %add any potentials to the potential matrix
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
    rows = size(potential,1);
    
    %Do any two sets of spur gears meet the requirements...
    potential2 = ssCombinations(spurRatios,ratio);
    rows2 = size(potential2,1);
    %Add these to the potential matrix.
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
    rows = size(potential,1);
    
    %Do any worm/wheel plus helic set meet the requirements
    potential2 = wsCombinations(spurRatios,wormRatios,ratio);
    rows2 = size(potential2,1);
    %Add these to the potential matrix.
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
    rows = size(potential,1);
    
    %Do any worm/wheel + 2 sets of helicals meet the requirements?
    potential2 = wssCombinations(spurRatios,wormRatios,ratio);
    rows2 = size(potential2,1);
    %Add these to the potential matrix
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
  
end
