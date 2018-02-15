% Gear stresses calculations based on HPC technical guides.

function results = gearStressHelical(gearCombination,gearStressInput,motorSpeed,ratio)

%Helical gear stresses

%Define everything
mod = gearStressInput(1);
F = gearStressInput(2); %in
runTime = gearStressInput(3); %hours
Sc = gearStressInput(4);
Sb = gearStressInput(5);


XbTable = xlsread(file,1);

ZTable = xlsread(file,2);
YTable = xlsread(file,2);

w = gearCombination(1);
h1a = gearCombination(2);
h1b = gearCombination(3);
h2a = gearCombination(4);
h2b = gearCombination(5);

%Identify the first speed
if w ~= 0
    speed1 = motorSpeed/w;
else
    speed1 = motorSpeed;
end

Xc = XcEvaluate(speed1,runTime);

end