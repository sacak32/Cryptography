# Q 3.16 ( Miller Rabin )
n = 118901527
R = Integers( n )

q = ( n - 1 ) 
k = 0
while q % 2 == 0:
	q /= 2
	k += 1
print( "q: ", q, "k: ", k )

for i in range(2, 12):
	a = R(i)
	print ( a, a^q )			
