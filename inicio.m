t = 0:(1/500):2*pi
x = sin(2*pi*60.*t) + sin(2*pi*200.*t);

%plotagem para y com 32 amostras
y = x(1:32)
Y = fft_dt(y, 500);
Y = fft_df(y, 500);
Y = tfd(y, 500);

%plotagem com y com 32 amostras + 32 zeros 
y = x(1:32)
y = [y, zeros(1,32)]
Y = fft_dt(y, 500);
Y = fft_df(y, 500);
Y = tfd(y, 500);

%plotagem com y com 64 amostras 
y = x(1:64)
Y = fft_dt(y, 500);
Y = fft_df(y, 500);
Y = tfd(y, 500);

%plotagem com y com 64 amostras + 64 zeros
y = x(1:64)
y = [y, zeros(1,64)]
Y = fft_dt(y, 500);
Y = fft_df(y, 500);
Y = tfd(y, 500);

%plotagem com y com 64 amostras + 192 zeros (acho que é isso que deve ser, mandei email perguntando)
y = x(1:64)
y = [y, zeros(1,192)]
Y = fft_dt(y, 500);
Y = fft_df(y, 500);
Y = tfd(y, 500);


