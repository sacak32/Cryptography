N = 48356747
R = Integers(N)
a = R(2)

# apply pollard's algorithm
for i in range(2,100):
	a = a^i
	print ( "step", i, ":", a )
	d = gcd( a - 1, N )
	if 1 < d:
		print ( "found a factor in ", i, "th step:", d )
		break
