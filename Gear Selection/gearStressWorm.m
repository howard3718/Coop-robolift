function [ output_args ] = gearStressWorm( input_args )
%GEARSTRESSWORM Calculate the stress in the worm and wheel.
%assume 12 hours a day. - for now check continuity. 

leadAngle = 2 + 23/60;
speed = motorSpeed;
wormPCD = input * .0394; %inches
wormAdd = mod * .0394; %in % assume addendum is the same as the mod.
wormOD = input * .0394; %inches

rubbing = ((wormPCD*pi*speed)/12) * secd(leadAngle); %ft/min
efw = 2 * sqrt(wormAdd*(wormOD - wormAdd)); 

cosine = wormPCD/wormOD;
theta = acosd(cosine);

Lr = 2*theta*(wormOD/2)*0.017545;



end

