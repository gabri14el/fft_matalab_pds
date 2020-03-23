%baseado em código de Nevin Alex Jacob (2011)
%modificado a ultima vez em 18/03/2020 por Gabriel Antonio Carneiro
%[gabri14el@gmail.com]

function [y] = fft_df(x,t,fs)                                            
%backup de x para plotagem
x_bak = x;

%tamanho de x
N=size(x, 2);
aux_ = 0:N-1;
T = N/fs;
frequency = aux_/T;
j = sqrt(-1);

%quantidade de niveis
S=log2(N);                                                                  

aux=N/2;                                                                   
for estagio=1:S                                                              
    for index=0:(N/(2^(estagio-1))):(N-1)                                    
        for n=0:(aux-1)                                                  
            %posicao atual
            pos=n+index+1;
            
            %calculo do wn
            pow=(2^(estagio-1))*n;                                           
            wn=exp(-j*(2*pi)*pow/N);   
            
            %buffers 
            b1=x(pos)+x(pos+aux);                                           
            b2=(x(pos)-x(pos+aux)).*wn;   
            
            %atualizacao do vetor
            x(pos)=b1;                                                      
            x(pos+aux)=b2;                                                 
        end
    end
    %atualizacao da variavel auxiliar
aux=aux/2;                                                                
end
%coloca a transformada na ordem certa
y = bitrevorder(x);

yn = y;

%plotagem
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
