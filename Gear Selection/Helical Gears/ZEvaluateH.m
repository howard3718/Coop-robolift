function Z = ZEvaluateH(teeth,matingTeeth)
%ZEVALUATE Summary of this function goes here
%2D interpolation for zone factor
ZTable = xlsread('H:\DMT 2017\Coop-robolift\Gear Selection\Zone Factor.xlsx',2);

X = ZTable(2:15,1);
Y = ZTable(1,2:end);
V = ZTable(2:15,2:end)';
xq = teeth;
yq = matingTeeth;

Z = interp2(X,Y,V,xq,yq);

end

