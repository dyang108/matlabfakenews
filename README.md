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

getFullGrade runs everything without the need to load anything. This will give
the full score as long as the demoObjects.mat and competition test csvs are
in the folder

competitionResults.mat contains the results from running getFullGrade over
the whole competition dataset.

## improvements
we should consider using ml to categorize the relevant articles into the correct
bias categories. This involves finding another relevant input parameter.
Since headlines are rather short, this is rather difficult.
