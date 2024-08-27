%% Ejercicio 1
clear all;
close all; 
clc;

% a
% tf para decirle que la variable "s" es la que se usa en Laplace.
s  = tf("s");
T  = 4;
K  = 5;
y0 = 20;

g = K/(T*s+1);

% caso d

impulse((2/s^2)*g,[0,10])
