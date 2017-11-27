%A function to find valid combinations when using helical only.

function [potential] = hCombinations(helicRatios,ratio)
    error = 1;
    
    rowH = size(helicRatios,1);
    n = 0;
    potential = zeros(1,6);
    
    for i = 1:rowH
        if (helicRatios(i,1) - ratio) <= error
            n = n + 1;  
            potential(n,2:3) = helicRatios(i,3:4);
            potential(n,6) = helicRatios(i,2);
        end
    end
end