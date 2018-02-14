%A function to find valid combinations when using helical and helical.

function [potential] = hhCombinations(helicRatios,ratio)
    error = 0.01*ratio;
    
    rowH = size(helicRatios,1);
    
    %This technique eliminates the repeats before it starts.
    
%     helicRatios1 = helicRatios;
%     for i = 1:rowH-1
%         helicRatios1 = [helicRatios1;helicRatios(i+1:rowH,:)];
%     end
%     toc
%     tic
%     helicRatios2 = ones(rowH,4) .* helicRatios(1,:);
%     for i = 1:rowH-1
%         helicRatios2 = [helicRatios2;(ones(rowH-i,4) .* helicRatios(i+1,:))];
%     end
%     toc        
        
    %This technique elimiinates the repeats at the end... See below
    helicRatios1 = repmat(helicRatios,rowH,1);
    helicRatios2 = reshape(helicRatios,[],1);
    helicRatios2 = repmat(helicRatios2,1,rowH);
    helicRatios2 = helicRatios2';
    helicRatios2 = reshape(helicRatios2,[],4);
    
    rows = size(helicRatios2,1);
    
    calc = helicRatios1(:,1) .* helicRatios2(:,1);
    test = calc - ratio.*ones(rows,1);
    potential = zeros(1,6);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential(1:rowP,2) = helicRatios1(pass,3);
    potential(1:rowP,3) = helicRatios1(pass,4);
    potential(1:rowP,4) = helicRatios2(pass,3);
    potential(1:rowP,5) = helicRatios2(pass,4);
    potential(1:rowP,6) = helicRatios1(pass,2) + helicRatios2(pass,2);
    
    %Continuation of second technique
    compare = potential;
    compare(:,2:3) = potential(:,4:5);
    compare(:,4:5) = potential(:,2:3);
    [logical,location] = ismember(potential,compare,'rows');
    checkRep = find(logical == 0);
    if isempty(checkRep) == 0
        disp('Error - Some combinations not repeated')
    else
        n = 0;
        while size(potential,1) > rowP/2
            n = n + 1;
            element = location(n);
            potential(element,:) = [];
            location(element) = [];
            change = find(location > element);
            location(change) = location(change) - 1;
        end
    end
            
            
    
end
