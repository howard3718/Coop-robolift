% A FUNCTION THAT CALCULATES THE EFFICIENCY OF THE WORM %%

function [efficiency] = wormEfficiency(speed,wormDiam)
    %efficiency = 0.85;
    phi = 20; %degrees - pressure angle
    leadAngle = 2.3833; %decimal degrees
    
    %Calculate friction factor
    slidingVelocity = (speed*wormDiam*10^3)/(19098*cosd(leadAngle)); %from Peter Childs
    if slidingVelocity <= 0.0508
        f = 0.124*exp(-2.233*slidingVelocity^0.645);
    else
        f = 0.103*exp(-1.185*slidingVelocity^0.45);
    end
    
    efficiency = (((cosd(phi)*cosd(leadAngle)) - (f * sind(leadAngle)))/((cosd(phi)*sind(leadAngle))+(f*cosd(leadAngle))))*tand(leadAngle);
end 