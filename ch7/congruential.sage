# 7.1
q = 148059109201
f = 233444
g = 255333

# part a
h = ( inverse_mod( f, q ) * g ) % q
print( "h:", h )

# part b 
e = 619168806

a = ( f * e ) % q
b = ( inverse_mod(f,g)* a ) % g 
print( "a:", a, "b(plain-text):", b )

# part c
m = 10220
r = 19564
e = ( r*h + m ) % q
print( "e:", e )

# Extra, find f, g from q and h with gaussian reduction
q = 122430513841
h = 39245579300

# Gaussian reduction is applied to vectors v1 and v2, reduced v1 is returned
def gaussian_reduction( v1, v2 ):
    while True:
        if v2.norm() < v1.norm():
            v1, v2 = v2, v1
        m = round( v1.dot_product(v2) / (v1.norm())^2 )
        print("v1: ", v1, " v2: ", v2, " m: ", m )
        if m == 0:
            break
        v2 = v2 - m*v1	
    return v1

# Apply gaussian reduction
v1 = vector([1, h])
v2 = vector([0, q])

v = gaussian_reduction( v1, v2 )
f, q = abs(v[0]), abs(v[1])
print( "f:", f, "q:", q )

