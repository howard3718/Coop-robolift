%A function to find valid combinations when using worm, helical and
%helical.

function [potential] = whhCombinations(helicRatios,wormRatios,ratio)
    error = 0.5;
    
    rowH = size(helicRatios,1);
    rowW = size(wormRatios,1);
    
    helicRatios1 = repmat(helicRatios,(rowH^2)*rowW,1);
    
    helicRatios2 = reshape(helicRatios,[],1);
    helicRatios2 = repmat(helicRatios2,1,rowH);
    helicRatios2 = helicRatios2';
    helicRatios2 = reshape(helicRatios2,[],2);
    helicRatios2 = repmat(helicRatios2,rowW,1);
    
    wormRatios = reshape(wormRatios,[],1);
    wormRatios = repmat(wormRatios,1,rowH*rowH);
    wormRatios = wormRatios';
    wormRatios = reshape(wormRatios,[],2);
    
    rows = size(wormRatios,1);
    n= 0;
    
    calc = wormRatios(:,1)*helicRatios(:,1)*helicRatios(:,1);
    test = calc - ratio.*ones(rows,1);
    potential = zeros(1,6);
    for i = 1:row
       if test(i) <= error
           n = n + 1;
           potential(n,1) = wormRatios(i,1);
           potential(n,2) = helicRatios1(i,3);
           potential(n,3) = helicRatios1(i,4);
           potential(n,4) = helicRatios2(i,3);
           potential(n,5) = helicRatios2(i,4);
           potential(n,6) = wormRatios(i,2) + helicRatios1(i,2) + helicRatios2(i,2);
       end
    end
end
