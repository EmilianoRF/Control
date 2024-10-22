%% Primera parte
close all
clear all
clc

s = tf('s');

G = 60/(s+2)^3;
H = 1;

%Gbc = G/(1+G*H);
% Es mejor usar feedback

%Gbc = feedback(G,H,-1);

%step(Gbc)
%Gbc = feedback(2.53*G,H,-1);
Gbc = feedback(G/s,H,-1);
rlocus(G/s)
step(Gbc)


%% Segunda parte

close all
clear all
clc

s = tf('s');

kd = 1.2;
G = 60/(s+2)^3;

margin(G*kd)

Td = tand(42)/3.65;
GPD = kd*(Td*s+1);

margin(GPD*G)
%% Tercera parte

close all
clear all
clc

s = tf('s');

G = 60/(s+2)^3;

Ki = 10^(-12.5/20);
Ti = 1/0.346;
Gpi = (Ki/(Ti*s))*(Ti*s+1);

margin(G*Gpi)


