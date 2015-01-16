#!/usr/bin/env python
"""
CIS 4340: Data Science 
Lab 1 Assignment: Part 2
Due Tue Jan 20 11:59 PM
@author: nymph

Your task is to process the supplied file and use the csv module to extract data from it.
The data comes from NREL (National Renewable Energy Laboratory) website. Each file
contains information from one meteorological station, in particular - about amount of
solar and wind energy for each hour of day.

Note that the first line of the datafile is neither data entry, nor header. It is a line
describing the data source. You should extract the name of the station from it.

1). The data should be returned as a list of lists (not dictionaries).
You can use the csv modules "reader" method to get data in such format.
Another useful method is next() - to get the next line from the iterator.
You should only change the parse_file function.

2). Calculate the maxmum , average value of the 3rd column. Think about what the 0 means. 
Then calculate the average of the nonzero values of the 3rd column.
"""
import csv
import os

DATADIR = ""
DATAFILE = "745090.csv"

def column(data, i):
    return [float(data[j][i - 1]) for j in range(len(data))]
    
def statistics(data, i):
    # Don't change the function declaration
    columndata = column(data, i)
     # Calculate the maximum, average, nonzero maximum, nonzero average of the ith column
    #maximum = 0
    #ave = 0
    #nonzave = 0
    return maximum, ave, nonzave

def parse_file(datafile):
    name = ""
    data = []
    # Do not change the line below
    return (name, data)


def test():
    datafile = os.path.join(DATADIR, DATAFILE)
    name, data = parse_file(datafile)

    assert name == "\"MOUNTAIN VIEW MOFFETT FLD NAS\""
    assert data[0][1] == "01:00"
    assert data[2][0] == "01/01/2005"
    assert data[2][5] == "2"
    
    a, b, c = statistics(data, 3)
    assert a == 702.0
    
if __name__ == "__main__":
    test()