function [Xc] = XcEvaluate(speed,runTime)
%XCEVALUATE 
%Uses the HPC tables to provide the value of Xc based on the speed and
%runTime
XcTable = xlsread(file,2); %change file when debugging and organising files.

if runTime == 1
    column = 2;
elseif runTime == 6
    column = 5;
elseif runTime == 12
    column = 7;
elseif runTime == 24
    column = 9;
else
    disp('Error - invalid runTime variable');
    
XcCol = XcTable(2:end,column);
rpmValues = XcTable(2:end,1);
Xc = interp1(rpmValues,XcCol,speed); %Not sure this will work.

end

