% A function which includes efficiency in the potential table 
function potential = efficiency(potentialOld,motorSpeed,wormDiam)
    [rPot,cPot] = size(potentialOld);
    helicalEff = 0.95;
    wormEff = wormEfficiency(motorSpeed,wormDiam);
    %identify what gears are used.
    id = find(potentalOld(:,1:cPot-1)); %edit if add more info to potential
    locations = zeros(rPot,cPot-1);
    locations(id) = 1;
    efficiencyID = sum(locations,2);
    %1 = w; 2 = h; 3 = w+h; 4 = h+h; 5 = w+h+h
    efficiency = zeros(rPot,1);
    %calculate efficienies
    w = find(~(efficiencyID - 1));
    efficiency(w) = wormEff;
    h = find(~(efficiencyID - 2));
    efficiency(h) = helicalEff;
    wh = find(~(efficiencyID - 3));
    efficiency(wh) = wormEff*helicalEff;
    hh = find(~(efficiencyID - 4));
    efficiency(hh) = helicalEff*helicalEff;
    whh = find(~(efficiencyID - 5));
    efficiency(whh) = wormEff*helicalEff*helicalEff;
    potential = [oldPotential,efficiency];
end