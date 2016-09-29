###Code to count number of unique positions in a subweb###
import sys


def grapher(infile):

  from tools import web_build

  web=web_build(infile)
  max_pos=len(web.nodes())

  print max_pos

def main():
  
  infile = sys.argv[1]  #correlation matrix of branch lengths outputted from 'R

  grapher(infile)

if __name__ == '__main__':
  main()
