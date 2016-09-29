import sys
import numpy

finallist = []
inFile = open('/motif-nodes/size-5/size5_data.csv')
for line in inFile:
    read = line.strip().split(',')    
    sp=read[0]
    freq=read[1]
    finallist.append((sp,freq))
inFile.close()
#print finallist


from collections import defaultdict
import pprint

f = open('/motif-nodes/size-5/weightsdata','w')

weighting_dict = {}
for item in finallist:
    weighting_dict.setdefault(item[0],[]).append(float(item[1]))
  
#print weighting_dict
#pprint.pprint(weighting_dict.keys())

#print weighting_dict['98']
#print numpy.sum(weighting_dict['98'])

finaldata= []
for item in weighting_dict:
    numsum = numpy.sum(weighting_dict[item])
    finaldata.append((item,numsum))

print finaldata

for item in finaldata:
    f.write(str(item[0]) + ' ' + str(item[1]) + '\n')
f.close()






  

