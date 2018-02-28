% Function to generate all the possible ratios available using spur gears.

%output is matrix with 3 columns - ratio,gear1, gear2

function [output] = spurRatio(teethOptionsSpur)
    number = size(teethOptionsSpur,2);
    %generate a mesh grid.
    den = repmat(teethOptionsSpur,number,1);
    num = repmat(teethOptionsSpur',1,number);
    %find ratios
    division = num./den;
    %remove those less than 1
    ratio = tril(division);
    %remove those greater than 1:6
    ratio(ratio > 6) = 0;
    
    %return the output
    linIndex = find(ratio);
    output = zeros(size(linIndex,1),3);
    output = [ratio(linIndex),num(linIndex),den(linIndex)];
    
    
end