disp("Método de Runge-Kutta para resolução aproximada de EDOs:");
disp("y' = 1 + 2t - y, t in (a, b]");
disp("y(a) = 1");

clc
clear all

y0 = 1;
a  = 0;
b  = 1;
ha = 0.5;
hb = 0.25;
hc = 0.01;

N1a = (b - a)/ha;
N1b = (b - a)/hb;
N1c = (b - a)/hc;
N2  = 10*(b - a)/h;

t1a = linspace(a,b,N1a+1);
t1b = linspace(a,b,N1b+1);
t1c = linspace(a,b,N1c+1);
t2  = linspace(a,b,N2+1);

phi(1) = y0;
ya(1)  = y0;
yb(1)  = y0;
yc(1)  = y0;

for i = 1:N2
    phi(i+1) = 2*t2(i+1) - 1 + 2*exp(-t2(i+1));
end

for i = 1:N1a
    K1 = 1 + 2*t1a(i) - ya(i);        
    K2 = 1 + 2*(t1(i)+0.5*h) - (y(i)+0.5*h*K1);
    K3 = 1 + 2*(t1(i)+0.5*h) - (y(i)+0.5*h*K2);
    K4 = 1 + 2*(t1(i)+h) - (y(i)+h*K3);
    y(i+1) = y(i) + (K1 + 2*K2 + 2*K3 + K4)*h/6;
end

plot(t2, phi,"-r", t1, y, "ob", "markersize", 3)
title('Solução exata - (vermelha); Solução aproximada o (azul)')
