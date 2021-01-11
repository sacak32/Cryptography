# Gaussian reduction
v1 = vector([1, 39245579300])
v2 = vector([0, 122430513841])
while True:
	if v2.norm() < v1.norm():
		v1, v2 = v2, v1
	m = round( v1.dot_product(v2) / (v1.norm())^2 )
	print("v1: ", v1, " v2: ", v2, " m: ", m )
	if m == 0:
		break
	v2 = v2 - m*v1	
	
