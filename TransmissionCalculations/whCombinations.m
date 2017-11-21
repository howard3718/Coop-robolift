%A function to find valid combinations when using worm and helical.

function [potential] = whCombinations(helicRatios,wormRatios,ratio)
    error = 0.5;
    
    rowH = size(helicRatios,1);
    rowW = size(wormRatios,1);
    helicRatios = repmat(helicRatios,rowW,1);
    wormRatios = reshape(wormRatios,[],1);
    wormRatios = repmat(wormRatios,1,rowH);
    wormRatios = wormRatios';
    wormRatios = reshape(wormRatios,[],2);
    row = size(wormRatios,1);
    
    n = 0;
    
    calc = wormRatios(:,1)*helicRatios(:,1);
    test = calc - ratio.*ones(rows,1);
    potential = zeros(1,6);
    for i = 1:row
        if test(i) <= error
            n = n+1;
            potential(n,1) = wormRatios(i,1);
            potential(n,2) = helicRatios(i,3);
            potential(n,3) = helicRatios(i,4);
            potential(n,6) = wormRatios(i,2) + helicRatios(i,2);
        end
    end
    
    
end