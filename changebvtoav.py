import sys
import argparse

#MonianHello
#2020年3月25日 01:55:49

#算法---
table='fZodR9XQDSUm21yCkr6zBqiveYah8bt4xsWpHnJE7jL5VG3guMTKNPAwcF'
tr={}
for i in range(58):
	tr[table[i]]=i
s=[11,10,3,8,4,6]
xor=177451812
add=8728348608

def dec(x):
	r=0
	for i in range(6):
		r+=tr[x[s[i]]]*58**i
	return (r-add)^xor


#算法---

#print(dec('BV17x411w7KC'))
#print(dec('BV1Q541167Qg'))
#print(dec('BV1mK4y1C7Bz'))
#print(enc(170001))
#print(enc(455017605))
#print(enc(882584971))

parser = argparse.ArgumentParser(description='MonianHello')
parser.add_argument('-bv' , type=str )
args = parser.parse_args()
print(dec(args.bv))