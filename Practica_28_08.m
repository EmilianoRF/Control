%% Ejercicio 2
clear all;
close all; 
clc;


K  = 10;
wn = 4.97;
zita = 0.198;
T  = 1/wn;


s = tf("s");

%G = K/(T^2*s^2+2*zita*T*s+1);
G = (s+2)/(s^2+5.6*s+0.2);
step(G)