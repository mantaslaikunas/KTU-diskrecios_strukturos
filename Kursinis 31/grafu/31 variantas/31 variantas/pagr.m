clc, close all, clear all ;

% Grafo virsuniu zymejimas ekrane
%  % Lango mastelis
% hold on; axis equal; axis([-1.1,1.1,-1.1,1.1]); grid on
% 
 %Grafo virsuniu zymejimas
 Vkor=[];
 nn = 0;
 % Ciklas virsunems zymeti
 disp('kairys mygtukas zymi taskus nuo 1 iki (n-1)')
 disp('desinys - paskutini taska n')
but = 1;

%V = [1 2 3 4 5 6];
%U = {[1 2], [1 3], [1 6], [3 4], [3 5], [5 6]};

V = [1 2 3 4 5 6];
U = {[1 2], [1 3], [1 6], [2 3], [2 4], [3 4], [3 5], [5 6]};
 
%breziamas pradinis grafas
%figure(1)
%title('Duotasis grafas')
%plotGraphVU1(V,U,0,0,Vkor,0,10,2,'b')
krastines = {};
[krastines] = oilerCiklai(V, U, Vkor, 2, pografiai);