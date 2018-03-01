%independent gear stress calculations for spur gears

s1 = 13;
s2 = 36;

mod = 1;
F = 8 * .0394;
runTime = 12;

% %steel gears
% Sc = 1400;
% Sb = 17000;

%delrin gears
Sc = 500;
Sb = 3900;

speed1 = 520;
speed2 = speed1 / (s2/s1);

%First gear

Xb = XbEvaluateS(speed1,runTime);
Xc = XcEvaluateS(speed1,runTime);
Y = YEvaluateS(s1,s2);
Z = ZEvaluateS(s1,s2);
Dp = 25.4/mod;
K = Dp^0.8;

maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs 
maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
maxLoad1Strength = maxLoadStrengthImp/0.2248; %N
maxLoad1Wear = maxLoadWearImp/0.2248; %N

PCD1 = mod * s1;
torqueMaxWear1 = maxLoad1Wear * PCD1;
torqueMaxStrength1 = maxLoad1Strength * PCD1;

%Second Gear

Xb = XbEvaluateS(speed2,runTime);
Xc = XcEvaluateS(speed2,runTime);
Y = YEvaluateS(s2,s1);
Z = ZEvaluateS(s2,s1);

maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs
maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
maxLoad2Strength = maxLoadStrengthImp/0.2248; %N
maxLoad2Wear = maxLoadWearImp/0.2248; %N

PCD2 = mod * s2;
torqueMaxWear2 = maxLoad2Wear * PCD2;
torqueMaxStrength2 = maxLoad2Strength * PCD2;

torque1 = 0.191229000000000; %Nm - stall torque.
torque2 = torque1 * (s2/s1);

SF1Wear = torqueMaxWear1/torque1;
SF1Strength = torqueMaxStrength1/torque1;

SF2Wear = torqueMaxWear2/torque2;
SF2Strength = torqueMaxStrength2/torque2;