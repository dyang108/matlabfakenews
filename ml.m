function [testData, trainData] = ml(train, test)
  trainData = train(:,7:9);
  testData = test(:,7:9);
  mdlNB = fitcnb(trainData,'related');
  predictedGroups = predict(mdlNB,testData);
  testData.related = predictedGroups;
end