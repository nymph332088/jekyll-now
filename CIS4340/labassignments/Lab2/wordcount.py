# -*- coding: utf-8 -*-
"""
Created on Sun Jan 11 18:39:41 2015

@author: nymph
"""
import sys

def print_dict(d):
	pass
	
def top_k(k, wordcount):
    topK = {}
    return topK

def word_count(filename):
    wordcount = {}
    print 'Hello ' + filename
    with open(filename) as f:
         print 'Number of lines: ' + str(len(f.readlines()))
    return wordcount

def word_count_2():
	wordcount = {}
	return wordcount

def clean():
	pass

if __name__ == '__main__':

	# Part 2
    wordCount = word_count(sys.argv[1])
    print_dict(wordCount)
    
    topK = top_k(10, wordCount)
    print_dict(wordCount)
    
    # Part 3
    wordCount2 = word_count_2()
    print_dict(wordCount2)
    
    topK = top_k(10, wordCount)
    print_dict(wordCount2)
    
    
    # Part 4
#    clean()
#    wordCount_Cleaned = word_count(sys.argv[1])
#    print_dict(wordCount_Cleaned)
#    
#    topK_Cleaned = top_k(10, wordCount_Cleaned)
#    print_dict(topK_Cleaned)
    
    
    
