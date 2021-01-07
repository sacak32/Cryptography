# Gaussian reduction
v1 = vector([66586820, 65354729])
v2 = vector([6513996, 6393464])
while True:
	if v2.norm() < v1.norm():
		v1, v2 = v2, v1
	m = round( v1.dot_product(v2) / (v1.norm())^2 )
	print("v1: ", v1, " v2: ", v2, " m: ", m )
	if m == 0:
		break
	v2 = v2 - m*v1	
	
