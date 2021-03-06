def bgw( p, n, l, P, Q, values, a, b, c ):
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

    # Create f, g, h
    f = []
    for i in range(n):
        f.append([P[i]])
        for j in range(l):
            f[i].append(a[i][j])

    g = []
    for i in range(n):
        g.append([Q[i]])
        for j in range(l):
            g[i].append(b[i][j])

    h = []
    for i in range(n):
        h.append([0])
        for j in range(2*l):
            h[i].append(c[i][j])	

    # call multipolynomial for f, g, h
    fres = multipolynomial( p, n, values, f )
    gres = multipolynomial( p, n, values, g )
    hres = multipolynomial( p, n, values, h )

    # calculate N
    N = []
    for i in range(n):
        fsum, gsum, hsum = 0,0,0
        for j in range(n):
            fsum += fres[i][j]
            gsum += gres[i][j]
            hsum += hres[i][j]
        N.append( ( fsum * gsum + hsum ) % p )

    print( "N:", N )

    # Build pairs and apply lagrange interpolation
    pairs = []
    for i in range(n):
        pairs.append([values[i],N[i]])

    def lagrange( p, points ):
        F = GF(p)
        R = F['x']
        return R.lagrange_polynomial(points)

    return lagrange( p, pairs )
    
# Application of bgw protocol
MAX = 100000		# the resulting N must be smaller than this.
n = 3			# number of people
l = floor((n-1)/2)
P = [23,12,8] 		# pi's
Q = [35,8,16]		# qi's
v = 1			# value coefficients
values = [v*x for x in range(1, n+1) ]	# values to put in functions
a = [[3],[5],[6]]   	# Size n*l, n people chooses l random number
b = [[7],[4],[1]]	# Size n*l, n people chooses l random number
c = [[1,4],[6,2],[4,3]] # Size n*2l, n people chooses 2l random number
r1 = [8,11,21]
r2 = [15,19,9]
M = 11

# set primes less then M
primes = []
for i in range(3,M+1):
    if is_prime(i):
        primes.append(i)
        
# calculate results
pfirst, psecond, qfirst, qsecond = [], [], [], []
for p in primes:
    pfirst.append( bgw( p, n, l, P, r1, values, a, b, c ) )
    psecond.append( bgw( p, n, l, P, r2, values, a, b, c ) )
    qfirst.append( bgw( p, n, l, Q, r1, values, a, b, c ) )
    qsecond.append( bgw( p, n, l, Q, r2, values, a, b, c ) )
N = bgw( next_prime(MAX), n, l, P, Q, values, a, b, c )

# print results
for i in range(len(primes)):
    print( pfirst[i], psecond[i], qfirst[i], qsecond[i] )
print( "N:", N )





