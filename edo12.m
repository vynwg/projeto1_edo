disp("Método de Euler para resolução aproximada de EDOs:");
disp("y' = 3cos(t) - 2y, t in (a, b]");
disp("y(a) = 0");

clear all
clc

y0 = 0;
a  = 0;
b  = 0.5;
ha = 0.1;
hb = 0.05;
hc = 0.01;

N1a = (b - a)/ha;
N1b = (b - a)/hb;
N1c = (b - a)/hc;
N2  = 10*(N1a-1);

phi(1) = y0;
ya(1)  = y0;
xa(1)  = y0;
yb(1)  = y0;
yc(1)  = y0;

t1a = linspace(a, b, N1a+1);
t1b = linspace(a, b, N1b+1);
t1c = linspace(a, b, N1c+1);
t2  = linspace(a, b, N2 +1);


for i = 1:N2
    phi(i+1) = 6/5*cos(t2(i+1)) + 3/5*sin(t2(i+1)) - 6/5*exp(-2*t2(i+1));
end

for i = 1:N1a
    t = t1a(i); y = ya(i); h = ha;

    ya(i+1) = y + (3*cos(t) - 2*y)*h;
    xa(i+1) = xa(i) + ((3*cos(t) - 2*xa(i))+(3*cos(t1a(i+1)) - 2*ya(i+1)))*h/2;
end

for i = 1:N1b
    t = t1b(i); y = yb(i); h = hb;

    yb(i+1) = y + (3*cos(t) - 2*y)*h;
end

for i = 1:N1c
    t = t1c(i); y = yc(i); h = hc;

    yc(i+1) = y + (3*cos(t) - 2*y)*h;
end

hold on
plot(t2, phi,"-r")
plot(t1a, ya, "r+", "markersize", 3)
plot(t1b, yb, "c*", "markersize", 3)
plot(t1c, yc, "ob", "markersize", 3)
plot(t1a, xa, "og", "markersize", 3);
hold off

legend({'Exata', 'h=0.1', 'h=0.05', 'h=0.01', 'Euler Melhorado'}, 'Location', 'northwest');
