function data = getdata(bodies,stances)
    btable = readtable(bodies);
    stable = readtable(stances);
    data = outerjoin(btable, stable);
end