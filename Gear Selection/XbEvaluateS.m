function Xb = XbEvaluateS(speed,runTime)
%XBEVALUATE 
%Uses the HPC tables to provide the value of Xb based on the speed and
%runTime
XbTable = xlsread('Speed Factor.xlsx',1);

if runTime == 1
    column = 2;
elseif runTime == 6
    column = 4;
elseif runTime == 12
    column = 5;
elseif runTime == 24
    column = 6;
else
    disp('Error - invalid runTime variable');
end 

XbCol = XbTable(2:end,column);
rpmValues = XbTable(2:end,1);
Xb = interp1(rpmValues,XbCol,speed); 
end

