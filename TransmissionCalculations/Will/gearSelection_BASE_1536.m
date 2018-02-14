% A FUNCTION TO CALCULATE WHICH GEARS TO USE %
%initially try mod 0.5


function [potential] = gearSelection(ratio,wormTab,helicalTab) %for now leaving out spurtab
    
    %determine combinations
    helicRatios = helicRatio(helicalTab);
    wormRatios = wormTab;

    potential = hCombinations(helicRatios,ratio);
    rows = size(potential,1);
    
%     potential2 = wCombinations(wormRatios,ratio);
%     rows2 = size(potential2,1);
%     if sum(potential) == 0
%         potential = potential2;
%     else
%         potential(rows+1:rows2+rows,:) = potential2;
%     end
    
%     rows = size(potential,1);
%     potential2 = hhCombinations(helicRatios,ratio);
%     rows2 = size(potential2,1);
%     if sum(potential) == 0
%         potential = potential2;
%     else
%         potential(rows+1:rows2+rows,:) = potential2;
%     end
    
    rows = size(potential,1);
    potential2 = whCombinations(helicRatios,wormRatios,ratio);
    rows2 = size(potential2,1);
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
    
    rows = size(potential,1);
    potential2 = whhCombinations(helicRatios,wormRatios,ratio);
    rows2 = size(potential2,1);
    if sum(potential) == 0
        potential = potential2;
    else
        potential(rows+1:rows2+rows,:) = potential2;
    end
    
    
end
