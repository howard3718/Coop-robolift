%A function to find valid combinations when using helical only.

function [potential] = wCombinations(wormRatios,ratio)
    error = 1;
    
    rowW = size(wormRatios,1);
    potential = zeros(1,6);
    
    test = wormRatios(:,1) - ratio.*ones(rowW,1);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential(1:rowP,1) =  wormRatios(pass,1);
    potential(1:rowP,6) = wormRatios(pass,2);
    
end