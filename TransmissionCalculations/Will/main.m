%%%  CALCULATIONS TO DETERMINE THE MOTOR AND TRANSMISSION OF THE ROBOTS %%%

%% Definitions %%
clear
%The gears used here will be worm, spur and helix. See logbook.

%The transmission will have no more than one worm drive. See logbook.

%Reducing cost is more important than reducing the size (relative criteria
%sheet).

%mod: 0.5, 0.8, 1, 1.25, 1.5


% minMotorSpeed = 13350; %rpm
% maxMotorSpeed = 13370; %rpm
motorSpeed = 4289;

wormMax = 120;
helicalMax = 10;
spurMax = 6;

%Gear tables
%worm
wormTab = zeros(39,2,5); %pages 0.5 mod is page 1...
for i = 1:5
    wormTab(:,:,i) = xlsread('wormtable.xlsx',i);
end
%helical
helicalTab = zeros(67,2,2); %pages
for i = 1:2
    helicalTab(:,:,i) = xlsread('helicaltable.xlsx',i);
end

%% Variables that can be changed. %%
%motorSpeedI = 10;
wormDiam = 0.012; %m
helicalEfficiency = 0.95;
folder = 'testEff1/';

%% Main Script %%

mechanism.speed = (6.64*60)/(2*pi); %rpm
mechanism.torque = 3.54; %Nm

wormTab = wormTab(:,:,1);%mod 0.5
helicalTab = helicalTab(:,:,1);

%Add cost of worm 
wormTab(:,2) = wormTab(:,2) + 15;


%for motorSpeed = minMotorSpeed:motorSpeedI:maxMotorSpeed %loop for different motor speeds
   
   transmission.ratio = motorSpeed/mechanism.speed; %calculate ratio
   
   potential = gearSelection(transmission.ratio,wormTab,helicalTab);
   
   potential = efficiency(potential,motorSpeed,wormDiam);
   
   potential = sortrows(potential,6);
   
   effCheap = potential(1,7);
   
   transmissionRatioAdj = transmission.ratio / effCheap;
   
   potentialAdj = gearSelection(transmissionRatioAdj,wormTab,helicalTab);
   potentialAdj = sortrows(potentialAdj,6);
   
   
   
   %change this
%    motorTorque = mechanism.torque*efficiency*ratio; %this isnt includingn the error in ratio.
%    motorPower = motorTorque*motorSpeed*(30/pi());
%    
%    filename = strcat(folder,'power',num2str(motorPower),'torque',num2str(motorTorque),'speed',num2str(motorSpeed));
%    csvwrite(filename,potential);
%end
   
   
       
    
    

    