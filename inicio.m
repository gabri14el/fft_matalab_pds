t = 0:(1/500):2*pi
x = sin(2*pi*60.*t) + sin(2*pi*200.*t);


y = x(1:128)
Y = fft_dt(y, 500)
Y = fft_df(y, 500)
plot(Y)

figure 
plot(tfd(y))