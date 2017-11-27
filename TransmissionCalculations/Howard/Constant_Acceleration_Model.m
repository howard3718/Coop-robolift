clear all

tic

%Set time step
dt = 1e-5;
time = 0:dt:15;

%Declare system constants
power = 80;
armlength = 0.18;
pitch = 2e-3;
diameter = 10e-3;
mu_k = 0.1;
mass = 125;
weight = 125*9.8;
tanphi = (pitch/(diameter * pi));
startx = 2.4736e-3;

%Calculate acceleration
accel = 2*(7.5558e-3-startx)/(7.5^2);

%Declare arrays
x_2 = zeros(size(time));
x_1 = x_2;
x = x_2;

%Fill in const accel and x = 
x_2(1:length(x_2)/2) = accel;
x_2(length(x_2)/2:end) = -accel;
x(1) = startx;
for step = 1:1:(length(time)-1)
   x_1(step + 1) = x_1(step) + x_2(step)*dt;
   x(step + 1) = x(step) + x_1(step)*dt;
end

P = x .* x_1 ./ (armlength^2 + x.^2) .* (weight + mass.*x_2 + (tanphi + mu_k)/(1 - mu_k*tanphi)*weight/tanphi);

yyaxis left
plot(time, P);
xlabel('time');
ylabel('Power (W)');

yyaxis right
plot(time, x, time, x_1, time, x_2);
ylabel('Position, Speed and Accel');

title(['dt = ' num2str(dt)])

legend('Power', 'Position', 'Speed', 'Acceleration');

toc