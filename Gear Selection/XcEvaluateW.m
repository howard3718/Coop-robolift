function [Xc] = XcEvaluateW(rpm,rubSpeed)
%XCEVALUATEW Evaluate the value of Xc from the HPC tables 

XcTable = xlsread('H:\DMT 2017\Coop-robolift\Gear Selection\WormStrengthFactor.xlsx',2);

X = XcTable(2:12,1);
Y = XcTable(1,2:end);
V = XcTable(2:12,2:end)';
xq = rpm;
yq = rubSpeed;

Xc = interp2(X,Y,V,xq,yq);

end

