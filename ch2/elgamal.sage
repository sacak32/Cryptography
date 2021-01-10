# Initialize values
p = 1373
R = Integers(1373)
g = R(2)

# Part a, find A.
a = R(947)
A = g^a
print ( "A:", A )

# Part b, find ( c1, c2 )
b = R(716)
B = R(469)
m = R(583)
k = R(877)

c1 = g^k
c2 = m*B^k
print ( "c1 c2:", c1, c2 )

# Part c, find m
a = R(299)
A = R(34)
c1 = R(661)
c2 = R(1325)

m = c1^(-a) * c2
print ( "m:", m )

# Part d 
B = R(893)
c1 = R(693)
c2 = R(793)

# Find bob's secret exponent by trying all values in modulo p
for i in range( 1, p ):
	if ( g^i - B ) % p == 0: 
		print ( "Bob's secret exponent is", i )
		b = i
		
# decrypt m from b
m = c1^(-b) * c2 
print ( "m:", m )
