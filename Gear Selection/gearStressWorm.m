function [ output_args ] = gearStressWorm( input_args )
%GEARSTRESSWORM Calculate the stress in the worm and wheel.

leadAngle = 2 + 23/60;
speed = motorSpeed;
wormPCD = input * .0394; %inches
wormAdd = mod * .0394; %in % assume addendum is the same as the mod.


rubbing = ((wormPCD*pi*speed)/12) * secd(leadAngle); %ft/min
efw = 2 * sqrt(wormAdd*())

end

