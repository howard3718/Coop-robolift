function [Xb] = XbEvaluateW(rpm)
%XBEVALUATEW Find the value of Xb from the HPC table.

XbTable = xlsread('H:\DMT 2017\Coop-robolift\Gear Selection\WormStrengthFactor.xlsx',1);

X = XbTable(:,1);
V = XbTable(:,2);
xq = rpm;

Xb = interp1(X,V,xq);

end

