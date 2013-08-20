%Tautvydas Petkus IF-1/9 2012.11.25
%Diskre?i? strukt?r? kursinis darbas
%var 37b.
%Sudaryti algoritm? ir program?, kuri rast? visus dalinius dvipusius jungius grafus.
clc, close all, clear all ;
V = importdata('Virsunes.txt');
U = {};
T = importdata('Briaunos.txt');
for i=1:length(T),
    U{i} = [T(i, 1) T(i, 2)];
end
[rezU] = AtlikimoFunkcija(V, U);
for i=1:length(rezU), %Isvedami musu rezultatai i konsoles langa
    AA = rezU{i};
    i
    for j=1:length(AA),
        AA1 = cell2mat(AA(j))
    end
end
hold on; axis equal; axis([-1.1,1.1,-1.1,1.1]); grid on
arc=0; poz=0; Fontsize=10; lstor=1; spalva='b';
figure(1)
title('Duotasis grafas')
plotGraphVU1(V,U,0,0,[],1,10,3,'g');
title('Gautas grafas')
plotGraphVU1(V,rezU{1},0,0,[],1,10,3,'r'); %isvedam pati pirma rezultata grafiskai
