N = 1001
p = 23

n = int(1 + sqrt(N))
for i in range(50):
	a = ( n * n ) % N
	print( "n: ", n, " = ", factor( a ) )
	n += 1
	
