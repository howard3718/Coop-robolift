function strength = YEvaluateH(teeth,matingTeeth)
%YEVALUATE Summary of this function goes here
%Interpolates the table of strength factors.
YTable = xlsread('H:\DMT 2017\Coop-robolift\Gear Selection\Strength Factor.xlsx',2);

X = YTable(2:15,1);
Y = YTable(1,2:end);
V = YTable(2:15,2:end)';
xq = teeth;
yq = matingTeeth;

strength = interp2(X,Y,V,xq,yq);

end

