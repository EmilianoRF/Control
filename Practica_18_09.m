%% Ejercicio 2
close all
clear all
clc

s = tf("s");

K = 1;
H = 1;
G_s = K*(s/15+1)^2/(s*(s+2)*(s+10))
rlocus(G_s)

%a) 10.3 < K < 1.62e4
%a) 0< K < 10.3 y  1.62e4 < K < infinito

% c) K = 10.3 y K=1.62e4
% d) No existe valor de K que establezca una ganancia crítica.
% e) 
Mp = 0.25;
zita = -log(Mp)/(sqrt(pi^2+log(Mp)^2))
%k1 = 3.95
K = 2.61e3
G_s2 = G_s*K;
G_bc = minreal(K*G_s2*H/(1+K*G_s2*H))
figure
step(G_bc)
grid on

%% Ejercicio 3
close all
clear all
clc

s = tf("s");

H = 1;
p1 = 0;
p2 = -3 + 4*j;
p3 = -3 - 4*j;

G = 1/((s-p1)*(s-p2)*(s-p3));

G_ba = G*H;

rlocus(G_ba)

% b) Kcritico = 150; K es estable en el rango 0<K<150.
% c) K aprox 45.

% e)
K = 150;

G_bc = minreal(K*G_ba/(1+K*G_ba));

step(G_bc)
pole(G_bc)

% f)
K = 73.3;

G_bc = K*G_ba/(1+K*G_ba);

step(G_bc)

%% Actividad 6
clear all
clc
close all
%b

s = tf("s");
G_s = ((s+2)/(s^2+2*s+3))*((2-2*s)/(2+2*s));
H = 1;

rlocus(G_s)






%% Actividad 5

close all
clear all
clc

s = tf("s");

G_s = 2*s/(s^2+6*s+10);

rlocus(G_s);
