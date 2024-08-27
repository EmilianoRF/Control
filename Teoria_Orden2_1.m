%%  SISTEMAS DE SEGUNDO ORDEN
syms wn M zi t wd s K

% Para 0<ζ<1 
% RESPUESTA TEMPORAL AL ESCALON DEDUCIDA EN EL PIZARRON

wd = wn*(1-zi^2)^(1/2);
y  = K*M*(1-exp(-zi*wn*t)*(cos(wd*t)+(zi/(1-zi^2)^(1/2))*sin(wd*t))); 

% Para deducir la respuesta de un segundo orden con ζ=1 y entrada
% escalon se trabaja de la siguiente forma:
zi = 1;
g1 = K*wn^2/(s^2+2*zi*wn*s+wn^2);

x1 = M/s;
y1 = ilaplace(g1*x1);
y1 = simplify(y1);
pretty(y1)

% Para deducir la respuesta de un segundo orden con ζ=0 y entrada
% escalon se trabaja de la siguiente forma:
zi  = 0;
g11 = K*wn^2/(s^2+wn^2);
x11 = M/s;
y11 = ilaplace(g11*x11);
pretty(y1)

%La respuesta a un escalon en un sistema de segundo orden para ζ>1 es y4
% y tambien puede verse en la transparencia de teoria:

clear zi;  %Para que no tome ζ=0 como se le asigno la ultima vez
syms zi
p1 = -wn*(zi+sqrt(zi^2-1));
p2 = -wn*(zi-sqrt(zi^2-1));
y4 = simplify(K*M*(1-(wn/(2*sqrt(zi^2-1)))*(exp(p1*t)/p1-exp(p2*t)/p2)));

%Para obtener la respuesta al impulso derivo la expresion anterior: 
y5 = simplify(diff(y4,t));
pretty(y5)

% Funciones de segundo orden con ζ > 1, ζ = 1 y 0 < ζ <1 para
% entradas impulso y escalon.

clc; clear all; close all
k  = 2;
wn = 5;
s  = tf('s');

%Comparacion de la respuesta al escalon y la delta para un mismo sistema
%con ζ=0.4
zi    = 0.4;
g     = k*wn^2/(s^2+2*zi*wn*s+wn^2);
polos = pole(g);
step(g)
hold on
impulse(g)


%Lo mismo pero para ζ=1
close;
clc;
zi    = 1;
g1    = k*wn^2/(s^2+2*zi*wn*s+wn^2);
polos = pole(g1)

step(g1)
hold on
impulse(g1)

%Lo mismo para ζ = 2
clc;
close;
zi    = 2;
g2    = k*wn^2/(s^2+2*zi*wn*s+wn^2);
polos = pole(g2)

step(g2)
hold on
impulse(g2)


% En el caso de ζ = 0 

close
clc;
zi    = 0;
g3    = k*wn^2/(s^2+2*zi*wn*s+wn^2);
polos = pole(g3)

step(g3,10)
hold on
impulse(g3,10)

%%  SISTEMAS DE ORDEN SUPERIOR
% Agrado de un polo real a un sistema de segundo orden con ζ =0,6

clc; clear all; close all;
k  = 3;
zi = 0.6;
wn = 3;
M  = 1;
s  = tf('s');
g  = k*M/(s^2+2*zi*wn*s+wn^2)


pole(g) 
close;
step(g)
figure(1)
hold on
for n=1:4
b=input('Ingrese el valor del polo adicional: ');
g1=1/(-s/b+1)
g2=g*g1
hold on
step(g2)
figure(1)
end



%Agrado de un cero real a un sistema de segundo orden con ζ = 0,6
% Segundo_orden_ceros
close;
clc;

k  = 3;
zi = 0.6;
wn = 3;
M  = 1;
s  = tf('s');
g  = k*M/(s^2+2*zi*wn*s+wn^2)

pole(g)
close;
step(g)
figure(1)

hold on
for n=1:4
b=input('Ingrese el valor del cero para el sistema de Segundo Orden: ');
g1=(-s/b+1)
g2=g*g1
hold on
step(g2)
figure(1)
end

% Efecto de la adici�n de un polo real en un sistema de segundo orden, por
% lo que se analiza la respuesta temporal de un sistema de TERCER ORDEN

clc; close;
k=3;
zi=0.6;
wn=3;
M=1;
s=tf('s');
g=k*M/(s^2+2*zi*wn*s+wn^2)
pause;


pole(g)
pause
close;
step(g)
figure(1)
pause
hold on
for n=1:4
b=input('Ingrese el valor del polo adicional: ');
g1=1/(-s/b+1)
pause
g2=g*g1
pause
hold on
step(g2)
figure(1)
pause
end

%% Efecto de añadir ceros a un sistema de Segundo Orden

% Segundo_orden_ceros
close;
clc;

k  = 3;
zi = 0.6;
wn = 3;
M  = 1;
s  = tf('s');
g  = k*M/(s^2+2*zi*wn*s+wn^2);

pole(g)
close;
step(g)
figure(1)
hold on
for n=1:4
b=input('Ingrese el valor del cero para el sistema de Segundo Orden: ');
g1=(-s/b+1)
g2=g*g1
hold on
step(g2)
figure(1)
end