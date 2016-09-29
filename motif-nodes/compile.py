import os
import sys

fout=open("../size3overall.csv","w")
# first file:
#for line in open("id14"):
#	fout.write(line)
# now the rest:   
directory= "Alyssa/frequencies"
for files in os.walk(directory):
	for item in files[2]:
	  name = ("Alyssa/frequencies/"+item)
      	  f = open(name,'r')
      	  next(f) # skip the header
      	  for line in f:
            fout.write(line)
			#f.close() # not really needed
fout.close()


#directory should be /frequencies not /output but run_frequencies not 100% finished
