% Reguladores por Análisis Frecuencial
%% Ejercicio 2
close all
clear all
clc

s = tf('s');

num = (s+5);
den = (s+0.1)*(s^2+10*s+29)*s;
G = num/den;

H = 1;

%Gbc = feedback(G,H,-1);
margin(G*H)

Kr = 10^(-22/20);
wc = 0.0968;
Ti = 10/wc;

Gpi = Kr*(Ti*s+1)/(Ti*s);
margin(G*Gpi)
Gbc = feedback(Gpi*G,H,-1);
step(Gbc)
%% Ejercicio 3
close all
clear all
clc

s = tf('s');

H = 1;


num = 200*(s+1);
den = (s+0.1)*(s^2+10*s+29);
G = num/den;
margin(G*H)

% Requisitos: MF = 60° y e = 1%.

wa = 7.18

Ma = 8.56
Ki = 10^(-Ma/20)
Ti = 10/wa

Gpi = Ki*(Ti*s+1)/(Ti*s)
margin(Gpi*G)
Gbc = feedback(Gpi*G,H,-1)
step(Gbc)

% Forma general para calcular Kd parau un error cualquiera
error = 0.01;
Kp = (1-error)/error;
Kd = evalfr(Kp/G,0)

margin(Kd*G)
wb = 16.3
Td = tand(34)/wb

Gpd = Kd*(Td*s+1)

margin(Gpd*G)

Gbc_PD = feedback(Gpd*G,H,-1)
step(Gbc_PD)

%% Ejercicio 4
close all
clear all
clc

s = tf('s');

H = 1;


num = 4;
den = s*(s+2);
G = num/den;
margin(G*H)
Kd = 10;
margin(10*G*H)

wb = 6.17
Td = tand(40)/wb
Gpd = Kd*(Td*s+1)

figure
margin(Gpd*G)

Gbc_PD = feedback(Gpd*G,H,-1)
figure
hold on
impulse((1/s^2)*Gbc_PD)
impulse(1/s^2)

%% Ejercicio 5
close all
clear all
clc

s = tf('s');

H = 1;
% Ver relacion entre zita y el margen de fase en el Ogata pagina 400

num = 30;
den = s*(s+10)^2;
G = num/den;
Kd=100
margin(Kd*G*H)
wb = 12.1
Td = tand(42)/wb
Gpd = (Td*s+1)
margin(Gpd^2*G*Kd)


%% Ejercicio 
close all
clear all
clc

s = tf('s');

H = 1;

num = 10;
den = (s+10)*(s+2)^2*(s+5)
G = num/den

% Forma general para calcular Kd parau un error cualquiera
error = 0.1;
Kp = (1-error)/error;
Kd = evalfr(Kp/G,0)

margin(Kd*G)


wb = 6.5
Td = tand(25)/wb
Gpd = (Td*s+1)
margin(Gpd^2*G*Kd)