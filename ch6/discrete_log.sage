p = 5
A = 1
B = 1
E = EllipticCurve( GF(p), [0,0,0,A,B] )
P = E(4,2)
Q = E(0,1)

print( discrete_log( Q, P, P.order(), operation='+') )
