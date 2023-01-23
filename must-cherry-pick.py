# argv[1] = set A
# argv[2] = set B
#
# Writes out (A-B) in the same order they appear in A.
# Does not write out a line if it's the same as one written earlier.

import sys

fn1 = sys.argv[1]
fn2 = sys.argv[2]

f1 = open(fn1)
f2 = open(fn2)

b = {}
for l in f2:
    l = l.strip()
    b[l] = 1

a_done = {}
for l in f1:
    l = l.strip()
    if not l in b:
      if not l in a_done:
        print(l)
        a_done[l] = 1
