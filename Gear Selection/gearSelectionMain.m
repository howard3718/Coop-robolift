% A full programme for the gear selection procedure to be used for both the
% lifting mechanism and the wheel base system.
clear
%%% CONTENTS %%%
%1. Gear Tables - HPC Gears
%2. Definitions
%3. Input Parameters
%4. Gear Selection - Optimising for cost.
%5. Efficiency Calculations
%6. Gear Stresses
%7. Data Presentation

%% Gear Tables
%Available gears
[teethOptionsSpur,teethOptionsWheel] = teethData();

% %Read in helical data
% helicalTab = zeros(72,2,5); %pages are mod 0.5,0.8,1,1.25,1.5
% for i = 1:5
%     helicalTab(:,:,i) = xlsread('H:\DMT 2017\Gear Data\helicaltable.xlsx',i);
% end
% %Read in worm data
% wormTab = zeros(39,2,5); %pages 0.5 mod is page 1...
% for i = 1:5
%     wormTab(:,:,i) = xlsread('H:\DMT 2017\Gear Data\wormtable.xlsx',i);
% end
%% Definitions

%Maximum ratios: (Peter Childs) % NEED TO ADJUST FOR THESE
%   Spur = 1:1 to 6:1
%   Helical = 1:1 to 10:1
%   Worm = 5:1 to 75:1

wormDiam = [12;12;15;16;20];
mod = [0.5;0.8;1.0;1.25;1.5];
wormOD = [13;13.6;17;18.5;];
wormLeadDeg = [2;3;3;4;4];
wormLeadMin = [23;48;48;28;17];
faceWidthSpur = [5;6;8;8;12];
materialRateSurface = [500;1400]; %|delrin|steel|
materialRateBend = [3900;17000]; %|delrin|steel|

%% Input Parameters

%Mechanism Requirements:
mechSpeed = (6.64*60)/(2*pi); %rpm - from Georges code for lifting.
mechTorque = 3.54; %Nm - from Georges code for lifting.

%Motor Information
motorSpeed = 4289; %rpm
motorTorqueMax = 0.00804; %Nm

%% Gear Selection
% %Extract one page of gear data
% helicalPage = helicalTab(:,:,1);
% wormPage = wormTab(:,:,1);

%Select the worm PCD based on the mod.
 wormPCD = wormDiam(1);
% %Remove zeros

%Ratio Required - based on speed.
ratioRequired = motorSpeed/mechSpeed;

%select potential gear combinations
potentialGears = gearSelectionFun(ratioRequired,teethOptionsWheel,teethOptionsSpur);

%% Efficiency Calculations

%Literature Estimates: (Peter Childs)
%   Spur = 98-99%
%   Helical = 98-99%
%   Worm = 20-98%

%calculate the efficiencies of each combination
%potentialGears = efficiency(potentialGears,motorSpeed,wormPCD);
%order the list by row.
%potentialGears = sortrows(potentialGears,6);

%Include the cost.
%Read in worm data 
%pages 0.5 mod is page 1...
wormTab = xlsread('wormtable.xlsx',1);
spurTab = xlsread('spurtable.xlsx',1);

onesVec = ones(size(potentialGears,1),1);

%Find the cost of the worm
[~,locWorm] = ismember(potentialGears(:,1),wormTab(:,1));
costWorm = wormTab(locWorm,2);
%Find the cost of the first spur
[~,locSpur1] = ismember(potentialGears(:,2),spurTab(:,1));
costSpur1 = spurTab(locSpur1,2);
[~,locSpur2] = ismember(potentialGears(:,3),spurTab(:,1));
costSpur2 = spurTab(locSpur2,2);
[~,locSpur3] = ismember(potentialGears(:,4),spurTab(:,1));
costSpur3 = spurTab(locSpur3,2);
[~,locSpur4] = ismember(potentialGears(:,5),spurTab(:,1));
costSpur4 = spurTab(locSpur4,2);

totalCost = costWorm + costSpur1 + costSpur2 + costSpur3 + costSpur4;
%append the cost
potentialGears = [potentialGears,totalCost];
potentialGears = sortrows(potentialGears,6);
%% Gear Stresses

%Start with the first one on the list.
gearCombination = potentialGears(1,:);
ratio = ratioEvaluate(gearCombination);

%Collect information about worm


%Collect information about helical
modSpur = mod(1); 
Fspur = faceWidthSpur(1)*0.0394; %in
runTime = 12; % - 1,6,12 or 24 -could be updated later
Sc = materialRateSurface(1);
Sb = materialRateBend(1);

modWorm = mod(1);
PCDWorm = wormDiam(1);
ODWorm = wormOD(1);
wormLead = wormLeadDeg(1) + wormLeadMin(1)/60;
wheelTeeth = gearCombination(1);
wormInput = [modWorm;PCDWorm;wormOD;wormLead;wheelTeeth;Sc;Sb];

if gearCombination(1) ~= 0
    maxTorqueWorm = gearStressWorm(wormInput,motorSpeed); %Nm
    wormSFWear = maxTorqueWorm(1) / (motorTorqueMax*wheelTeeth);
    wormSFStrength = maxTorqueWorm(2) / (motorTorqueMax*wheelTeeth);
end

gearStressInputS  = [modSpur,Fspur,runTime,Sc,Sb];
if gearCombination(2) ~= 0
    maxTorqueSpurs = gearStressSpur(gearCombination,gearStressInputS,motorSpeed);
    torque1 = (motorTorqueMax*wheelTeeth);
    torque2 = torque1*(gearCombination(2)/gearCombination(3));
    torque3 = torque2*(gearCombination(4)/gearCombination(5));
    spur1SFWear = maxTorqueSpurs(1,1) / torque1;
    spurs1SFStrength = maxTorqueSpurs(1,2) / torque1;
    spur2SFWear = maxTorqueSpurs(2,1) / torque2;
    spurs2SFStrength = maxTorqueSpurs(2,2) / torque2;
    if size(maxTorqueSpurs,1) > 2
        spur3SFWear = maxTorqueSpurs(3,1) / torque2;
        spurs3SFStrength = maxTorqueSpurs(3,2) / torque2;
        spur4SFWear = maxTorqueSpurs(4,1) / torque3;
        spurs4SFStrength = maxTorqueSpurs(4,2) / torque3;
    end
end

%% Data Presentation

