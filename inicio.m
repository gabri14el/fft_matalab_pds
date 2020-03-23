t = 0:(1/500):2*pi;
x = sin(2*pi*60.*t) + sin(2*pi*200.*t);

%plotagem para y com 32 amostras
y = x(1:32)
Y = fft_dt(y, t(1:32), 500);
Y = fft_df(y,t(1:32), 500);
Y = tfd(y,t(1:32), 500);

%plotagem com y com 32 amostras + 32 zeros 
y = x(1:32)
y = [y, zeros(1,32)]
Y = fft_dt(y, t(1:64),500);
Y = fft_df(y,t(1:64), 500);
Y = tfd(y, t(1:64),500);


%plotagem com y com 64 amostras 
y = x(1:64)
Y = fft_dt(y, t(1:64),500);
Y = fft_df(y, t(1:64),500);
Y = tfd(y, t(1:64),500);

%plotagem com y com 64 amostras + 64 zeros
y = x(1:64)
y = [y, zeros(1,64)]
Y = fft_dt(y,t(1:128), 500);
Y = fft_df(y, t(1:128),500);
Y = tfd(y, t(1:128),500);

%plotagem com y com 256 amostras
y = x(1:256)
Y = fft_dt(y, t(1:256),500);
Y = fft_df(y, t(1:256),500);
Y = tfd(y,t(1:256), 500);

%plotagem com y com 256 amostras + 256 zeros
t = t(1:512);
y = x(1:256);
y = [y, zeros(1,256)];
Y = fft_dt(y,t, 500);
Y = fft_df(y,t, 500);
Y = tfd(y,t, 500);


