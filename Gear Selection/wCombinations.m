%A function to find valid combinations when using helical only.

function [potential] = wCombinations(wormRatios,ratio)
    error = 0.02*ratio;
    
    rowW = size(wormRatios,1);
    n = 0;
    potential = zeros(1,6);
    
    for i = 1:rowW
        if ((wormRatios(i,1) - ratio) <= error) && ((wormRatios(i,1) - ratio) >= 0) %could do abs here?
            n = n + 1;  
            potential(n,1) = wormRatios(i,1);
            potential(n,6) = wormRatios(i,2);
        end
    end
end