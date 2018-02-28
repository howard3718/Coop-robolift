%A function to find valid combinations when using worm, spur and
%spur.

function [potential] = wssCombinations(spurRatios,wormRatios,ratio)
    error = ratio*0.02;
    
    
    rowS = size(spurRatios,1);
    rowW = size(wormRatios,2);
    
    spurRatios1 = repmat(spurRatios,rowS,1);
    spurRatios2 = reshape(spurRatios,[],1);
    spurRatios2 = repmat(spurRatios2,1,rowS);
    spurRatios2 = spurRatios2';
    spurRatios2 = reshape(spurRatios2,[],3);
    
    rowSS = size(spurRatios2,1);
    
    spurspurRatios = spurRatios1(:,1) .* spurRatios2(:,1);
    ssRatioRep = repmat(spurspurRatios,1,rowW);
    wormRep = repmat(wormRatios,rowSS,1);
    
    calc = wormRep .* ssRatioRep;
    test = calc - ratio.* ones(rowSS,rowW);
    potential = zeros(1,5);
    [rowPass,colPass] = find(test < error & test >= 0); % find array index
    rowP = size(rowPass,1);
    potential(1:rowP,1) = wormRep(1,colPass); %all rows the same
    potential(1:rowP,2) = spurRatios1(rowPass,2);
    potential(1:rowP,3) = spurRatios1(rowPass,3);
    potential(1:rowP,4) = spurRatios2(rowPass,2);
    potential(1:rowP,5) = spurRatios2(rowPass,3);
    
end
