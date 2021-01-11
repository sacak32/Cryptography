# given superincreasing sequence M and integer S, solves the problem of (M,S) and returns the solution sequence x, if no solution returns -1
def superincreasing( M, S ):
	x = []
	i = len(M) - 1
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

M = (3, 7, 19, 43, 89, 195)
S = 260
print( superincreasing( M, S ) )
		
