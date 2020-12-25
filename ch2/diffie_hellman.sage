# Initialize values

p = 1373
R = Integers(1373)
g = R(2)
A = R(974)
b = R(871)

# Find B
B = g^b
print ( "B:", B )

# Find secret key
S = A^b	
print ( "Secret key:", S )

# Find alice's secret exponent by trying all values in modulo p
for i in range( 1, p ):
	if ( g^i - A ) % p == 0: 
		print ( "Alice's secret exponent is", i )
       
print()
