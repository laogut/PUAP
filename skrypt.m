%% tu powstaje bardzo trudny projekt na zaliczenie z PUAP Made by Lao
clear all;
clc;
close all;


d = exp(-tf('s'));
%% P1
T = [0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500 1000];
for i = 1:length(T)
    [P1(i)] = d * tf(1,[T(i) 1]);
end

figure(1)
hold on;
for i = 1:length(T)
    step(P1(i),6000);
end
grid on;
title('Odpowiedzi skokowe obiektu P1')
xlabel('Czas');
ylabel('Wartoœæ');

%%P2
T = [0.01 0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500];
for i = 1:length(T)
    P2(i) = d * tf(1,[T(i) 1]) * tf(1,[T(i) 1]);
end

figure(2)
hold on;
for i = 1:length(T)
    step(P2(i),4000);
end
grid on;
title('Odpowiedzi skokowe obiektu P2')
xlabel('Czas');
ylabel('Wartoœæ');

%%P3
T=[0.005 0.01 0.02 0.05 0.1 0.2 0.5 2 5 10];
for i = 1:length(T)
    P3(i) = tf(1,[1 1]) * tf(1,[T(i) 1]) * tf(1,[T(i) 1]);
end

figure(3)
hold on;
for i = 1:length(T)
    step(P3(i),80);
end
grid on;
title('Odpowiedzi skokowe obiektu P3')
xlabel('Czas');
ylabel('Wartoœæ');


%%P4
n = [3 4 5 6 7 8];
for i = 1:length(n)
    P4(i) = tf(1,[1 1])^n(i);
end

figure(4)
hold on;
for i = 1:length(n)
    step(P4(i),20);
end
grid on;
title('Odpowiedzi skokowe obiektu P4')
xlabel('Czas');
ylabel('Wartoœæ');

%%P5
a = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
for i = 1:length(a)
    P5(i) = tf(1,[1 1]) * tf(1,[a(i) 1]) * tf(1,[a(i)^2 1]) * tf(1,[a(i)^3 1]);
end

figure(5)
hold on;
for i = 1:length(a)
    step(P5(i),12);
end
grid on;
title('Odpowiedzi skokowe obiektu P5')
xlabel('Czas');
ylabel('Wartoœæ');

%%P6
L1 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];
for i = 1:length(L1)
    T1 = 1 -L1(i);
    P6(i) = tf(1,[T1 1 0]) * exp(-tf('s')*L1(i));
end

figure(6)
hold on;
for i = 1:length(L1)
    step(P6(i),5);
end
grid on;
title('Odpowiedzi skokowe obiektu P6')
xlabel('Czas');
ylabel('Wartoœæ');


%%P7
T = [1 2 5 10];
L1 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];
for i = 1:length(T)
    for j = 1:length(L1)
        T1 = 1 -L1(j);
        P7(i,j) = tf(T(i),[T(i) 1 ]) * tf(1,[T1 1]) * exp(-tf('s')*L1(i));
    end
end

figure(7)
hold on;
for i = 1:length(T)
    for j = 1:length(L1)
        step(P7(i,j),60);
    end
end
grid on;
title('Odpowiedzi skokowe obiektu P7')
xlabel('Czas');
ylabel('Wartoœæ');

%%P8
a = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
for i = 1:length(a)
    P8(i) = tf([-a(i) 1], 1) * tf(1,[1 1])^3;
end

figure(8)
hold on;
for i = 1:length(a)
    step(P8(i),12);
end
grid on;
title('Odpowiedzi skokowe obiektu P8')
xlabel('Czas');
ylabel('Wartoœæ');

%%P9
T = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for i = 1:length(T)
    P9(i) = tf(1,[1 1]) * tf(1,[T(i)^2 1.4*T(i) 1]);
end

figure(9)
hold on;
for i = 1:length(T)
    step(P9(i));
end
grid on;
title('Odpowiedzi skokowe obiektu P9')
xlabel('Czas');
ylabel('Wartoœæ');