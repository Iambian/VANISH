## Iterates across includes and returns one that contains uniques from all others
import os,sys
from collections import defaultdict
args = sys.argv[1:]
if len(args)<3: raise ValueError("Usage: merge.py inf1 inf2 [...] infN outf")
darr = []
for fn in args[:-1]:
    if not os.path.isfile(fn): raise IOError("Cannot open "+fn)
    darr.append({})
    with open(fn,"r") as f:
        for i in f.readlines():
            i = i.split()
            if len(i)>2 and i[1]=='=': darr[-1][i[0]] = i[2]
    os.remove(fn)
mdict = {}
for i,d in enumerate(darr):
    nd = {k:td[k] for td in darr[:i]+darr[i+1:] for k in td} #merge all other dicts
    ud = {k:nd[k] for k in set(nd)-set(d)}  #get all entries but d
#    for k in ud: mdict[k] = ud[k]          #get uniques in all dicts
    with open(args[-1].replace('?',str(i)),'w') as f:
        for k in ud:
            f.write('   '.join((k,'.EQU',ud[k],"\n")))
pass
