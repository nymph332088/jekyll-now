# -*- coding: utf-8 -*-

import pymongo
from pymongo import MongoClient
client = MongoClient(max_pool_size=200)
db = client['test']

db.twitterlab9.find_one()
query = {'user.geo_enabled' : True}
db.twitterlab9.find_one(query)

query = {'user.geo_enabled':True}
results1 = list(db.twitterlab9.find())
results2 = list(db.twitterlab9.find(query))

query1 = {'geo': {'$ne': None}}
query2 = {'truncated': True, 'source': 'web'}
query3 = {'user.followers_count': {'$gt' : 400 } }
query4 = {'user.followers_count': {'$gt' : 200, '$lt': 300}}
query5 = {'entities.hashtags' : {'$size': 1}}
query6 = {'entities.hashtags.text': 'NCIS'}
query7 = {'retweeted_status': {'$exists':0}}
query8 = {'text': {'$regex': '[Bb]asketball'}} 

projection = {'text': 1 }
db.twitterlab9.find_one( query8, projection )
results3 = list(db.twitterlab9.find( query8, projection))

import time
start_time = time.time()
query3 = {'user.followers_count': {'$gt' : 400 } }
print(db.twitterlab9.find(query3).count())
print("--- %s seconds ---" % (time.time() - start_time))

db.twitterlab9.create_index('user.followers_count')

start_time = time.time()
""" 1). Find all distinct user languages in the collection. (The 'user.lang' field) """
dist_langs = db.twitterlab9.distinct('user.lang')
print(len(dist_langs))

"""2). For each distinct user language, count the number of tweets published by this language"""
counts = [db.twitterlab9.find({'user.lang': lang}).count() for lang in dist_langs]
print(counts)
print("--- %s seconds ---" % (time.time() - start_time))

start_time = time.time()
results4 = db.twitterlab9.aggregate(
         {'$group': 
            {'_id':  '$user.lang',   'count':  { '$sum' :  1} } 
         })
print("--- %s seconds ---" % (time.time() - start_time))         
         
results5 = db.twitterlab9.aggregate(
   {'$group': 
       {'_id':  '$user.id',   'count':  { '$sum' :  1} }                        
   })