p = 61
R = Integers( p )
A = 8
B = 7
E = EllipticCurve( GF(p), [0,0,0,A,B] )
P = E(12,1)
Q = E(39,38)

E = int( p + 2*sqrt(p) + 1 )
n = int( sqrt( E ) ) + 1
print( "n:", n )

l1 = [0]
tmp = P
for i in range( n ):
	l1.append( tmp )
	tmp += P

print( l1 )

l2 = []
R = -n*P
tmp = Q
for i in range( n ):
	l2.append( tmp )
	tmp += R
	
print( l2 )

for i in range(len(l1)):
    for j in range(len(l2)):
        if l1[i] == l2[j]:
            print( "i:", i, "j:", j, "x:", i+j*n )
            break
