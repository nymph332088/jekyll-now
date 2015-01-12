# -*- coding: utf-8 -*-
"""
Created on Sun Jan 11 18:39:41 2015

@author: nymph
"""
import sys

def top_k(k, filename):
    topK = []
    return topK

def word_count(filename):
    wordcount = []
    print 'Hello ' + filename
    with open(filename) as f:
         print 'Number of lines: ' + str(len(f.readlines()))
    return wordcount

if __name__ == '__main__':
    wordCount = word_count(sys.argv[1])
    topK = top_k(10, sys.argv[1])