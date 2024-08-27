%% Intro
clear all;
close all; 
clc;


% tf para decirle que la variable "s" es la que se usa en Laplace.
s = tf("s");

g = 10/(6*s+2);

figure
impulse(g);


% Respuesta al ecalón de amplitud 2.
figure 
step(2*g)

% Respuesta a la rampa x(t) = 3t.
figure
impulse(g*3/s^2,3/s^2,4)

R = 1e6;
C = 0.2e-6;
K = 100;

%% Despues
R = 1e6;
C = 0.2e-6;
K = 100;
Vo_o = 5;

Vi_s = K/s;
Vo_s = Vi_s*(1/(R*C*s+1))+(R*C*Vo_o)/(R*C*s+1);
figure
impulse(Vo_s,1)

figure
Vo_o = 0;
Vo_s = Vi_s*(1/(R*C*s+1))+(R*C*Vo_o)/(R*C*s+1);

impulse(Vo_s,1)




