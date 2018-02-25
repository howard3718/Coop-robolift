function [maxTorque] = gearStressWorm(input,motorSpeed)
%GEARSTRESSWORM Calculate the stress in the worm and wheel.
%assume 12 hours a day. - for now check continuity. 

mod = input(1);
leadAngle = input(4);
speed = motorSpeed/input(5); %worm first in the transmission.
wormPCD = input(2) * .0394; %inches
wormAdd = mod * .0394; %in % assume addendum is the same as the mod.
wormOD = input(3) * .0394; %inches
wheelTeeth = input(5);


D = mod*wheelTeeth * .0394;

Sc = 14000;
Sb = 17000;

rubbing = ((wormPCD*pi*motorSpeed)/12) * secd(leadAngle); %ft/min
efw = 2 * sqrt(wormAdd*(wormOD - wormAdd)); 

cosine = wormPCD/wormOD;
theta = acosd(cosine);

Lr = 2*theta*(wormOD/2)*0.017545;

%Maybe need table for running time factor. 

Xc = XcEvaluateW(speed,rubbing);
Xb = XbEvaluateW(speed);

wear = 0.18 * Sc * Xc * efw * D^1.8; %lbs.Ins
strength = 1.8 * Sb * Xb * Lr * wormAdd * D * cosd(leadAngle); %lbs Ins

wearMax = wear /  0.11298; %Nm
strengthMax = strength /  0.11298; %Nm
maxTorque = [wearMax,strengthMax];
end

