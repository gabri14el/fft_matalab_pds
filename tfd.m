function [y] = tfd(x, fs)
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

yn = y/tamanho;
figure();
subplot(211);
plot(frequency, abs(yn));
title('Expectro na Frequência');
ylabel('|H(e^(jw))|');
xlabel('Frequência');
subplot(212);
plot(frequency, angle(yn));
end