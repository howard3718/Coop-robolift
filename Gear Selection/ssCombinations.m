%A function to find valid combinations when using spur and spur.

function [potential] = ssCombinations(spurRatios,ratio)
    error = 0.02*ratio;
    
    row = size(spurRatios,1);
    
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
    spurRatios1 = repmat(spurRatios,row,1);
    spurRatios2 = reshape(spurRatios,[],1);
    spurRatios2 = repmat(spurRatios2,1,row);
    spurRatios2 = spurRatios2';
    spurRatios2 = reshape(spurRatios2,[],3);
    
    rows = size(spurRatios2,1);
    
    calc = spurRatios1(:,1) .* spurRatios2(:,1);
    test = calc - ratio.*ones(rows,1);
    potential = zeros(1,5);
    pass = find(test < error & test >= 0);
    rowP = size(pass,1);
    potential(1:rowP,2) = spurRatios1(pass,2);
    potential(1:rowP,3) = spurRatios1(pass,3);
    potential(1:rowP,4) = spurRatios2(pass,2);
    potential(1:rowP,5) = spurRatios2(pass,3);
    
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
