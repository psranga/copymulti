import sys

f1, f2 = sys.argv[1:]

b = set([l.strip() for l in open(f2)])
a = [l.strip() for l in open(f1)]

o = filter(lambda l: l not in b, a)

for l in o:
  print l
