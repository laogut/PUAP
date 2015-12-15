% tu powstaje bardzo trudny projekt na zaliczenie z PUAP Made by Lao
clear all;
clc;
close all;

global Y;
global t;
global stepTime;

d = exp(-tf('s'));
%% P1
T = [0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500 1000];
for i = 1:length(T)
    [P1(i)] = d * tf(1,[T(i) 1]);
end
stepTime = 6000;

hold on;
for i = 1:length(T)
    figure()
    [Y,t] = step(P1(i),stepTime);
    [X,FVAL] = fmincon(@myfun1,[0 0 0]',diag([0 0 -1]),[0 0 0]',[],[],[0 0 0]',[]);
    G = tf(X(1),[X(2) 1],'InputDelay',X(3));
    [Yg, Tg] = step(G,stepTime);
    subplot(2,1,1)
    plot (t,Y);
    subplot(2,1,2)
    plot(Tg,Yg);
end
grid on;
title('Odpowiedzi skokowe obiektu P1')
xlabel('Czas');
ylabel('Wartoœæ');




%% P2
T = [0.01 0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500];
for i = 1:length(T)
    P2(i) = d * tf(1,[T(i) 1]) * tf(1,[T(i) 1]);
end

figure()
hold on;
for i = 1:length(T)
    [Y,t] = step(P2(i),4000);
    plot (t,Y);
end
grid on;
title('Odpowiedzi skokowe obiektu P2')
xlabel('Czas');
ylabel('Wartoœæ');

%% P3
T=[0.005 0.01 0.02 0.05 0.1 0.2 0.5 2 5 10];
for i = 1:length(T)
    P3(i) = tf(1,[1 1]) * tf(1,[T(i) 1]) * tf(1,[T(i) 1]);
end

figure()
hold on;
for i = 1:length(T)
    [Y,t] = step(P3(i),80);
    plot (t,Y);
end
grid on;
title('Odpowiedzi skokowe obiektu P3')
xlabel('Czas');
ylabel('Wartoœæ');


%% P4
n = [3 4 5 6 7 8];
for i = 1:length(n)
    P4(i) = tf(1,[1 1])^n(i);
end

figure()
hold on;
for i = 1:length(n)
    [Y,t] = step(P4(i),20);
    plot (t,Y);
end
grid on;
title('Odpowiedzi skokowe obiektu P4')
xlabel('Czas');
ylabel('Wartoœæ');

%% P5
a = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
for i = 1:length(a)
    P5(i) = tf(1,[1 1]) * tf(1,[a(i) 1]) * tf(1,[a(i)^2 1]) * tf(1,[a(i)^3 1]);
end

figure()
hold on;
for i = 1:length(a)
    [Y,t] = step(P5(i),12);
    plot (t,Y);
end
grid on;
title('Odpowiedzi skokowe obiektu P5')
xlabel('Czas');
ylabel('Wartoœæ');

%% P6
L1 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];
for i = 1:length(L1)
    T1 = 1 -L1(i);
    P6(i) = tf(1,[T1 1 0]) * exp(-tf('s')*L1(i));
end

figure()
hold on;
for i = 1:length(L1)
    [Y,t] = step(P6(i),5);
    plot (t,Y);
end
grid on;
title('Odpowiedzi skokowe obiektu P6')
xlabel('Czas');
ylabel('Wartoœæ');


%% P7
T = [1 2 5 10];
L1 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];
for i = 1:length(T)
    for j = 1:length(L1)
        T1 = 1 -L1(j);
        P7(i,j) = tf(T(i),[T(i) 1 ]) * tf(1,[T1 1]) * exp(-tf('s')*L1(i));
    end
end

figure()
hold on;
for i = 1:length(T)
    for j = 1:length(L1)
        [Y,t] = step(P7(i,j),60);
        plot (t,Y);
    end
end
grid on;
title('Odpowiedzi skokowe obiektu P7')
xlabel('Czas');
ylabel('Wartoœæ');

%% P8
a = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
for i = 1:length(a)
    P8(i) = tf([-a(i) 1], 1) * tf(1,[1 1])^3;
end

figure()
hold on;
for i = 1:length(a)
    [Y,t] = step(P8(i),12);
    plot (t,Y);
end
grid on;
title('Odpowiedzi skokowe obiektu P8')
xlabel('Czas');
ylabel('Wartoœæ');

%% P9
T = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for i = 1:length(T)
    P9(i) = tf(1,[1 1]) * tf(1,[T(i)^2 1.4*T(i) 1]);
end

figure()
hold on;
for i = 1:length(T)
    [Y,t] = step(P9(i));
    plot (t,Y);
end
grid on;
title('Odpowiedzi skokowe obiektu P9')
xlabel('Czas');
ylabel('Wartoœæ');