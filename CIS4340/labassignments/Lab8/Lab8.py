# -*- coding: utf-8 -*-

"""Section II. Data Set and preparation"""

"""1): Import neccessary toolboxes"""
import pandas as pd
import numpy as np
from sklearn.tree import DecisionTreeClassifier, export_graphviz
from sklearn.ensemble import BaggingClassifier
from sklearn import cross_validation
from sklearn.externals.six import StringIO


"""2): Load the data"""
data = pd.read_csv("http://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data-original", delim_whitespace = True, \
 header=None, names = ['mpg', 'cylinders', 'displacement', 'horsepower', 'weight', 'acceleration', 'model', 'origin', 'car_name'])
data = data.dropna()
data = data.iloc[:, :-1]
data = data[~ data.cylinders.isin([3, 5, 7])]
data.cylinders = data.cylinders.astype(np.int)

"""3): Specify the samples matrix X with size [n_samples, n_features], 
and array Y of integer values, size [n_samples], holding the class  labels for the training samples."""

X = data[['mpg', 'displacement', 'horsepower', 'weight', 'acceleration']]
Y = data['cylinders']
Y[Y == 4] = 0
Y[Y == 6] = 1
Y[Y == 8] = 2


"""4). Split (X,Y) into train (Xtrain, Ytrain) test (Xtest, Ytest) data."""

Xtrain, Xtest, Ytrain, Ytest = cross_validation.train_test_split(\
 X, Y, test_size=0.2, random_state=0)

""" Section III: A Decision Tree  Classifier"""
"""1). Train a decision tree classifier on the train set (Xtrain, Ytrain)."""

clf = DecisionTreeClassifier(random_state = 0)
clf = clf.fit(Xtrain, Ytrain)

"""2). Predict the Xtest with the trained classifier."""
predictions = clf.predict(Xtest)

"""3). Report the accuracy."""
accuracy = sum(predictions == Ytest) / float(len(Ytest))
    
print(accuracy)

"""Section IV.1: Model Selection by spliting the (Xtrain, Ytrain) """
"""1). Split (Xtrain, Ytrain) into training set (Xtraining, Ytraining) and pruning set (Xprunning, Ypruning)"""
Xtraining, Xprunning, Ytraining, Yprunning = cross_validation.train_test_split(\
 Xtrain, Ytrain, test_size=0.2, random_state=1)

"""2). Specify a series of values for the min_samples_leaf hyperparameter"""
min_leaf = [1, 3, 4, 6, 8, 10, 12, 20] 

"""3). Loop through every value, train a classifier with (Xtraining, Ytraining)"""
best_model = 0
best_accuracy = 0
for i, leaf in enumerate(min_leaf):
    clf = DecisionTreeClassifier(min_samples_leaf = leaf)
    clf = clf.fit(Xtraining, Ytraining)
    predictions = clf.predict(Xprunning)
    accuracy = sum(predictions == Yprunning) / float(len(Yprunning))
    print(accuracy)
    if ( accuracy > best_accuracy):
        best_accuracy = accuracy
        best_model = min_leaf[i]
        
print('The best model is to choose min_samples_leaf = ' + \
    str(best_model) + ' with the best pruning accuracy = ' + str(best_accuracy))

"""4).Train a classifier on (Xtrain, Ytrain) again with the best hyperparameter """
clf_best = DecisionTreeClassifier(min_samples_leaf = best_model)
clf_best = clf_best.fit(Xtrain, Ytrain)

"""5). Predict the Xtest with the 'best' classifer and report the accuracy"""
predictions = clf_best.predict(Xtest)
accuracy = sum(predictions == Ytest) / float(len(Ytest))
print('Test accuracy with model selection = ' + str(accuracy))


"""Section IV.2 Model Selection with K-fold cross validation"""

"""1). Split the (Xtrain, Ytrain) into 4 folds"""
kf = cross_validation.KFold(len(Ytrain), n_folds = 4, random_state = 1)

"""2). Specify a series of values for the min_samples_leaf hyperparameter """
min_leaf = [1, 3, 4, 6, 8, 10, 12, 20] 

"""3). Loop through every value, train and test classifiers with kf, 
evaluate model by the average accuracy on kf"""
best_model = 0
best_accuracy = 0

for i, leaf in enumerate(min_leaf):
    clf = DecisionTreeClassifier(min_samples_leaf = leaf)
    accuracies = cross_validation.cross_val_score(clf, Xtrain, Ytrain, cv = kf)
    accuracy = accuracies.mean()
    print(accuracy)
    if ( accuracy > best_accuracy):
        best_accuracy = accuracy
        best_model = min_leaf[i]

print('The best model is to choose min_samples_leaf = ' + \
    str(best_model) + ' with the best pruning accuracy = ' + str(best_accuracy))

"""4).Train a classifier on (Xtrain, Ytrain) again with the best hyperparameter predict the Xtest"""
clf_best = DecisionTreeClassifier(min_samples_leaf = best_model)
clf_best = clf_best.fit(Xtrain, Ytrain)
predictions = clf_best.predict(Xtest)
accuracy = sum(predictions == Ytest) / float(len(Ytest))
print('Test accuracy with 4-fold cv model selection = ' + str(accuracy))

""" A Bagging Classifier with DT as the base Classifier"""
"""1). Train a bagging classifier with (Xtrain, Ytrain) as in II."""
clf = DecisionTreeClassifier()
bag_clf = BaggingClassifier(clf, max_samples = 0.5, n_estimators = 100)
bag_clf = bag_clf.fit(Xtrain, Ytrain)

"""2). Predict the Xtest with the trained classifier."""
predictions = bag_clf.predict(Xtest)

"""3). Report accuracy"""
accuracy = sum(predictions == Ytest) / float(len(Ytest))
print('Test accuracy with bagging without model selection = ' + str(accuracy))

dot_data = StringIO() 
export_graphviz(clf, out_file=dot_data, feature_names = feature_names) 
graph = pydot.graph_from_dot_data(dot_data.getvalue())
