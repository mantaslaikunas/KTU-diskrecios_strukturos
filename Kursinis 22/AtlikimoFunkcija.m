function [rezU] = AtlikimoFunkcija( V, U)
    rezU = {};
    ilgis = length(V);
    ilgisCiklui = round(ilgis/2) - mod(ilgis, 2);
    %Ciklo esme tokia: Sudarysime visas imanomas aibes. Taciau ju reikia
    %Tik per pus maziau naudoti cikla, nes virsunes tada kartosis
    %Naudojantis visu galimybiu formule, kai reiksmes negali kartotis, 
    %Apskaiciuosime, kiek kartu kiekviena cikla prasukus reikes skaiciuoti
    %Pirmosios puses aibes. Is pradziu bus vienetine aibe, po to is
    %dveju elementu ir t.t.
    KompleksinisKelias = 0;
    for i=1:ilgisCiklui,
        KompleksinisKelias = KompleksinisKelias + RadimasC(i, ilgis);
    end
    %VK = [];                                   %Nepanaudota funkcija
    %if ilgisCiklui> 1
    %    for i=1:ilgisCiklui, 
    %        for j=1:i,
    %            kelias = 0;
    %            for r=1:(ilgis-i+j),
    %                for t=1:RadimasC(i - j , ilgis - r),
    %                    kelias = kelias + 1;
    %                    poz = PozicijaC(i, ilgis, kelias, j, r);
    %                    VK(poz , j) = V(r);
    %                end
    %            end
    %        end
    %    end
    %end
    %Sukuriam visus galimus poaibius
    Poaibiai = {};
    %sukuriam poaibius ið 3 elementø
    for i=1:ilgis
        for j=i+1:ilgis
            for k=j+1:ilgis
                Poaibiai{length(Poaibiai)+1} = [V(i), V(j), V(k)];
            end
        end
    end
    %sukuriam porinius poaibius
    visiPoaibiai2 = {};
    for i=1:ilgis-4
        p = generuotiPoaibius(V, i);
        for j=1:length(p)
            visiPoaibiai2{length(visiPoaibiai2)+1} = p{j};
        end
    end
    for i=1:length(visiPoaibiai2)
        visiPoaibiai2{i} = sort(visiPoaibiai2{i});
    end
    Poaibiai2 = {};
    for i=1:length(visiPoaibiai2)
        yra = 0;
        for j=1:length(Poaibiai2)
            if length(Poaibiai2{j}) == length(visiPoaibiai2{i})
                if Poaibiai2{j} == visiPoaibiai2{i}
                    yra = 1;
                end
            end
        end
        if yra == 0
            Poaibiai2{length(Poaibiai2)+1} = visiPoaibiai2{i};
        end
    end
    %Sujungiam poaibius su poriniais poaibiais
    for i=1:length(Poaibiai)
        for j=1:length(Poaibiai2)
            tmpU = U;
            poaibis = Poaibiai{i};
            poaibis2 = Poaibiai2{j};
            yraGrafe = 1;
            for k=1:length(poaibis)
                for l=1:length(poaibis2)
                    
                    virsune = [poaibis(k), poaibis2(l)];
                    yraVirsune = 0;
                    if poaibis(k) ~= poaibis2(l)
                    for e = 1:length(tmpU)
                        if (~isempty(find(ismember(poaibis(k), tmpU{e}),1))) && (~isempty((find(ismember(poaibis2(l), tmpU{e}),1))))
                            yraVirsune = e;
                        end
                    end
                    end
                    if ~yraVirsune == 0
                        tmpU{yraVirsune} = [];
                    else
                        yraGrafe = 0;
                    end
                    
                end
            end
            if yraGrafe == 1
                for k=1:length(poaibis)
                    for l=1:length(poaibis)
                        
                        virsune = [poaibis(k), poaibis(l)];
                        yraVirsune = 0;
                        if poaibis(k) ~= poaibis(l)
                            for e = 1:length(tmpU)
                                if (~isempty(find(ismember(poaibis(k), tmpU{e}),1))) && (~isempty((find(ismember(poaibis(l), tmpU{e}),1))))
                                    yraVirsune = e;
                                end
                            end
                        end
                        if ~yraVirsune == 0
                            tmpU{yraVirsune} = [];
                        else
                            yraGrafe = 0;
                        end
                        
                    end
                end
                
                for k=1:length(poaibis2)
                    for l=1:length(poaibis2)
                        
                        virsune = [poaibis2(k), poaibis2(l)];
                        yraVirsune = 0;
                        if poaibis2(k) ~= poaibis2(l)
                            for e = 1:length(tmpU)
                                if (~isempty(find(ismember(poaibis2(k), tmpU{e}),1))) && (~isempty((find(ismember(poaibis2(l), tmpU{e}),1))))
                                    yraVirsune = e;
                                end
                            end
                        end
                        if ~yraVirsune == 0
                            tmpU{yraVirsune} = [];
                        else
                            yraGrafe = 0;
                        end
                        
                    end
                end
                if yraGrafe == 0
                    virsunes = {};
                    for q = 1:length(poaibis)
                        for w = 1:length(poaibis2)
                            virsunes{length(virsunes)+1} = [poaibis(q), poaibis2(w)];
                        end
                    end
                    rezU{length(rezU) + 1} = virsunes;
                end
            end
            
        end
    end
    %Jungumas
%     for i=1:length(Poaibiai),
%         Keliai = (Krastines(i));
%         TikriKeliai = Keliai{1};
%         if (length(TikriKeliai) >= (ilgis - 1)), 
%             Laipsniai = [];
%             Laipsniai(length(V)) = 0;
%             for j=1:length(TikriKeliai),  %Suzinome visu virsuniu laipsnius
%                 AA = TikriKeliai(j);
%                 AA1 = cell2mat(AA(1));
%                 for j2=1:length(V),
%                     if ((AA1(1) == V(j2)) || (AA1(2) == V(j2))),
%                         Laip = Laipsniai(j2);
%                         Laip = Laip + 1;
%                         Laipsniai(j2) = Laip;
%                     end
%                 end
%             end
%             patikrinimas = 0;
%             for j=1:ilgis,
%                 if (Laipsniai(j) ~= 0),
%                     patikrinimas = patikrinimas + 1;
%                 end
%             end
%             if (patikrinimas == ilgis), %eliminuojami pografiai su 0 laipsniais
%                 Jungios = 0;
%                 Komponentes = zeros(1, ilgis);
%                 while any(Komponentes == 0)
%                     NJung = V(Komponentes == 0);
%                     Pirmas = NJung(1);
%                     Jungios = Jungios + 1;
%                     Komponentes(Pirmas) = Jungios;
%                     leidimas = true;
%                     while leidimas
%                         JungiosiosB = Komponentes;
%                         for rr = 1:length(TikriKeliai),
%                             AA = TikriKeliai(rr);
%                             AA1 = cell2mat(AA(1));
%                             if (Komponentes(AA1(1)) == Jungios)
%                              Komponentes(AA1(2)) = Jungios;
%                             end
%                             if (Komponentes(AA1(2)) == Jungios)
%                                 Komponentes(AA1(1)) = Jungios;
%                             end
%                         end
%                         leidimas = any(JungiosiosB ~= Komponentes);
%                     end
%                 end
%                 if (Jungios == 1),
%                     rezU{length(rezU) + 1} = TikriKeliai;
%                 end
%             end
%         end
%     end
end


