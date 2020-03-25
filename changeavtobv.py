import sys
import argparse

#MonianHello
#2020年3月25日 01:57:02

#---
table='fZodR9XQDSUm21yCkr6zBqiveYah8bt4xsWpHnJE7jL5VG3guMTKNPAwcF'
tr={}
for i in range(58):
	tr[table[i]]=i
s=[11,10,3,8,4,6]
xor=177451812
add=8728348608


def enc(x):
	x=(x^xor)+add
	r=list('BV1  4 1 7  ')
	for i in range(6):
		r[s[i]]=table[x//58**i%58]
	return ''.join(r)
#---

#print(dec('BV17x411w7KC'))
#print(dec('BV1Q541167Qg'))
#print(dec('BV1mK4y1C7Bz'))
#print(enc(170001))
#print(enc(455017605))
#print(enc(882584971))

parser = argparse.ArgumentParser(description='MonianHello')
parser.add_argument('-av' , type=int )
args = parser.parse_args()
print(enc(args.av))