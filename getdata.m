function data = getdata()
    btable = readtable('competition_test_bodies.csv');
    stable = readtable('competition_test_stances.csv');
    data = outerjoin(btable, stable);
end