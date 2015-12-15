function err = myfun1(x)
    global Y;
    global t;
    global stepTime

    Kp = x(1);
    T = x(2);
    L = x(3)
    
    G = tf(Kp,[T 1],'InputDelay',L);
    [YG, TG] = step(G,stepTime);
    Yg = interp1(t, Y, TG,'pchip');
    err = (YG - Yg);
    err = sum(err.^2)
end