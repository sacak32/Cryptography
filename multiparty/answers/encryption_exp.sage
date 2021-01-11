p1, p2, p3 = 23, 12, 8
q1, q2, q3 = 35, 8, 16
p = p1+p2+p3 
q = q1+q2+q3
N = p*q
e = 101

print( "P1:", ( N - p1 - q1 + 1 ) % e )
print( "P2:", ( - p2 - q2 ) % e  )
print( "P3:", ( - p3 - q3 ) % e )

x = ( N - p - q + 1 ) % e
print( "Q(N):", x )
print( "gcd(e,Q(N):", gcd(e, x) )

print( "inv(Q(N)):", inverse_mod( x, e ) )
