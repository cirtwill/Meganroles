#!/usr/bin/python

def first(a):  #extracts first element of tuple (experiment #)
  return a[0]
def second(a): #extracts second element of tuple (no. of days)
  return a[1]
def third(a):  #extracts third element of tuple (no. species)
  return a[2]
def fourth(a):
  return a[3]
def fifth(a):
  return a[4]
def sixth(a):
  return a[5]
def last(a):   #extracts last element of tuple (prey)
  return a[-1]


def web_build(a):#makes network graph
  import networkx as nx
  predprey=[]
  f=open(a)
  for line in f:
    (pred,prey)=line.split()
    predprey.append((pred,prey))
  spp=[]
  for pair in predprey:
    pred=first(pair)
    prey=last(pair)
    spp.append(pred)
    spp.append(prey)
  spp_sorted=sorted(spp)   #list of species
  shortlist=[]             #new list with each species entered only once
  for sp in spp_sorted:
    if not sp in shortlist:
      shortlist.append(sp) 
  G=nx.DiGraph() #Directed graph. To undirect nx.Graph()
  for sp in shortlist:
    G.add_node(sp) 
  for pair in predprey:
    G.add_edge(*pair)  
  return G

