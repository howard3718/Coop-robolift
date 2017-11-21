% Function to generate all the possible ratios available using helical gears.

%output is matrix with four columns - ratio, cost, gear1, gear2

function [ratios] = helicRatio(helicTab)
    rowH = size(helicTab,1);
    %generate second matrix - repeats a row rowh times and then moves to
    %next.
    rearrangeHelic = zeros(rowH^2,2);
    ns = 1;
    for i = 1:rowH
        ne = ns + (rowH - 1);
        rearrangeHelic(ns:ne,1) = ones(rowH,1) .* helicTab(i,1);
        rearrangeHelic(ns:ne,2) = ones(rowH,2) .* helicTab(i,2);
        ns = ne + 1;
    end
    
    %Calculate the ratio combinations available.
    ratios = zeros((rowH^2),4); % initialise output
    
    repHelicTab = repmat(helicTab,rowH,1);
    for i = 1:(rowH^2)
        ratios(i,1) = repHelicTab(i,1)/rearrangeHelic(i,1);
        ratios(i,2) = repHelicTab(i,2) + rearrangeHelic(i,2);
    end
    ratios(:,3) = repHelicTab;
    ratios(:,4) = rearrangeHelic;
    
end