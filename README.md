# matlabfakenews
an attempt to tackle the fake news problem using MATLAB

we broke the problem into a classification problem to determine whether
articles were related to or biased against a certain headline.

## main endpoints
demoObjects.mat contains the MATLAB objects for the Naive Bayes Classifier
and the sentiment map.

doesAgree.m takes a headline and a body as strings (along with the learned
model and sentiment map), and determines which of the four categories it 
falls under: unrelated, agree, disagree, or discuss

checkAllAgree takes a table with a Headline field, an articleBody field,
and an observed stance field, outputting a table of results with the given
stance along with the computed stance

getGrade takes these results and calculates a percentage score for the number
of correctly classified (headline, article) pairs.
