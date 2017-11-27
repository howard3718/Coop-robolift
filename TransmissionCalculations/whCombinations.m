%A function to find valid combinations when using worm and helical.

function [potential] = whCombinations(helicRatios,wormRatios,ratio)
    error = 0.01;
    
    rowH = size(helicRatios,1);
    rowW = size(wormRatios,1);
    helicRatios = repmat(helicRatios,rowW,1);
    wormRatios = reshape(wormRatios,[],1);
    wormRatios = repmat(wormRatios,1,rowH);
    wormRatios = wormRatios';
    wormRatios = reshape(wormRatios,[],2);
    row = size(wormRatios,1);
    
    calc = wormRatios(:,1) .* helicRatios(:,1);
    test = calc - ratio.*ones(row,1);
    potential = zeros(1,6);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential(1:rowP,1) = wormRatios(pass,1);
    potential(1:rowP,2) = helicRatios(pass,3);
    potential(1:rowP,3) = helicRatios(pass,4);
    potential(1:rowP,6) = helicRatios(pass,2) + wormRatios(pass,2);
    
    %No repeatitions
end
