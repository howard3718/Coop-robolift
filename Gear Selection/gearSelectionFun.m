% A FUNCTION TO CALCULATE WHICH GEARS TO USE %



function [potential] = gearSelectionFun(ratio,wormTab,helicalTab)
    
    %determine combinations
    helicRatios = helicRatio(helicalTab); %ratio|cost|gear1|gear2
    wormRatios = wormTab; %gear|cost
    
    %initialte potential and rows
    potential = zeros(1,6);
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
    
    %Do any two sets of helical gears meet the requirements...
    potential2 = hhCombinations(helicRatios,ratio);
    rows2 = size(potential2,1);
    %Add these to the potential matrix.
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
    rows = size(potential,1);
    
    %Do any worm/wheel plus helic set meet the requirements
    potential2 = whCombinations(helicRatios,wormRatios,ratio);
    rows2 = size(potential2,1);
    %Add these to the potential matrix.
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
    rows = size(potential,1);
    
    %Do any worm/wheel + 2 sets of helicals meet the requirements?
    potential2 = whhCombinations(helicRatios,wormRatios,ratio);
    rows2 = size(potential2,1);
    %Add these to the potential matrix
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
  
end
