function Q1d()
    clear all
    tic
    
    
    power = 80;
    armlength = 0.18;
    pitch = 2e-3;
    diameter = 10e-3;
    mu_k = 0.1;
    mass = 125;
    weight = 125*9.8;
    tanphi = (pitch/(diameter * pi));
    
    startx = 2.4736e-3;
    startv = 1e-10;
    
    timespan = [0 7.5];
    [t, x] = ode45(@state_space, timespan, [startx startv]);
    
    h = figure('visible', 'on');
    plot(t, x(:, 1), t, x(:,2));
    legend('Position','Speed');
    title(['Position and speed at ' num2str(power) 'W'])
    toc

    function dxdt = state_space(t, x)
        dxdt = zeros(2,1);
        dxdt(1) = x(2) ;
        dxdt(2) = 1/mass * (armlength^2 - x(1)^2)^0.5/(x(1) * x(2)) *  (power) - ( weight + (tanphi + mu_k)/(1-mu_k*tanphi)*(weight)/(tanphi) );
    end


end   