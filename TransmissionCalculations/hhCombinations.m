%A function to find valid combinations when using helical and helical.

function [potential] = hhCombinations(helicRatios,ratio)
    error = 0.01;
    
    rowH = size(helicRatios,1);
    helicRatios1 = repmat(helicRatios,rowH,1);
    helicRatios2 = reshape(helicRatios,[],1);
    helicRatios2 = repmat(helicRatios2,1,rowH);
    helicRatios2 = helicRatios2';
    helicRatios2 = reshape(helicRatios2,[],4);
    
    rows = size(helicRatios2,1);
    
    n = 0;
    
    calc = helicRatios1(:,1).*helicRatios2(:,1);
    test = calc - ratio.*ones(rows,1);
    potential = zeros(1,6);
    for i = 1:rows
        if test(i) <= error
            n = n+1;
            potential(n,2) = helicRatios1(i,3);
            potential(n,3) = helicRatios1(i,4);
            potential(n,4) = helicRatios2(i,3);
            potential(n,5) = helicRatios2(i,4);
            potential(n,6) = helicRatios1(i,2) + helicRatios2(i,2);
        end
    end
end