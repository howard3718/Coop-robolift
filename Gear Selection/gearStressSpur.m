% Gear stresses calculations based on HPC technical guides.

function results = gearStressSpur(gearCombination,gearStressInput,motorSpeed)

%Spur gear stresses
results = 0;
%Define everything
mod = gearStressInput(1);
F = gearStressInput(2); %in
runTime = gearStressInput(3); %hours
Sc = gearStressInput(4);
Sb = gearStressInput(5);

w = gearCombination(1);
s1a = gearCombination(2);
s1b = gearCombination(3);
s2a = gearCombination(4);
s2b = gearCombination(5);


%Identify the first speed
if w ~= 0
    speed1a = motorSpeed/w;
else
    speed1a = motorSpeed;
end

%Streses in 1st spur gear.
Xb = XbEvaluateS(speed1a,runTime);
Xc = XcEvaluateS(speed1a,runTime);
Y = YEvaluateS(s1a,s1b);
Z = ZEvaluateS(s1a,s1b);
Dp = 25.4/mod;
K = Dp^0.8;

maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs 
maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
maxLoad1aStrength = maxLoadStrengthImp/0.2248; %N
maxLoad1aWear = maxLoadWearImp/0.2248; %N

%Stresses in the 2nd spur gear
speed1b = speed1a /(s1a/s1b);

Xb = XbEvaluateS(speed1b,runTime);
Xc = XcEvaluateS(speed1b,runTime);
Y = YEvaluateS(s1b,s1a);
Z = ZEvaluateS(s1b,s1a);

maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs
maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
maxLoad1bStrength = maxLoadStrengthImp/0.2248; %N
maxLoad1bWear = maxLoadWearImp/0.2248; %N

PCD1a = mod*gearCombination(2); 
PCD1b = mod*gearCombination(3);  
torqueMaxWear1a = maxLoad1aWear * PCD1a;
torqueMaxWear1b = maxLoad1bWear * PCD1b;
torqueMaxStrength1a = maxLoad1aStrength * PCD1a;
torqueMaxStrength1b = maxLoad1bStrength * PCD1b;

results = [torqueMaxWear1a,torqueMaxStrength1a;torqueMaxWear1b,torqueMaxStrength1b];

if s2a ~= 0
    %Identify the first speed
    speed2a = speed1b; %same shaft

    %Streses in 1st spur gear.
    Xb = XbEvaluateS(speed2a,runTime);
    Xc = XcEvaluateS(speed2a,runTime);
    Y = YEvaluateS(s2a,s2b);
    Z = ZEvaluateS(s2a,s2b);

    maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs
    maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
    maxLoad2aStrength = maxLoadStrengthImp/0.2248; %N
    maxLoad2aWear = maxLoadWearImp/0.2248; %N

    %Stresses in the 2nd spur gear
    speed2b = speed2a /(s2a/s2b);

    Xb = XbEvaluateS(speed2b,runTime);
    Xc = XcEvaluateS(speed2b,runTime);
    Y = YEvaluateS(s2b,s2a);
    Z = ZEvaluateS(s2b,s2a);
    
    maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs
    maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
    maxLoad2bStrength = maxLoadStrengthImp/0.2248; %N
    maxLoad2bWear = maxLoadWearImp/0.2248; %N
    
    PCD2a = mod*gearCombination(4);
    PCD2b = mod*gearCombination(5);
    
    torqueMaxWear2a = maxLoad2aWear * PCD2a;
    torqueMaxWear2b = maxLoad2bWear * PCD2b;
    torqueMaxStrength2a = maxLoad2aStrength * PCD2a;
    torqueMaxStrength2b = maxLoad2bStrength * PCD2b;
    
    results = [results;torqueMaxWear2a,torqueMaxStrength2a;torqueMaxWear2b,torqueMaxStrength2b];
end



end