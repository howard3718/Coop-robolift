%A function to find valid combinations when using worm, helical and
%helical.

function [potential] = whhCombinations(helicRatios,wormRatios,ratio)
    error = ratio*0.01;
    
    rowH = size(helicRatios,1);
    rowW = size(wormRatios,1);
    
    %First quarter
    helicRatios1 = repmat(single(helicRatios),(rowH*ceil(rowW/4)),1);
    
    helicRatios2 = reshape(single(helicRatios),[],1);
    helicRatios2 = repmat(helicRatios2,1,rowH);
    helicRatios2 = helicRatios2';
    helicRatios2 = reshape(helicRatios2,[],4);
    helicRatios2 = repmat(helicRatios2,ceil(rowW/4),1);
    
    wormRatios = reshape(single(wormRatios(1:ceil(rowW/4),:)),[],1);
    wormRatios = repmat(wormRatios,1,rowH^2);
    wormRatios = wormRatios';
    wormRatios = reshape(wormRatios,[],2);
    
    row = size(wormRatios,1);
    calc = wormRatios(:,1) .* helicRatios1(:,1) .* helicRatios2(:,1);
    test = calc - ratio .* ones(row,1);
    potential1 = zeros(1,6);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential1(1:rowP,1) = wormRatios(pass,1);
    potential1(1:rowP,2) = helicRatios1(pass,3);
    potential1(1:rowP,3) = helicRatios1(pass,4);
    potential1(1:rowP,4) = helicRatios2(pass,3);
    potential1(1:rowP,5) = helicRatios2(pass,4);
    potential1(1:rowP,6) = helicRatios1(pass,2) + helicRatios2(pass,2) + wormRatios(pass,2);
    
    %Second quarter
%     helicRatios1 = repmat(single(helicRatios),(rowH*ceil(rowW/4)),1);
%     
%     helicRatios2 = reshape(single(helicRatios),[],1);
%     helicRatios2 = repmat(helicRatios2,1,rowH);
%     helicRatios2 = helicRatios2';
%     helicRatios2 = reshape(helicRatios2,[],4);
%     helicRatios2 = repmat(helicRatios2,ceil(rowW/4),1);
    
    wormRatios = reshape(single(wormRatios((ceil(rowW/4)+1):(2*ceil(rowW/4)),:)),[],1);
    wormRatios = repmat(wormRatios,1,rowH^2);
    wormRatios = wormRatios';
    wormRatios = reshape(wormRatios,[],2);
    
    row = size(wormRatios,1);
    calc = wormRatios(:,1) .* helicRatios1(:,1) .* helicRatios2(:,1);
    test = calc - ratio .* ones(row,1);
    potential2 = zeros(1,6);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential2(1:rowP,1) = wormRatios(pass,1);
    potential2(1:rowP,2) = helicRatios1(pass,3);
    potential2(1:rowP,3) = helicRatios1(pass,4);
    potential2(1:rowP,4) = helicRatios2(pass,3);
    potential2(1:rowP,5) = helicRatios2(pass,4);
    potential2(1:rowP,6) = helicRatios1(pass,2) + helicRatios2(pass,2) + wormRatios(pass,2);
    
    %Third quarter
%     helicRatios1 = repmat(single(helicRatios),(rowH*ceil(rowW/4)),1);
%     
%     helicRatios2 = reshape(single(helicRatios),[],1);
%     helicRatios2 = repmat(helicRatios2,1,rowH);
%     helicRatios2 = helicRatios2';
%     helicRatios2 = reshape(helicRatios2,[],4);
%     helicRatios2 = repmat(helicRatios2,ceil(rowW/4),1);
    
    wormRatios = reshape(single(wormRatios(((2*ceil(rowW/4))+1):(3*ceil(rowW/4)),:)),[],1);
    wormRatios = repmat(wormRatios,1,rowH^2);
    wormRatios = wormRatios';
    wormRatios = reshape(wormRatios,[],2);
    
    row = size(wormRatios,1);
    calc = wormRatios(:,1) .* helicRatios1(:,1) .* helicRatios2(:,1);
    test = calc - ratio .* ones(row,1);
    potential3 = zeros(1,6);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential3(1:rowP,1) = wormRatios(pass,1);
    potential3(1:rowP,2) = helicRatios1(pass,3);
    potential3(1:rowP,3) = helicRatios1(pass,4);
    potential3(1:rowP,4) = helicRatios2(pass,3);
    potential3(1:rowP,5) = helicRatios2(pass,4);
    potential3(1:rowP,6) = helicRatios1(pass,2) + helicRatios2(pass,2) + wormRatios(pass,2);
    
    %Fourth quarter
    helicRatios1 = repmat(single(helicRatios),(rowH*(ceil(rowW/4)-1)),1);
    
    helicRatios2 = reshape(single(helicRatios),[],1);
    helicRatios2 = repmat(helicRatios2,1,rowH);
    helicRatios2 = helicRatios2';
    helicRatios2 = reshape(helicRatios2,[],4);
    helicRatios2 = repmat(helicRatios2,(ceil(rowW/4)-1),1);
    
    wormRatios = reshape(single(wormRatios(((3*ceil(rowW/4))+1):rowW,:)),[],1);
    wormRatios = repmat(wormRatios,1,rowH^2);
    wormRatios = wormRatios';
    wormRatios = reshape(wormRatios,[],2);
    
    row = size(wormRatios,1);
    calc = wormRatios(:,1) .* helicRatios1(:,1) .* helicRatios2(:,1);
    test = calc - ratio .* ones(row,1);
    potential4 = zeros(1,6);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential4(1:rowP,1) = wormRatios(pass,1);
    potential4(1:rowP,2) = helicRatios1(pass,3);
    potential4(1:rowP,3) = helicRatios1(pass,4);
    potential4(1:rowP,4) = helicRatios2(pass,3);
    potential4(1:rowP,5) = helicRatios2(pass,4);
    potential4(1:rowP,6) = helicRatios1(pass,2) + helicRatios2(pass,2) + wormRatios(pass,2);
    
    potential = [potential1;potential2;potential3;potential4];
    
%     %Not included for simplicity. 
%     tic
%     compare = potential;
%     compare(:,2:3) = potential(:,4:5);
%     compare(:,4:5) = potential(:,2:3);
%     [logical,location] = ismember(potential,compare,'rows');
%     checkRep = find(logical == 0);
%     if isempty(checkRep) == 0
%         disp('Error - Some combinations not repeated')
%     else
%         n = 0;
%         while size(potential,1) > rowP/2
%             n = n + 1;
%             element = location(n);
%             potential(element,:) = [];
%             location(element) = [];
%             change = find(location > element);
%             location(change) = location(change) - 1;
%         end
%     end
%     toc
end
