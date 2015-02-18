# -*- coding: utf-8 -*-
"""
Created on Tue Feb 17 16:12:12 2015

@author: shanshan
"""

def monthly_ave_mtx(years, colname):
    """Create a matrix with size N by 12.
    Each row contains monthly average min or max temperature of a whole year.
    
    arguments:
    years --  N length list-like years, e.g., [2012, 2011, 2013], or np.array([2012,2011,2013])
    colname -- a string either "Max" or "Min".
    
    outputs:
    month_mtx -- N by 12 matrix
    
    usage example:
    # To create a monthly average of max temperature matrix of years 1874 - 2014
    import matrix_generation
    monthly_maxave_mtx = matrix_generation.monthly_ave_mtx(range(1874,2015), 'Max')
    """
    import numpy as np
    import pandas as pd
    history_temp = pd.read_csv('./historiacl_temperature_philly.csv',delimiter = ',', dtype={key:np.float for key in ['Year','Month','Day','Max','Min']})
    month_mtx = pd.pivot_table(history_temp[history_temp.Year.isin(years)],
                                                 values=colname, rows='Year',cols='Month', aggfunc=np.mean)
    month_mtx.fillna(-999, inplace=True)
    return month_mtx.values

def daily_mtx(years, month, colname):
    """Create a matrix with size N by (number of days in month)
    Each row contains daily max or min temperature of the month in the year. 
    
    arguments:
    years -- a N length list-like years, e.g., [2012, 2011, 2013], or np.array([2012,2011,2013])
    month -- an interger between [1, 12].
    colname -- a string either "Max" or "Min".
    
    outputs:
    daily_mtx -- a N by 30 or N by 31 or N by 28 table, where N is the length of years. \
                Column number varies with different month selection
    
    example:
    # To create a daily max temperature matrix in Jan of years from 1874-2015
    import matrix_generation
    daily_max_mtx_jan = matrix_generation.daily_mtx(range(1874, 2016), 1, "Max")
    """
    import numpy as np
    import pandas as pd
    history_temp = pd.read_csv('./historiacl_temperature_philly.csv',delimiter = ',', dtype={key:np.float for key in ['Year','Month','Day','Max','Min']})
    daily_mtx = pd.pivot_table(history_temp[(history_temp.Year.isin(years)) & (history_temp.Month == month)], values=colname, rows='Year',cols='Day')
    daily_mtx.fillna(-999, inplace=True)
    return daily_mtx.values