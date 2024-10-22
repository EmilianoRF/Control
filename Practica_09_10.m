%% Ejercicio 1

close all
clear all
clc

s = tf('s');

num = 10*(s+0.1);
den = s*(s+0.5)*(s+1);
G = num/den;
nyquist(G)
figure
bode(G)
%% Ejercicio 2
c
K = 14.5;
num = K*(s+2);
den = s*(s+5)*(s^2+2*s+2);
G = num/den;
nyquist(G)
figure
margin(G)
figure
rlocus(G)


%% Ejercicio 3

close all
clear all
clc

s = tf('s');

% Figura 1
T1 = 1/1e-2;
T2 = 1;
T3 = 1/1e2;
K  = 1;

num = K*(T1*s+1);
den = s*(T2*s+1)*(T3*s+1)^2;
G   = num/den;

margin(G)

% Figura 2
T1 = 1/1e-2;
T2 = 1/10;
K  = 1;

num = K*(T1*s+1);
den = s*(T2*s+1)*(T3*s+1)^2;
G   = num/den;

margin(G)

% Figura 3
T1 = 1;
T2 = 1/10^2;
K  = 1;

num = K*(T1*s+1)^2;
den = s^2*(T2*s+1);
G   = num/den;

margin(G)


% Figura 4

T1 = 1;
T2 = 1/10;
T3 = 1/10^4;
K  = 10^(35/20);
zita = 0.15;

num = K*(T3*s+1);
den = (T1*s+1)*(T2^2*s^2+2*T2*zita*s+1);
G   = num/den;

margin(G)

%% Ejercicio 4

close all
clear all
clc

s = tf('s');

K = 100;

num = K;
den = s*(s+1)*(s+5);
GH  = num/den;


% K critico = 30.
bode(GH)

%% Ejercicio 5

close all
clear all
clc

s = tf('s');

K = 0.28;

num = K*10*(s+0.1);
den = s*(s+0.5)*(s+1);
GH  = num/den;

bode(GH)