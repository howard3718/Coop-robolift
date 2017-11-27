%power calculations for cooperative lifting

%references can be found to say that the incline of a scissor lift should
%not be less than 10 degrees when loaded to avoid excessive torque 
minTheta = 10*pi/180;

%the lifting platform should not exceed 200mm in either dimension
%making the link 180 mm allows for sufficient spacing
lengthDouble = 0.18;

%PDS specifies lift height
liftHeight = 0.035;

%using trig find the initial and final height x and y dimensions
initialX = lengthDouble*cos(minTheta);
initialY = yValue(initialX,minTheta);
finalY = initialY + liftHeight;
maxTheta = asin(finalY/lengthDouble);
finalX = lengthDouble*cos(maxTheta);

%define parameters for the screw
pitch = 1.25e-03;
meanDiameter = 0.01;
meanRadius = meanDiameter/2;
leadPhi = atan(pitch/(pi*meanDiameter));
muStatic = 0.15;
muKinetic = 0.1;

%include file in report to show that equilibrium analysis of the two links
%shows that the weight W can be referred to the screw thread axially via
%the following equation:

%weight lifted by one robot
g = 9.81;
mass = 125;
W = mass*g;
axialFInitial = W/tan(minTheta);
%any vertical force on the weight can be referred to the screw thread using
%tan(theta)

%calculate the stall torque 
stallTorque = ((tan(leadPhi)+muStatic)/(1-muStatic*tan(leadPhi)))*axialFInitial*meanRadius;

%assuming constant acceleration calculate acceleration needed to lift the
%pallet in 15 seconds using suvat/integration

%THIS IS A CALCULATION FOR HORIZONTAL ACCELERATION
%v = at
%s = 0.5*at^2
deltaX = lengthDouble *(cos(minTheta)-cos(maxTheta));
s = deltaX;
time = 15;
a = 2*s/(time^2);

%assume the power required is equal to the power lost to friction and the
%power required to drive up the load

%note the power changes as the speed changes with constact acceleration
step = 0.1;
frictionPower = zeros(1,(time/step)+1); %preallocate array space
liftingPower = zeros(1,(time/step)+1);
motorPower = zeros(1,(time/step)+1);
timeArray = 0:step:time;                %for the power time plot
velocity = zeros(1,(time/step)+1);      
omegaArray = zeros(1,(time/step)+1);

for t = 0:step:time
    v = a*t;
    omega = 2*pi*v/pitch;
    velocity(1,round(t/step)+1) = v;
    omegaArray(1,round(t/step)+1) = omega;
    theta = acos((a*t+lengthDouble*cos(minTheta))/lengthDouble);
    
    %both the angle and the speed are changing
    %the change in angle theta is realated to speed using the following
    %equation
    frictionPower(1,round(t/step)+1) = ((tan(leadPhi)+muKinetic)/(1-muKinetic*tan(leadPhi)))*(W/tan(theta))*meanRadius*omega;
    
    liftingPower(1,round(t/step)+1) = ((W+125*a)/tan(theta))*v;
    
    motorPower(1,round(t/step)+1) = frictionPower(1,round(t/step)+1)+liftingPower(1,round(t/step)+1);
end
%no idea why i have to round those values...

plot(timeArray,motorPower)

%write a function relating x and y using the formula y= x*tan(theta)
function y = yValue(x,theta)

    y = x*tan(theta);
end