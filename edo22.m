disp("Método de Runge-Kutta para resolução aproximada de EDOs:");
disp("y' = 0.5 - t + 2y, t in (a, b]");
disp("y(a) = -1");

clc
clear all

y0 = -1;
a  = 0;
b  = 1;
ha = 0.5;
hb = 0.25;
hc = 0.01;

N1a = (b - a)/ha;
N1b = (b - a)/hb;
N1c = (b - a)/hc;
N2  = 10*(b - a)/hc;

t1a = linspace(a,b,N1a+1);
t1b = linspace(a,b,N1b+1);
t1c = linspace(a,b,N1c+1);
t2  = linspace(a,b,N2+1);

phi(1) = y0;
ya(1)  = y0;
yb(1)  = y0;
yc(1)  = y0;

for i = 1:N2
    phi(i+1) = t2(i+1)/2 - exp(2*t2(i+1));
end

for i = 1:N1a
    t = t1a(i); y = ya(i); h = ha;

    K1 = 0.5 - t + 2*y;        
    K2 = 0.5 - (t+h/2) + 2*(y+h/2*K1);
    K3 = 0.5 - (t+h/2) + 2*(y+h/2*K2);
    K4 = 0.5 - (t+h)   + 2*(y+h*K3);

    ya(i+1) = y + (K1 + 2*K2 + 2*K3 + K4)*h/6;
end

for i = 1:N1b
    t = t1b(i); y = yb(i); h = hb;

    K1 = 0.5 - t + 2*y;        
    K2 = 0.5 - (t+h/2) + 2*(y+h/2*K1);
    K3 = 0.5 - (t+h/2) + 2*(y+h/2*K2);
    K4 = 0.5 - (t+h)   + 2*(y+h*K3);

    yb(i+1) = y + (K1 + 2*K2 + 2*K3 + K4)*h/6;
end

for i = 1:N1c
    t = t1c(i); y = yc(i); h = hc;

    K1 = 0.5 - t + 2*y;        
    K2 = 0.5 - (t+h/2) + 2*(y+h/2*K1);
    K3 = 0.5 - (t+h/2) + 2*(y+h/2*K2);
    K4 = 0.5 - (t+h)   + 2*(y+h*K3);

    yc(i+1) = y + (K1 + 2*K2 + 2*K3 + K4)*h/6;
end

hold on
plot(t2, phi,"-r")
plot(t1a, ya, "g+", "markersize", 3)
plot(t1b, yb, "c*", "markersize", 3)
plot(t1c, yc, "ob", "markersize", 3)
hold off

legend('Exata', 'h=0.5', 'h=0.25', 'h=0.01');
