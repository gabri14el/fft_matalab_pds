%baseado em código de Nevin Alex Jacob (2011)
%modificado a ultima vez em 18/03/2020 por Gabriel Antonio Carneiro
%[gabri14el@gmail.com]

function [y] = fft_dt(x,fs)                                              
                                             
N=size(x, 2);                                                               
aux = 0:N-1;
T = N/fs;
frequency = aux/T;
j = sqrt(-1);

%calculo da fft com dizimacao no tempo
%quantidade de niveis
niveis = log2(N);                                                                 

%variavel auxiliar
aux_=1;                                                                     

%utilizar bit de ordem reversa
x=bitrevorder(x);                                                           

for estagio=1:niveis                                                               
    for index=0:(2^estagio):(N-1)                                            
        for n=0:(aux_-1) 
            pos = n+index+1;                                            
            wn=exp((-j)*(2*pi)*(2^(niveis-estagio))*n/N);                                      
            
            a = x(pos)+x(pos+aux_).*wn;                                        
            b = x(pos)-x(pos+aux_).*wn;                                        
            
            x(pos) = a;                                                       
            x(pos+ aux_) = b;                                                  
        end
    end
aux_=2*aux_;                                                                
end

y=x;

yn = y/N;
%fc = ceil(N/2);


figure();
subplot(211);
plot(frequency, abs(yn));
title('Expectro na Frequência');
ylabel('|H(e^(jw))|');
xlabel('Frequência');
subplot(212);
plot(frequency, angle(yn));
end