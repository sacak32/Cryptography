def superincreasing( M, n, S ):
	x = []
	i = n - 1
	while i >= 0:
		if ( S >= M[i] ):
			x.insert( 0, 1 )
			S -= M[i]
		else:
			x.insert( 0, 0 )
		i -= 1
		print( S )
		
	if S == 0:	
		return x
	else:
		return -1

M = [4, 12, 15, 36, 75, 162]
n = 6
S = 214

print( superincreasing( M, n, S ) )
		
