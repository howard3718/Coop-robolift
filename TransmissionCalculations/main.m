%%%  CALCULATIONS TO DETERMINE THE MOTOR AND TRANSMISSION OF THE ROBOTS %%%

%% Definitions %%

%The gears used here will be worm, spur and helix. See logbook.

%The transmission will have no more than one worm drive. See logbook.

%Reducing cost is more important than reducing the size (relative criteria
%sheet).

%mod: 0.5, 0.8, 1, 1.25, 1.5

tic
minMotorSpeed = 13000; %rpm
maxMotorSpeed = 13900; %rpm

wormMax = 120;
helicalMax = 10;
spurMax = 6;

%Gear tables
%worm
% wormTab = zeros(39,2,5); %pages 0.5 mod is page 1...
% for i = 1:5
%     wormTab(:,:,i) = csvread('wormtable1.xlsx',i);
% end
% %helical
% helicalTab = zeros(67,2,2); %pages
% for i = 1:2
%     helicalTab(:,:,i) = xlsread('helicaltable.xlsx',i);
% end

wormTab = csvread('worm05.csv');
helicalTab = csvread('helical05.csv');

%% Variables that can be changed. %%
motorSpeedI = 100;
helicalEfficiency = 0.95;
folder = 'test2/';


%% Main Script %%

mechanism.speed = 60; %rpm
mechanism.torque = 3; %Nm

wormTab = wormTab(:,:,1);%mod 0.5
helicalTab = helicalTab(:,:,1);

for motorSpeed = minMotorSpeed:motorSpeedI:maxMotorSpeed %loop for different motor speeds
   
   ratio = motorSpeed/mechanism.speed; %calculate ratio
   
   potential = gearSelection(ratio,wormTab,helicalTab);
   
   wormEff = wormEfficiency();
   efficiency = wormEff*helicalEfficiency;
   
   motorTorque = (mechanism.torque)/(efficiency*ratio); %this isnt includingn the error in ratio.
   motorPower = motorTorque*motorSpeed*(pi()/30);
   
   filename = strcat(folder,'Power',num2str(motorPower),'_Torque',num2str(motorTorque),'_Speed',num2str(motorSpeed),'.csv');
   csvwrite(filename,potential);
end
toc
   
       
    
    

    