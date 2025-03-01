function [sk, pografiai] = oilerCiklai( V, U, Vkor, num, pografiai )
%V - grafo virsuniu aibe;
%U - grafo briaunu matrica;
%num - ieskomo ciklo numeris(reikalinga grafiko piesimui);
%sk - grazinamas nupiestu ciklu numeris(reikalina grafiko piesimui);
%pografiai - indukuotuju pografiu aibe, atitinkanciu Oilerio ciklo salyga

%Algoritmas
%rekursiskai ieskoma visu galimu pografiu ir tikrinama ar jie atitinka
%Oilerio ciklo salyga, tai yra, ar visu ju virsuniu laipsniai yra lyginai.
%jei salyga tenkinama pografis pavaizduojamas grafiskai ir irasomas i
%pografiu matrica. du kartus tas pats pografis nevaizduojamas ir
%neirasinejamas i pografiu matrica.

if length(V) > 2 && length(U) > 2   %jei i funkcija perduotame grafe/pografyje dar yra pakankamai virsuniu ciklui
    for i=1:length(V)               %tikrinami atskiri virsuniu atvejai
        tempV = V;                  %padaroma laikina virsuniu aibe(reikalinga tik sitame cikle)
        tempV(i) = [];              %isvaloma tam tikra virsune
        tempU = {};                 %sukuriama laikina briaunu aibe
        for j=1:length(U)           %atreankamos tik tempV virsuniu aibei priklausancios briaunos
            if U{j}(1) ~= V(i) && U{j}(2) ~= V(i)
                tempU{length(tempU)+1} = U{j};
            end
        end
        nums = [];      %virsuniu laipsniu sarasas
        for j=1:length(tempV)   %visoms virsunems
            nums(j) = 0;
            for k=1:length(tempU)       %suskaiciuojami laipsniai
                if tempU{k}(1) == tempV(j) || tempU{k}(2) == tempV(j)
                    nums(j) = nums(j)+1;
                end
            end
        end
        ok = 1;                 %kintamasis reikalingas salygu tikrinimam, jie visos salygos geros tada jis ir liks 1
        for j=1:length(nums)    %tikrinama ar visos virsunes lyginio laipsnio
            if mod(nums(j),2) ~= 0 || nums(j) == 0  %lyginiu virsuniu salygos tikrinimas
                ok = 0;
                break;          %ciklas nutraukiamas, kad butu sutaupoma laiko
            end
        end
        if ok == 1              %jie virsuniu laipsniai atitinka salyga, tikrinama ar sis ciklas nebuvo irasytas anksciau
            for j=1:length(pografiai)
                if isequalwithequalnans(pografiai{j}, tempV) == 1   %jei ciklas jau buvo irasytas
                    ok = 0;
                    break;
                end
            end
        end
        if ok == 1              %jei rastas indukuotasis pografis yra naujas
            pografiai{length(pografiai)+1} = tempV;
            tempVkor = [];              %laikina konkretaus pografio virsuniu koordinaciu aibe
            for j=1:length(tempV)       %atrenkamos koordinates pografio pavaizdavimui
                tempVkor(j,1) = Vkor(tempV(j), 1);
                tempVkor(j,2) = Vkor(tempV(j), 2);
            end
            figure(num)             %figuros numeris
            grid on
            title('Rastas Oilerio ciklas pografyje')
            plotGraphVU1(tempV,tempU,0,0,tempVkor,0,10,2,'r')   %pografio brezimas
            num = num+1;
        end
        [num, pografiai] = oilerCiklai(tempV, tempU, Vkor, num, pografiai );    %rekursiskai kreipiamasi toliasnem pografiu paieskom
    end
end
sk = num;   %rastu ciklu skaicius
return