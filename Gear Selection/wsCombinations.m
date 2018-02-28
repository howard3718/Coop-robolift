%A function to find valid combinations when using worm and spur.

function [potential] = wsCombinations(spurRatios,wormRatios,ratio)
    error = ratio*0.02;
    wormRatios = wormRatios';
    
    rowS = size(spurRatios,1);
    rowW = size(wormRatios,1);
    spurRatios = repmat(spurRatios,rowW,1);
    %wormRatios = reshape(wormRatios,[],1);
    wormRatios = repmat(wormRatios,1,rowS);
    wormRatios = wormRatios';
    wormRatios = reshape(wormRatios,[],1);
    row = size(wormRatios,1);
    
    calc = wormRatios .* spurRatios(:,1);
    test = calc - ratio.*ones(row,1);
    potential = zeros(1,5);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential(1:rowP,1) = wormRatios(pass,1);
    potential(1:rowP,2) = spurRatios(pass,2);
    potential(1:rowP,3) = spurRatios(pass,3);    
    %No repeatitions ?
end
