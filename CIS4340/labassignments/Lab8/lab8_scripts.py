# -*- coding: utf-8 -*-
"""II"""
import pandas as pd
import numpy as np
from sklearn.tree import DecisionTreeClassifier, export_graphviz
from sklearn.ensemble import BaggingClassifier
from sklearn import cross_validation
from sklearn.externals.six import StringIO
data = pd.read_csv("http://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data-original", delim_whitespace = True, header=None, names = ['mpg', 'cylinders', 'displacement', 'horsepower', 'weight', 'acceleration', 'model', 'origin', 'car_name'])
data = data.dropna()
data = data[~ data.cylinders.isin([3, 5, 7])]
data.cylinders = data.cylinders.astype(np.int)
X = data[['cylinders', 'displacement', 'horsepower', 'weight', 'acceleration']]
Y = data['mpg']
Y[Y <=23 ] = 0
Y[Y > 23 ] = 1

"""III"""
Xtrain, Xtest, Ytrain, Ytest = cross_validation.train_test_split(X, Y, test_size=0.3, random_state=0)
clf = DecisionTreeClassifier(random_state = 0)
clf = clf.fit(Xtrain, Ytrain)
dot_data = StringIO() 
export_graphviz(clf, out_file=dot_data, feature_names = ['cylinders', 'displacement', 'horsepower', 'weight', 'acceleration'])
print(dot_data.getvalue())
predict_train = clf.predict(Xtrain)
predict_test = clf.predict(Xtest)
accuracy_train = sum(predict_train == Ytrain) / float(len(Ytrain))    
print(accuracy_train)
accuracy_test = sum(predict_test == Ytest) / float(len(Ytest))    
print(accuracy_test)

"""IV"""
leaf = 5
clf = DecisionTreeClassifier(min_samples_leaf = leaf)
clf = clf.fit(Xtrain, Ytrain)
predict_train = clf.predict(Xtrain)
predict_test = clf.predict(Xtest)
accuracy_train = sum(predict_train == Ytrain) / float(len(Ytrain))    
print(accuracy_train)
accuracy_test = sum(predict_test == Ytest) / float(len(Ytest))    
print(accuracy_test)


"""V """
n_estimators = 100
leaf = 1
bag_trees = []
for i in range(n_estimators):
    ratio = 0.8
    rs = np.random.choice(len(Ytrain), np.floor(len(Ytrain) * ratio))
    
    Xtrain_rs, Ytrain_rs = Xtrain[rs,:], Ytrain[rs]    
    clf = DecisionTreeClassifier(min_samples_leaf = leaf)
    clf = clf.fit(Xtrain_rs, Ytrain_rs)
    bag_trees.append(clf)

predictions = np.zeros((len(Ytest), n_estimators))
for i in range(n_estimators):
    predictions[:, i] = bag_trees[i].predict(Xtest)

predict_bagging = np.zeros((len(Ytest), )) 
for i in range(len(Ytest)):
    most_vote = 1 if sum(predictions[i, :]) >= n_estimators/2 else 0
    predict_bagging[i] =  most_vote

accuracy = sum(predict_bagging == Ytest) / float(len(Ytest))
print('Test accuracy with bagging  = ' + str(accuracy))


clf = DecisionTreeClassifier()
bag_clf = BaggingClassifier(clf, max_samples = 0.7, n_estimators = 10)
bag_clf = bag_clf.fit(Xtrain, Ytrain)

"""2). Predict the Xtest with the trained classifier."""
predictions = bag_clf.predict(Xtest)

"""3). Report accuracy"""
accuracy = sum(predictions == Ytest) / float(len(Ytest))