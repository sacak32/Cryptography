# in modulo p, create functions from indexes in c, apply each value in "values" to each created function. n is the number of functions. 
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

p = 23		# the modula 
n = 5		# number of functions
values = [x for x in range(3,16) if x % 3 == 0]	# values to put in functions
c = [[3,2,1,3],
     [2,1,3,4],
     [7,4,1,2],
     [5,3,4,1],
     [4,1,2,2]]	# function coefficients ( n * m ) 
     
multipolynomial( p, n, values, c )
