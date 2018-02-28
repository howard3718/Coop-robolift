function Xc = XcEvaluateH(speed,runTime)
%XCEVALUATE 
%Uses the HPC tables to provide the value of Xc based on the speed and
%runTime
XcTable = xlsread('H:\DMT 2017\Coop-robolift\Gear Selection\Speed Factor.xlsx',2);

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
end 

XcCol = XcTable(2:end,column);
rpmValues = XcTable(2:end,1);
Xc = interp1(rpmValues,XcCol,speed); 
end

