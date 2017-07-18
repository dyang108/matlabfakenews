function [allResults, grade] = getFullGrade()
   load('demoObjects.mat');
   data = getdata('competition_test_bodies.csv', 'competition_test_stances.csv');
   allResults = checkAllAgree(data, model, sents);
   
   grade = getGrade(allResults);
end