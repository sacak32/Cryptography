N = 28102844557
A = 18
B = -453
E = EllipticCurve( Zmod(N), [0,0,0,A,B] )
P = E(7,4)


for i in range(2,29):
	P = i*P
	print( i, P[0], P[1] )
Q = 28 * P
g = gcd( Q[0] - P[0], N )
print( "gcd:", g )

print( N / int(g) )	
