%baseado em código de Nevin Alex Jacob (2011)
%modificado a ultima vez em 18/03/2020 por Gabriel Antonio Carneiro
%[gabri14el@gmail.com]

function [y] = fft_df(x,t,fs)                                            
x_bak = x;
N=size(x, 2);
aux_ = 0:N-1;
T = N/fs;
frequency = aux_/T;
j = sqrt(-1);

S=log2(N);                                                                  

aux=N/2;                                                                   
for estagio=1:S                                                              
    for index=0:(N/(2^(estagio-1))):(N-1)                                    
        for n=0:(aux-1)                                                  
            pos=n+index+1;                                                  
            pow=(2^(estagio-1))*n;                                           
            
            wn=exp(-j*(2*pi)*pow/N);                                      
            a=x(pos)+x(pos+aux);                                           
            b=(x(pos)-x(pos+aux)).*wn;                                      
            x(pos)=a;                                                      
            x(pos+aux)=b;                                                 
        end
    end
aux=aux/2;                                                                
end
y = bitrevorder(x);

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
