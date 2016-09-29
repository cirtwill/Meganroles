#!/usr/bin/python

#from mfinder import *
from wrapper import *
import sys

##############################################################
##############################################################
# C'est le debut
##############################################################
##############################################################
filename = sys.argv[1]

randomize = False
structure = True
participation = False

# generate a randomized version of the network
if randomize:
    rnd = random_network(filename,
                         usemetropolis = False,
                         )

    # print out the results
    print_random_network(rnd,
                         outFile=None,
                         sep=' ',
                         header=True,
                         )

# calculate the network's motif structure

if structure:
    mm = motif_structure(filename,
                         motifsize = 3,
                         nrandomizations = 250,
                         usemetropolis = False,
                         stoufferIDs = False,
                         )

    # print out the results
    print_motif_structure(mm,
                          outFile=None,
                          sep='\t',
                          header=True,
                          )

# calculate the network's (node-by-node) motif participation
if participation:
    pp = motif_participation(filename,
                             motifsize = 0,
                             randomize = False,
                             usemetropolis = False,
                             stoufferIDs = False,
                             )

    # print out the results
    print_participation(pp,
                        outFile=None,
                        sep='\t',
                        header=True)



##############################################################
##############################################################
# C'est fini
##############################################################
##############################################################
