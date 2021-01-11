S = 17
n = 5
k = 4
c1, c2, c3 = 3, 1, 2
p = 23
F = GF(p)

def f(x):
    return ( S + c1*x + c2*x^2 + c3*x^3 ) % p

points = [(i, f(i)) for i in [2,4,8,10]]
R = F['x']
R.lagrange_polynomial(points)
