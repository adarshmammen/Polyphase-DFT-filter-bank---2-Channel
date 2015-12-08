x = [1 1 1 1];     % A random input signal
h = [1 1 1 1];    % Filter 
y = conv(h,x);

E0 = [1 0 1 0];
E1 = [1 0 1 0];

Z = dfilt.delay; % creating a delay filter

branch1 = filter(Z,x);
branch2 = filter(Z,x);
branch3 = filter(Z,branch1);

node0 = x + branch2;
node1 = branch1 + branch3;

X0 = node0 + node1;
X1 = node0 - node1;

figure();
subplot(4,2,1)
stem(x)
title('x[n]')
subplot(4,2,2)
stem(h)
title('h[n]')
subplot(4,2,3)
stem(y)
title('y[n]')
subplot(4,2,4)
stem(abs(fft(y,100)))
title('FFT(Y)')

subplot(4,2,5)
stem(abs(fft(X0,100)))
title('FFT(X0)')
subplot(4,2,6)
stem(abs(fft(X1,100)))
title('FFT(X1)')

X = X0 + X1;
subplot(4,2,7)
stem(abs(fft(X,100)))
title('FFT(X) x = x1 + x2')


