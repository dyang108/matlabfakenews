function mdlNB = ml(train)
  trainData = train(:,7:9);
  mdlNB = fitcnb(trainData,'related');
end