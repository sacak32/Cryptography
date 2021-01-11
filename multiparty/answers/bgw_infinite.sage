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

# Application of bgw protocol
P = 100003		# make this just too big
n = 3			# number of people
l = floor((n-1)/2)
p = [2,1,2] 		# pi's
q = [3,4,1]		# qi's
v = 1			# value coefficients
values = [v*x for x in range(1, n+1) ]	# values to put in functions
a = [[1],[1],[3]]   	# Size n*l, n people chooses l random number
b = [[2],[2],[4]]	# Size n*l, n people chooses l random number
c = [[0,1],[1,2],[1,-1]] # Size n*2l, n people chooses 2l random number

# Create f, g, h
f = []
for i in range(n):
	f.append([p[i]])
	for j in range(l):
		f[i].append(a[i][j])

g = []
for i in range(n):
	g.append([q[i]])
	for j in range(l):
		g[i].append(b[i][j])

h = []
for i in range(n):
	h.append([0])
	for j in range(2*l):
		h[i].append(c[i][j])	
		
# call multipolynomial for f, g, h
fres = multipolynomial( P, n, values, f )
gres = multipolynomial( P, n, values, g )
hres = multipolynomial( P, n, values, h )

# fix result arrays
def fix( arr ):
    for i in range(len(arr)):
        for j in range(len(arr[0])):
            if arr[i][j] > P / 2:
                arr[i][j] -= P
fix(fres)
fix(gres)
fix(hres)

# calculate N
N = []
for i in range(n):
    fsum, gsum, hsum = 0,0,0
    for j in range(n):
        fsum += fres[i][j]
        gsum += gres[i][j]
        hsum += hres[i][j]
    N.append( fsum * gsum + hsum )

print( "N:", N )

# Build pairs and apply lagrange interpolation
pairs = []
for i in range(n):
    pairs.append([values[i],N[i]])

def lagrange( p, points ):
	F = GF(p)
	R = F['x']
	return R.lagrange_polynomial(points)

lagrange( P, pairs )
