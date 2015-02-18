# -*- coding: utf-8 -*-





""" Task a). Find the nearest neighbors of 2014 with January daily max or min temperature."""
    # Create the required matrix
import matrix_generation
import numpy as np
import matplotlib.pyplot as plt
years = np.arange(1874, 2015)
daily_max_mtx_jan = matrix_generation.daily_mtx(years, 1, "Max")

    # Find the nearest neighbors of 2014 based on the daily January max temperature matrix.
from scipy.spatial.distance import pdist, squareform
data_dist_flat = pdist(daily_max_mtx_jan, 'euclidean') # computing the distance
data_dist_square = squareform(data_dist_flat) # make the flat distance as a matrix
nearest_neighbors_indices = data_dist_square.argsort(axis = 1)   # sort each row in ascending order 
k = 5
knn_years = years[nearest_neighbors_indices[-1, 2:(2+k)]]
print('The 5 nearest years of 2014 based on January daily max temperature is: ' + str(knn_years))


"""Task b). Find the nearest neighbors of 2014 with whole year monthly average of max or min temperature."""
    # Create the required matrix
years = np.arange(1874, 2015)
monthly_maxave_mtx = matrix_generation.monthly_ave_mtx(years, 'Max')
    # Find the nearest neighbors of 2014 based on the monthly average of max temperature matrix.
from scipy.spatial.distance import pdist, squareform
data_dist_flat = pdist(monthly_maxave_mtx, 'euclidean') # computing the distance
data_dist_square = squareform(data_dist_flat) # make the flat distance as a matrix
nearest_neighbors_indices = data_dist_square.argsort(axis = 1)   # sort each row in ascending order 
k = 5
knn_years = years[nearest_neighbors_indices[-1, 2:(2+k)]]
print('The 5 nearest years of 2014 based on monthly average of max temperature matrix is: ' + str(knn_years))

# Task c). Cluster the 141 years (except 2015) with their monthly average of max or min temperature, using hierarchical clustering. And draw heatmap with the rows sorted according to the leaf order of HC.
    # Create the required matrix
years = np.arange(1874,2015)
monthly_maxave_mtx = matrix_generation.monthly_ave_mtx(years, 'Max')
    
    # Hierarchical Clustering
from scipy.spatial.distance import pdist, squareform
from scipy.cluster.hierarchy import linkage, dendrogram
data_dist_flat = pdist(monthly_maxave_mtx, 'euclidean') # computing the distance
data_linkage = linkage(data_dist_flat, method='average')
    # Plot dendrogram and the heatmap of temperatures.
# Dendrogram
fig = plt.figure(figsize=(8,8))
ax1 = fig.add_axes([0.05,0.1,0.3,0.8])
Z = dendrogram(data_linkage,orientation='right')
plt.xticks([])
plt.yticks([])
plt.title('Dendrogram')
# Heatmap
ax2 = fig.add_axes([0.36, 0.1,0.5,0.8])
idx = Z['leaves']
data_ordered = monthly_maxave_mtx[idx, :]
im = ax2.matshow(data_ordered, aspect='auto', origin='lower', cmap=plt.cm.YlGnBu)     
plt.xticks([])
plt.yticks([])
#plt.title('Heatmap')
plt.xlabel('Month')

# Colorbar
ax3 = fig.add_axes([0.91,0.1,0.02,0.8])
plt.colorbar(im, cax=ax3)
plt.title('Colorbar')
plt.suptitle('Hierarchical Clustering', fontweight='bold', fontsize=14)

"""Task d): Find the nearest neighbors of 2015 with January daily max or min temperature. Predict the max or min temperature in June."""
years = np.arange(1874, 2016)
daily_max_mtx_jan = matrix_generation.daily_mtx(years, 1, "Max")

from scipy.spatial.distance import pdist, squareform
data_dist_flat = pdist(monthly_maxave_mtx, 'euclidean') # computing the distance
data_dist_square = squareform(data_dist_flat) # make the flat distance as a matrix
nearest_neighbors_indices = data_dist_square.argsort(axis = 1)   # sort each row in ascending order 
k = 5
knn_years = years[nearest_neighbors_indices[-1, 2:(2+k)]]

prediction = matrix_generation.daily_mtx(knn_years, 6, "Max") 
prediction = np.mean(prediction, axis = 0)

print("The prediction for the Max temperature of year 2015 in  July is: " + str(prediction))
