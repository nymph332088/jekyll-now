# -*- coding: utf-8 -*-
"""
Created on Thu Jan  8 17:18:33 2015

@author: nymph
"""
from __future__ import absolute_import, print_function
from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import sys

ckey = "<Enter api key>"
csecret = "<Enter api secret>"
atoken = "<Enter your access token key here>"
asecret = "<Enter your access token secret here>"

class listener(StreamListener):
    def on_data(self, data):
        print(data)
        return True
    
    def on_error(self, status):
        print(status)

if __name__ == '__main__':
    auth = OAuthHandler(ckey, csecret)
    auth.set_access_token(atoken, asecret)
    twitterStream = Stream(auth, listener())
#    sys.stdout = open('twitter_data.txt', 'w')
    print(twitterStream.filter(track=['basketball']))