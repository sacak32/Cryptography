# Creates a polinomial with given "points" in mod p
p = 23
points = [(1,2),(3,4)]

def lagrange( p, points ):
	F = GF(p)
	R = F['x']
	return R.lagrange_polynomial(points)

lagrange( p, points )
