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

# Real Program
M = [5186, 2779, 5955, 2307, 6599, 6771, 6296, 7306, 4115, 637]
A = 4392
B = 8387
S = 21025

r = []
Ainv = inverse_mod(A, B)
for m in M:
	r.append( ( m*Ainv ) % B )
	
print( "A inv: ", Ainv )
print( r )

S_ = ( Ainv * S ) % B
print( "S': ", S_ )
		
print( "\nSuperincreasing:", superincreasing( r, S_ ) )

# Applying LLL 
print( "\nLLL:" )
mat = matrix([[2,0,0,0,0,0,0,0,0,0,M[0]],
            [0,2,0,0,0,0,0,0,0,0,M[1]],
            [0,0,2,0,0,0,0,0,0,0,M[2]],
            [0,0,0,2,0,0,0,0,0,0,M[3]],
            [0,0,0,0,2,0,0,0,0,0,M[4]],
            [0,0,0,0,0,2,0,0,0,0,M[5]],
            [0,0,0,0,0,0,2,0,0,0,M[6]],
            [0,0,0,0,0,0,0,2,0,0,M[7]],
            [0,0,0,0,0,0,0,0,2,0,M[8]],
            [0,0,0,0,0,0,0,0,0,2,M[9]],   
            [1,1,1,1,1,1,1,1,1,1,S]])
            
print ( mat.LLL() )
