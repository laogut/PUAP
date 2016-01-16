% tu powstaje bardzo trudny projekt na zaliczenie z PUAP Made by Lao
clear all;
clc;
close all;
global res;
global num;
global den;
global delay;

%% P1
T = [0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500 1000];

for i = 1:length(T)
    num = 1;
    den = [T(i) 1 ];
    delay = 1;
    num2 = num;
    den2 = den;
    delay2 = delay;
    simTime = delay + 6*T(i);
    if (T(i)< 10)
        stepSize = T(i)/100;
    else
        stepSize = 0.1;
    end
    figure();
    sim('single_object');
    res = Y.signals.values;
    [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 0.01 0.01]);
    num = X(1);
    den = [X(2) 1 ];
    delay = X(3);
    sim('single_object');
    subplot(2,1,1);
    plot(Y.time,res,Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów');
    legend('Rzeczywisty obiekt','Aproksymacja obiektu');
    xlabel('Czas');
    ylabel('Wartoœæ');
    subplot(2,1,2)
    plot(Y.time,res - Y.signals.values);
    title('Ró¿nicza odpowiedzi');
    xlabel('Czas');
    ylabel('Wartoœæ');
    grid on;
    
    figure()
    simTime = 20;
    sim('object_PI');
    plot(Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów z regulatorem PI');
    xlabel('Czas');
    ylabel('Wartoœæ');
 end


%% P2
T = [0.01 0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500];

for i = 1:length(T)
    num = 1;
    den = [T(i)^2 2*T(i) 1];
    delay = 1;
    num2 = num;
    den2 = den;
    delay2 = delay;
    simTime = delay + 6*T(i);
    if (T(i)< 10)
        stepSize = T(i)/100;
    else
        stepSize = 0.1;
    end
    figure();
    sim('single_object');
    res = Y.signals.values;
    [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 T(i)/2 0.01]);
    num = X(1);
    den = [X(2) 1];
    delay = X(3);
    sim('single_object');
    subplot(2,1,1);
    plot(Y.time,res,Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów');
    legend('Rzeczywisty obiekt','Aproksymacja obiektu');
    xlabel('Czas');
    ylabel('Wartoœæ');
    subplot(2,1,2)
    plot(Y.time,res - Y.signals.values);
    title('Ró¿nicza odpowiedzi');
    xlabel('Czas');
    ylabel('Wartoœæ');
    grid on;
    
    simTime = simTime + 20 + 2*T(i);
    figure()
    sim('object_PI');
    plot(Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów z regulatorem PI');
    xlabel('Czas');
    ylabel('Wartoœæ');
 end

%% P3
T=[0.005 0.01 0.02 0.05 0.1 0.2 0.5 2 5 10];

for i = 1:length(T)
    rep = tf(1,[1 1])*tf(1,[T(i) 1])*tf(1,[T(i) 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = 0;
    num2 = num;
    den2 = den;
    delay2 = delay;
    simTime = 6 + 6*T(i);
    if (T(i)< 10)
        stepSize = T(i)/100;
    else
        stepSize = 0.1;
    end
    figure();
    sim('single_object');
    res = Y.signals.values;
    [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 T(i)/2 0.01]);
    num = X(1);
    den = [X(2) 1];
    delay = X(3);
    sim('single_object');
    subplot(2,1,1);
    plot(Y.time,res,Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów');
    legend('Rzeczywisty obiekt','Aproksymacja obiektu');
    xlabel('Czas');
    ylabel('Wartoœæ');
    subplot(2,1,2)
    plot(Y.time,res - Y.signals.values);
    title('Ró¿nicza odpowiedzi');
    xlabel('Czas');
    ylabel('Wartoœæ');
    grid on;
    
    simTime = simTime + 2 * T(i) + 20;
    figure()
    sim('object_PI');
    plot(Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów z regulatorem PI');
    xlabel('Czas');
    ylabel('Wartoœæ');
 end

%% P4
n = [3 4 5 6 7 8];

for i = 1:length(n)
    rep = tf(1,[1 1])^n(i);
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = 0;
    num2 = num;
    den2 = den;
    delay2 = delay;
    simTime = 6*n(i);
    stepSize = 0.1;
    figure();
    sim('single_object');
    res = Y.signals.values;
    [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 0.01 0.01]);
    num = X(1);
    den = [X(2) 1];
    delay = X(3);
    sim('single_object');
    subplot(2,1,1);
    plot(Y.time,res,Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów');
    legend('Rzeczywisty obiekt','Aproksymacja obiektu');
    xlabel('Czas');
    ylabel('Wartoœæ');
    subplot(2,1,2)
    plot(Y.time,res - Y.signals.values);
    title('Ró¿nicza odpowiedzi');
    xlabel('Czas');
    ylabel('Wartoœæ');
    grid on;
    
    simTime = simTime + 2 * n(i) + 20;
    figure()
    sim('object_PI');
    plot(Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów z regulatorem PI');
    xlabel('Czas');
    ylabel('Wartoœæ');
 end

%% P5
a = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];

for i = 1:length(a)
    rep = tf(1,[1 1])*tf(1,[a(i) 1])*tf(1,[a(i)^2 1])*tf(1,[a(i)^3 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = 0;
    num2 = num;
    den2 = den;
    delay2 = delay;
    simTime = 6 + 6*a(i);
    if (a(i)< 10)
        stepSize = a(i)/100;
    else
        stepSize = 0.1;
    end
    figure();
    sim('single_object');
    res = Y.signals.values;
    [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 a(i)/2 0.01]);
    num = X(1);
    den = [X(2) 1];
    delay = X(3);
    sim('single_object');
    subplot(2,1,1);
    plot(Y.time,res,Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów');
    legend('Rzeczywisty obiekt','Aproksymacja obiektu');
    xlabel('Czas');
    ylabel('Wartoœæ');
    subplot(2,1,2)
    plot(Y.time,res - Y.signals.values);
    title('Ró¿nicza odpowiedzi');
    xlabel('Czas');
    ylabel('Wartoœæ');
    grid on;
    
    simTime = simTime + 2 * a(i) + 20;
    figure()
    sim('object_PI');
    plot(Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów z regulatorem PI');
    xlabel('Czas');
    ylabel('Wartoœæ');
 end

%% P6
L1 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];

for i = 1:length(L1)
    T1 = 1 - L1(i);
    rep = tf(1,[1 0])*tf(1,[T1 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = L1(i);
    num2 = num;
    den2 = den;
    delay2 = delay;
    simTime = 6+6*T1;
    if (T1 < 10 & T1 ~= 0)
        stepSize = T1/100;
    else
        stepSize = 0.1;
    end
    figure();
    sim('single_object');
    res = Y.signals.values;
    [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 0.01 0.01]);
    num = X(1);
    den = [X(2) 1];
    delay = X(3);
    sim('single_object');
    subplot(2,1,1);
    plot(Y.time,res,Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów');
    legend('Rzeczywisty obiekt','Aproksymacja obiektu');
    xlabel('Czas');
    ylabel('Wartoœæ');
    subplot(2,1,2)
    plot(Y.time,res - Y.signals.values);
    title('Ró¿nicza odpowiedzi');
    xlabel('Czas');
    ylabel('Wartoœæ');
    grid on;
    
    simTime = simTime + 2 * L1(i) + 20;
    figure()
    sim('object_PI');
    plot(Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów z regulatorem PI');
    xlabel('Czas');
    ylabel('Wartoœæ');
 end


%% P7
T = [1 2 5 10];
L1 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];

for i = 1:length(T)
    for j = 1:length(L1)
        T1 = 1 - L1(j);
        rep = tf(T(i),[T(i) 1])*tf(1,[T1 1]); 
        num = rep.num{1,1}; 
        den = rep.den{1,1};
        delay = L1(j);
        num2 = num;
        den2 = den;
        delay2 = delay;
        simTime = 7*T(i) + 6*T1;
        if (T1 ~= 0)
            stepSize = T1/100;
        else
            stepSize = T(i)/100;
        end
        figure();
        sim('single_object');
        res = Y.signals.values;
        [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 T(i)/2 0.01]);
        num = X(1);
        den = [X(2) 1];
        delay = X(3);
        sim('single_object');
        subplot(2,1,1);
        plot(Y.time,res,Y.time,Y.signals.values);
        grid on;
        title('Odpowiedzi skokowe obiektów');
        legend('Rzeczywisty obiekt','Aproksymacja obiektu');
        xlabel('Czas');
        ylabel('Wartoœæ');
        subplot(2,1,2)
        plot(Y.time,res - Y.signals.values);
        title('Ró¿nicza odpowiedzi');
        xlabel('Czas');
        ylabel('Wartoœæ');
        grid on;
        
        simTime = simTime + 2 * T(i) + 20;
        figure()
        sim('object_PI');
        plot(Y.time,Y.signals.values);
        grid on;
        title('Odpowiedzi skokowe obiektów z regulatorem PI');
        xlabel('Czas');
        ylabel('Wartoœæ');
    end
 end

%% P8
a = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];

for i = 1:length(a)
    rep = tf([-a(i) 1],[1 1])*tf(1,[1 1])*tf(1,[1 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = 0;
    num2 = num;
    den2 = den;
    delay2 = delay;
    simTime = 20;
    stepSize = 0.01;
    figure();
    sim('single_object');
    res = Y.signals.values;
    [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 0.01 0.01]);
    num = X(1);
    den = [X(2) 1];
    delay = X(3);
    sim('single_object');
    subplot(2,1,1);
    plot(Y.time,res,Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów');
    legend('Rzeczywisty obiekt','Aproksymacja obiektu');
    xlabel('Czas');
    ylabel('Wartoœæ');
    subplot(2,1,2)
    plot(Y.time,res - Y.signals.values);
    title('Ró¿nicza odpowiedzi');
    xlabel('Czas');
    ylabel('Wartoœæ');
    grid on;
    
    simTime = simTime + 2 * a(i) + 100;
    figure()
    sim('object_PI');
    plot(Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów z regulatorem PI');
    xlabel('Czas');
    ylabel('Wartoœæ');
 end

%% P9
T = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];

for i = 1:length(T)
    rep = tf(1,[1 1])*tf(1,[T(i)^2 1.4*T(i) 1]); 
    num = rep.num{1,1}; 
    den = rep.den{1,1};
    delay = 0;
    num2 = num;
    den2 = den;
    delay2 = delay;
    simTime = 6 + 8*T(i);
    stepSize = 0.01;
    figure();
    sim('single_object');
    res = Y.signals.values;
    [X,FVAL] = fmincon(@myfun1,[1 1 1],[],[],[],[],[0.01 T(i)/2 0.01]);
    num = X(1);
    den = [X(2) 1];
    delay = X(3);
    sim('single_object');
    subplot(2,1,1);
    plot(Y.time,res,Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów');
    legend('Rzeczywisty obiekt','Aproksymacja obiektu');
    xlabel('Czas');
    ylabel('Wartoœæ');
    subplot(2,1,2)
    plot(Y.time,res - Y.signals.values);
    title('Ró¿nicza odpowiedzi');
    xlabel('Czas');
    ylabel('Wartoœæ');
    grid on;
    
    simTime = simTime + 2 * T(i) + 20;
    figure()
    sim('object_PI');
    plot(Y.time,Y.signals.values);
    grid on;
    title('Odpowiedzi skokowe obiektów z regulatorem PI');
    xlabel('Czas');
    ylabel('Wartoœæ');
 end