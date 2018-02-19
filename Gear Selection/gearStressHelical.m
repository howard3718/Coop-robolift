% Gear stresses calculations based on HPC technical guides.

function results = gearStressHelical(gearCombination,gearStressInput,motorSpeed)

%Helical gear stresses
results = 0;
%Define everything
mod = gearStressInput(1);
F = gearStressInput(2); %in
runTime = gearStressInput(3); %hours
Sc = gearStressInput(4);
Sb = gearStressInput(5);

w = gearCombination(1);
h1a = gearCombination(2);
h1b = gearCombination(3);
h2a = gearCombination(4);
h2b = gearCombination(5);


%Identify the first speed
if w ~= 0
    speed1a = motorSpeed/w;
else
    speed1a = motorSpeed;
end

%Streses in 1st helical gear.
Xb = XbEvaluate(speed1a,runTime);
Xc = XcEvaluate(speed1a,runTime);
Y = YEvaluate(h1a,h1b);
Z = ZEvaluate(h1a,h1b);
Dp = 25.4/mod;
K = Dp^0.8;

maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs 
maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
maxLoad1aStrength = maxLoadStrengthImp/0.2248; %N
maxLoad1aWear = maxLoadWearImp/0.2248; %N

%Stresses in the 2nd helical gear
speed1b = speed1a /(h1a/h1b);

Xb = XbEvaluate(speed1b,runTime);
Xc = XcEvaluate(speed1b,runTime);
Y = YEvaluate(h1b,h1a);
Z = ZEvaluate(h1b,h1a);

maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs
maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
maxLoad1bStrength = maxLoadStrengthImp/0.2248; %N
maxLoad1bWear = maxLoadWearImp/0.2248; %N

results = [maxLoad1aStrength, maxLoad1aWear; maxLoad1bStrength, maxLoad1bWear];

if h2a ~= 0
    %Identify the first speed
    speed2a = speed1b; %same shaft

    %Streses in 1st helical gear.
    Xb = XbEvaluate(speed2a,runTime);
    Xc = XcEvaluate(speed2a,runTime);
    Y = YEvaluate(h2a,h2b);
    Z = ZEvaluate(h2a,h2b);

    maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs
    maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
    maxLoad2aStrength = maxLoadStrengthImp/0.2248; %N
    maxLoad2aWear = maxLoadWearImp/0.2248; %N

    %Stresses in the 2nd helical gear
    speed2b = speed2a /(h2a/h2b);

    Xb = XbEvaluate(speed2b,runTime);
    Xc = XcEvaluate(speed2b,runTime);
    Y = YEvaluate(h2b,h2a);
    Z = ZEvaluate(h2b,h2a);
    
    maxLoadStrengthImp = (Xb * Y * Sb * F)/Dp; %lbs
    maxLoadWearImp = (Xc * Z * Sc * F)/K; %lbs 
    maxLoad2bStrength = maxLoadStrengthImp/0.2248; %N
    maxLoad2bWear = maxLoadWearImp/0.2248; %N
    
    results = [results; maxLoad2aStrength, maxLoad2aWear; maxLoad2bStrength, maxLoad2bWear];
end

end