function err = myfun1(x)
    global res;
    global num;
    global den;
    global delay;
    
    num = x(1);
    den = [x(2) 1];
    delay = x(3);
    if delay < 0 
        delay = 0;
    end
    sim('single_object'); 
    res2 = Y.signals.values;
    err = res - res2;
    err = sum(err.^2);
end