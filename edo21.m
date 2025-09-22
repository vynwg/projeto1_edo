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

% N1: Número de pontos na partição/discretização (definido em função de a, b e h).
% N2: Número de pontos para plotar o gráfico da solução analítica exata. N2 >> N1, para que a aparência da curva fique mais suave. 

N1 = (b - a)/h; 
N2 = 10*(b - a)/h;

% Criação dos vetores t1 e t2 com a discretização do domínio temporal (para a solução aproximada e a exata, respectivamente). 

t1 = linspace(a,b,N1+1);
t2 = linspace(a,b,N2+1);

% Inicialização dos vetores com a condição inicial. O vetor phi armazena a solução exata; o vetor y, a solução aproximada pelo Método de Runge-Kutta. Editar o valor 1, se necessário.

phi(1) = 1;
y(1) = 1;

% Geração da solução exata (vetor phi). Calcular à mão e editar as expressões de acordo com o exercício. 

for i = 1:N2
    phi(i+1) = 2*t2(i+1) + 2* exp(-t2(i+1)) - 1;
end

% Geração da solução aproximada y pelo Método de Runge-Kutta. Editar as expressões K1, K2, K3 e K4 de acordo com o exercício.

for i = 1:N1
    K1 = 1 + 2*t1(i) - y(i);        
    K2 = 1 + 2*(t1(i)+0.5*h) - (y(i)+0.5*h*K1);
    K3 = 1 + 2*(t1(i)+0.5*h) - (y(i)+0.5*h*K2);
    K4 = 1 + 2*(t1(i)+h) - (y(i)+h*K3);
    y(i+1) = y(i) + (K1 + 2*K2 + 2*K3 + K4)*h/6; % Linha não-editável.
end

% Plot da solução aproximada e da exata. 

plot(t2, phi,"-r", t1, y, "ob", "markersize", 3)
title('Solução exata - (vermelha); Solução aproximada o (azul)')
