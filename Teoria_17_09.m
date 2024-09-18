%% Ejercicio 1
close all
clear all
clc

s = tf("s");

K = 10;
G = 1/((s+1)*(s+2));
H = 1/((s+8)*(s+10));

rlocus(G*H)

G_bc  = K*G/(1+K*G*H)

% a)
    %i) K = 0.
    %ii) K = 500;
    %iii) K = 2000.

%b) Ganancia crítica K = 1450. Ganancia límite = 1450.
K = 1450;
G_bc  = K*G/(1+K*G*H);
p_kcrit = pole(G_bc)

%c) Ganancia K = 1800. Sistema inestable. 
K = 1800;
G_bc  = K*G/(1+K*G*H);
p_k1800 = pole(G_bc)
step(G_bc)
%d) ts = 8seg -> ζwn = sigma = 1/2.
figure
for k=790:0.5:800
    G_bc  = k*G/(1+k*G*H);
    step(G_bc)
    hold on
end

