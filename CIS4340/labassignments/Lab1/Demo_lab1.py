# -*- coding: utf-8 -*-
"""
CIS 4340: Data Science 
This is demo for lab 1. You will learn variable declaration, strings, list, tuple, dictionary, list comprehension, I/O, csv modules.
@author: nymph
"""
###############################################################################
# Sec 1: Variables
a = 6 # global integer variable declaration
s = 'hi' # global string variable
text = "%d little pigs come out or I'll %s and %s and %s" % (3, 'huff', 'puff', 'blow down') # string format with %
text1 = "%d little pigs come out or I'll %s and %s and %s" % \
        (3, 'huff', 'puff', 'blow down')     # line breaking 1
text2 = ("%d little pigs come out or I'll %s and %s and %s" %   
        (3, 'huff', 'puff', 'blow down'))   # line breaking 2

pi = 3.14
###############################################################################

###############################################################################
# Sec 2: Operators
print a + pi
print a / pi
print a * pi
print 15 % 4
print not True
print True and False
print True & False
print True or False 
print True | False
###############################################################################

###############################################################################
# Sec 3: String methods
print text
print text1.lower()
print text1.title()
print text1.split()
###############################################################################

###############################################################################
# Sec 4: Lists and Dicts, list comprehension and dict comprehension
colors = ['red', 'blue', 'green']
print colors[0]    ## red
print colors[2]    ## green
print len(colors)  ## 3
numbers = [i for i in range(10) if i % 3 != 0 ]
print numbers

dicts = {}
dicts['a'] = 'alpha'
dicts['g'] = 'gamma'
dicts['o'] = 'omega'
print dicts  ## {'a': 'alpha', 'o': 'omega', 'g': 'gamma'}
dicts2 = {x:y for x,y in [('a','alpha'),('g','gamma'),('o','omega')]}
print dicts == dicts2

print dicts['a']     ## Simple lookup, returns 'alpha'
dicts['a'] = 6       ## Put new key/value into dict
print 'a' in dicts         ## True
###############################################################################

###############################################################################
# Sec 5: for, while, if
tsum = 0
for num in numbers:
    tsum += num
print tsum
###############################################################################

###############################################################################
# Sec 6: Functions 
def hello(name): # Define a main() function that prints a little greeting.
    if name == '': 
        name = 'World'
    print 'Hello', name
    print 'Hello ' + name
###############################################################################

###############################################################################
# Sec 7: I/O
import os

DATADIR = ""
DATAFILE = "beatles-diskography.csv"


def parse_file(datafile):
    data = []
    with open(datafile, "rb") as f:
        header = f.readline().strip().split(',')
        for line in f:
            print line
#            data.append(dict(zip(header,line.strip().split(','))))
    return data


def test():
    # a simple test of your implemetation
    datafile = os.path.join(DATADIR, DATAFILE)
    d = parse_file(datafile)
    firstline = {'Title': 'Please Please Me', 'UK Chart Position': '1', 'Label': 'Parlophone(UK)', 'Released': '22 March 1963', 'US Chart Position': '-', 'RIAA Certification': 'Platinum', 'BPI Certification': 'Gold'}
    tenthline = {'Title': '', 'UK Chart Position': '1', 'Label': 'Parlophone(UK)', 'Released': '10 July 1964', 'US Chart Position': '-', 'RIAA Certification': '', 'BPI Certification': 'Gold'}

    assert d[0] == firstline
    assert d[9] == tenthline

    
test()
###############################################################################