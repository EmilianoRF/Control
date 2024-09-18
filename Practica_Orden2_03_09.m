clear all;
close all; 
clc;


% tf para decirle que la variable "s" es la que se usa en Laplace.
s = tf("s");
wn   = 3;
zita = 0.198;
K    = 8;
T    = 1/wn;

G = K/(T^2*s^2 + 2*zita*T*s + 1);


figure
impulse(G);