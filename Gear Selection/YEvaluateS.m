function strength = YEvaluateS(teeth,matingTeeth)
%YEVALUATE 
%Interpolates the table of strength factors.
YTable = xlsread('Strength Factor.xlsx',3);

X = YTable(2:15,1);
Y = YTable(1,2:end);
V = YTable(2:15,2:end)';
xq = teeth;
yq = matingTeeth;

strength = interp2(X,Y,V,xq,yq);

end

