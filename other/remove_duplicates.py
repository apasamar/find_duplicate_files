#!/usr/bin/python

import os

file='./files/clean_sort_hashes.txt'

hashes=[]
with open(file,'r') as f:
	for line in f:
		sp=line.split(';')
		hash=sp[1].rstrip()
		file=sp[0]
		#print hash+' ; '+file
		if hash in hashes:
			command='os.system("rm '+file+'")'
			print command
			eval(command)
		else:
			hashes.append(hash)

#print str(hashes)
f.close()
