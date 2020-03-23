function [y] = tfd(x,t,fs)
x_bak = x;
tamanho = size(x, 2);
aux = 0:tamanho-1;
T = tamanho/fs;
frequency = aux/T;

y = zeros(1, tamanho);
j = sqrt(-1);
wn = exp(-j*(2*pi/tamanho));

for k=0:tamanho-1
    for n = 0:tamanho-1
        y(k+1) = y(k+1)+(x(n+1) * wn^(n*k));
    end
end

yn = y;

figure();
subplot(311);
stem(t, x_bak);
title('Sinal');
ylabel('Amplitude');
xlabel('Tempo');


subplot(312);
stem(frequency, abs(yn));
title('Espectro na Frequência');
ylabel('Módulo');
xlabel('Frequência');

subplot(313);
stem(frequency, angle(yn));
ylabel('Fase');
xlabel('Frequência');
end