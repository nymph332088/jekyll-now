# -*- coding: utf-8 -*-
"""
CIS 4340: Data Science 
Lab 1 Assignment: Part 1
Due Tue Jan 20 11:59 PM
@author: nymph
"""
###############################################################################
# Question 1
# Experiment with the following code. What is the output of a, b, c, d
a = []
[a.append([i for i in range(5)]) for j in range(3)]
b = sum(a[0])
c = [i % 2 for i in range(100)][:10]
d = sorted(['c','a','apple','orange'])
###############################################################################

###############################################################################
# Question 2
# 1st, create a list of list using nested for loop. Denote the list as a. The list of list should be 
#      with 4 elements in the first dimension, and 2 elements in the second dimension, 
#      such as [[0,0],[0,0],[0,0],[0,0]]. Fill the list of list with random numbers.

# 2nd, create a list of list using list comprehension. Denote as b. Same requirement as in the 1st.
# 3rd, try a + b. See what happened.
import random
randnum = random.random()
###############################################################################


###############################################################################
# Question 3
# Complete the factorial function. It calculates the factorial of an integer. 
# The Fomula is n! = n*(n-1)*(n-2)*...*1

def factorial(n):
    pass

facts = [factorial(i) for i in range(10)]
###############################################################################