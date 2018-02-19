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
%Read in helical data
helicalTab = zeros(72,2,5); %pages are mod 0.5,0.8,1,1.25,1.5
for i = 1:5
    helicalTab(:,:,i) = xlsread('H:\DMT 2017\Gear Data\helicaltable.xlsx',i);
end
%Read in worm data
wormTab = zeros(39,2,5); %pages 0.5 mod is page 1...
for i = 1:5
    wormTab(:,:,i) = xlsread('H:\DMT 2017\Gear Data\wormtable.xlsx',i);
end
%% Definitions

%Maximum ratios: (Peter Childs) % NEED TO ADJUST FOR THESE
%   Spur = 1:1 to 6:1
%   Helical = 1:1 to 10:1
%   Worm = 5:1 to 75:1

wormDiam = [12;12;15;16;20];
mod = [0.5;0.8;1.0;1.25;1.5];
faceWidthHelical = [6;10;12;12;16];
materialRateSurface = [500;1400]; %|delrin|steel|
materialRateBend = [3900;17000]; %|delrin|steel|

%% Input Parameters

%Mechanism Requirements:
mechSpeed = (6.64*60)/(2*pi); %rpm - from Georges code for lifting.
mechTorque = 3.54; %Nm - from Georges code for lifting.

%Motor Information
motorSpeed = 4289; %rpm



%% Gear Selection
%Extract one page of gear data
helicalPage = helicalTab(:,:,1);
wormPage = wormTab(:,:,1);
wormPCD = wormDiam(1);
%Remove zeros

%Ratio Required - based on speed.
ratioRequired = motorSpeed/mechSpeed;

%select potential gear combinations
potentialGears = gearSelectionFun(ratioRequired,wormPage,helicalPage);

%% Efficiency Calculations

%Literature Estimates: (Peter Childs)
%   Spur = 98-99%
%   Helical = 98-99%
%   Worm = 20-98%

%calculate the efficiencies of each combination
potentialGears = efficiency(potentialGears,motorSpeed,wormPCD);
%order the list by row.
potentialGears = sortrows(potentialGears,6);


%% Gear Stresses

%Start with the first one on the list.
gearCombination = potentialGears(2,:);
ratio = ratioEvaluate(gearCombination);

%Collect information about worm


%Collect information about helical
modHelical = mod(1); 
Fhelical = faceWidthHelical(1)*0.0394; %in
runTime = 12; % - 1,6,12 or 24 -could be updated later
Sc = materialRateSurface(1);
Sb = materialRateBend(1);

gearStressInputH  = [modHelical,Fhelical,runTime,Sc,Sb];

if gearCombination(2) ~= 0
    maxLoadsArray = gearStressHelical(gearCombination,gearStressInputH,motorSpeed);
end

%% Data Presentation

