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
    %Sukiriam visus galimus poaibius
    Poaibiai = {};
    if ilgisCiklui >1,
        for i=1:ilgisCiklui,
            if (i == 1),
                for i=1:ilgis,
                    Vir = V(i);
                    Poaibiai{length(Poaibiai) + 1} = Vir;
                end
            end
            if (i == 2),
                for j=1:(ilgis - i + 1),
                    for j2 = j:ilgis,
                        if (j2 > j),
                            Vir(1) = V(j);
                            Vir(2) = V(j2);
                            Poaibiai{length(Poaibiai) + 1} = Vir;
                        end
                    end
                end
            end
            if (i == 3),
                for j=1:(ilgis - i + 1),
                    for j1= (j + 1):(ilgis - i  + 2),
                        for j2 = j1:ilgis,
                            if (j2 > j1 && j1 > j),
                                 Vir(1) = V(j);
                                 Vir(2) = V(j1);
                                 Vir(3) = V(j2);
                                 Poaibiai{length(Poaibiai) + 1} = Vir;
                            end
                        end
                    end    
                end
            end
        end
    end
    %Sujungiam poaibius su krastinem
    Krastines = {};
    for i=1:length(Poaibiai),
        Virs1 = Poaibiai(i);
        PoaibioIlgis = length(Poaibiai(i));
        for j=1:length(Virs1),
             Krast1 = {};
             for j2=1:length(V),
                 reiksme1 = cell2mat(Virs1(j));
                 for t=1:length(reiksme1),
                    lygin = reiksme1(t);
                    reiksme2 = V(j2);
                 if (reiksme1 ~= reiksme2),
                     for j3=1:length(U),
                         AA = U(j3);
                         AA1 = cell2mat(AA(1));
                         if (AA1(1) == lygin && AA1(2) == reiksme2),
                             Krast1(length(Krast1)+1) = AA;
                         end
                         if (AA1(2) == lygin && AA1(1) == reiksme2),
                             Krast1(length(Krast1)+1) = AA;
                         end
                     end
                 end
                 end
             end
        end
        ismetimoKiekis = length(V) - length(Krast1) - 1;
        for j = 1 : ismetimoKiekis,
        end
        Krastines{length(Krastines) + 1}= Krast1;
    end
    %Jungumas
    for i=1:length(Poaibiai),
        Keliai = (Krastines(i));
        TikriKeliai = Keliai{1};
        if (length(TikriKeliai) >= (ilgis - 1)), 
            Laipsniai = [];
            Laipsniai(length(V)) = 0;
            for j=1:length(TikriKeliai),  %Suzinome visu virsuniu laipsnius
                AA = TikriKeliai(j);
                AA1 = cell2mat(AA(1));
                for j2=1:length(V),
                    if ((AA1(1) == V(j2)) || (AA1(2) == V(j2))),
                        Laip = Laipsniai(j2);
                        Laip = Laip + 1;
                        Laipsniai(j2) = Laip;
                    end
                end
            end
            patikrinimas = 0;
            for j=1:ilgis,
                if (Laipsniai(j) ~= 0),
                    patikrinimas = patikrinimas + 1;
                end
            end
            if (patikrinimas == ilgis), %eliminuojami pografiai su 0 laipsniais
                Jungios = 0;
                Komponentes = zeros(1, ilgis);
                while any(Komponentes == 0)
                    NJung = V(Komponentes == 0);
                    Pirmas = NJung(1);
                    Jungios = Jungios + 1;
                    Komponentes(Pirmas) = Jungios;
                    leidimas = true;
                    while leidimas
                        JungiosiosB = Komponentes;
                        for rr = 1:length(TikriKeliai),
                            AA = TikriKeliai(rr);
                            AA1 = cell2mat(AA(1));
                            if (Komponentes(AA1(1)) == Jungios)
                             Komponentes(AA1(2)) = Jungios;
                            end
                            if (Komponentes(AA1(2)) == Jungios)
                                Komponentes(AA1(1)) = Jungios;
                            end
                        end
                        leidimas = any(JungiosiosB ~= Komponentes);
                    end
                end
                if (Jungios == 1),
                    rezU{length(rezU) + 1} = TikriKeliai;
                end
            end
        end
    end
end


