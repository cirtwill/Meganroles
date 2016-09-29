#opening data
f = open ("/home/mew70/Documents/motif-nodes/from-daniel/size-5-motifs.txt", "r")

#creating dictionary with id as key and interactions as data
motif_dictionary = {}
for line in f:
    sline = line.replace("\n","").split(" ")
    if len(sline)==1:
#    if len(line) == 2:
       splt = line.replace("\n","")    
       motif_dictionary[splt]=[]
#    if len(line) == 4:
    else:
       fixedline = line.replace("\n","")
       motif_dictionary[splt].append(fixedline)
print motif_dictionary
  

#saving each key as seperate file
for motif in motif_dictionary:
  outfile=open('id'+str(motif),'w')
#  outfile.write(str(motif)+'\n')
  for pair in motif_dictionary[motif]:
    outfile.write(str(pair)+'\n')
  outfile.close()

