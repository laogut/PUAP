%% tu powstaje bardzo trudny projekt na zaliczenie z PUAP Made by Lao

d = exp(-tf('s'));
T = 0.02;
P0 = tf(1,[T 1]);
P1 = d * P0;
P2 = d * P0 * P0;
P3 = tf(1,[1 1]) * P2;
n = 3;
P4 = P0^n;
a = 0.1;
P5 = tf(1,[1 1]) * tf(1,[a 1]) * tf(1,[a^2 1]) * tf(1,[a^3 1]);
L1 = 0.01;
T1 = 1 -L1;
P6 = tf(1,[T1 1 0]) * exp(-tf('s')*L1);
P7 = tf(T,[T 1 ]) * tf(1,[T1 1]) * exp(-tf('s')*L1);
P8 = tf([-a 1], 1) * tf(1,[1 1])^3;
P9 = tf(1,[1 1]) * tf(1,[T^2 1.4*T 1]);