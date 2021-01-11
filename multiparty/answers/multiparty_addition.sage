def lagrange( p, points ):
	F = GF(p)
	R = F['x']
	return R.lagrange_polynomial(points)

def multipolynomial( p, n, values, c ):
    # Factory produces functions 
    def factory(i):
        def f(x):
            sum = 0
            for j in range(len(c[i])):
                sum = ( sum + c[i][j]*x^j ) % p
            return sum
        return f

    # Create fi's
    f = [0 for _ in range(n) ]
    for i in range(n):
        f[i] = factory(i)

    results = [[] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            results[i].append( f[j](values[i]) )


    # Print values 
    for x in values:
        for i in range(n):
            print( "f", i+1, "(", x, ")=", f[i](x), sep = "", end = " " )
        print()
    
    return results

p = 23		# the modula prime ( must be bigger than the sum )
n = 5		# number of functions
k = 4		# function degree + 1
v = 3		# values will be multiple of this coefficient
values = [v*x for x in range(1, n+1) ]	# values to put in functions
c =  [[3,2,1,3],
      [2,1,3,4],
      [7,4,1,2],
      [5,3,4,1],
      [4,1,2,2]]	# function coefficients ( n * m ) 

# Apply multipolynomial and get results
results = multipolynomial( p, n, values, c )

# Calculate sum of raws and create pairs.
pairs = []
for i in range(n):
	sum = 0
	for j in range(n):
		sum = ( sum + results[i][j] ) % p
	
	print( i+1, "th pair:", [values[i], sum] )
	pairs.append( [values[i], sum ] )

# Apply first k pairs lagrange interpolation
lagrange( p, pairs )
