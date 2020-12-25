# Initialization
N = 2038667
R = Integers(2038667)
e = 103

# Part a, find c
m = R(892383)

c = m^e
print ( "c:", c )

# Part b
p = 1301
q = N / p
d = inverse_mod( e, (p-1)*(q-1) ) 
print ( "d:", d )

# Part c
c = R(317730)
m = c^d
print ( "m:", m )
