# Q 2.17
print( "Q 2.17" )

# Initialization 
p = 3571
R = Integers( p )
g = R(650)
h = R(2213)

N = p - 1
n = int(1 + sqrt(N))
print ( "n:", n )
print()

# Fill the lists
val = R(1)
list1 = []
for i in range(n+1):
	list1.append(val)
	val = val * g	
print( list1 )
print ()

val = h
list2 = []
for i in range(n+1):
	list2.append(val)
	val = val * g^(-n)
print( list2 )
print ()

# Find a match in lists
for i in list1:
	for j in list2:
		if i == j:
			print ( i, "is in both lists. i:", list1.index(i), "j:", list2.index(j), "==> x:", list1.index(i) + list2.index(j)*n )
			break
