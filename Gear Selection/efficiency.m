% A function which includes efficiency in the potential table 
function potential = efficiency(potentialOld,motorSpeed,wormDiam)
    [rPot,cPot] = size(potentialOld);
    spurEff = 0.98;
    wormEff = wormEfficiency(motorSpeed,wormDiam);
    %identify what gears are used.
    id = find(potentialOld(:,1:cPot-1)); %edit if add more info to potential
    locations = zeros(rPot,cPot-1);
    locations(id) = 1;
    efficiencyID = sum(locations,2);
    %1 = w; 2 = h; 3 = w+h; 4 = h+h; 5 = w+h+h
    efficiency = zeros(rPot,1);
    %calculate efficienies
    w = find(~(efficiencyID - 1));
    efficiency(w) = wormEff;
    s = find(~(efficiencyID - 2));
    efficiency(s) = spurEff;
    ws = find(~(efficiencyID - 3));
    efficiency(ws) = wormEff*spurEff;
    ss = find(~(efficiencyID - 4));
    efficiency(ss) = spurEff*spurEff;
    wss = find(~(efficiencyID - 5));
    efficiency(wss) = wormEff*spurEff*spurEff;
    potential = [potentialOld,efficiency];
end