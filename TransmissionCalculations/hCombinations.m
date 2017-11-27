%A function to find valid combinations when using helical only.

function [potential] = hCombinations(helicRatios,ratio)
    error = 1;
    
    rowH = size(helicRatios,1);
    potential = zeros(1,6);
    
    test = helicRatios(:,1) - ratio.*ones(rowH,1);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential(1:rowP,2:3) =  helicRatios(pass,3:4);
    potential(1:rowP,6) = helicRatios(pass,2);
end
