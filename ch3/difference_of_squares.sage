N = 1001
p = 23

n = int(1 + sqrt(N))
for i in range(N):
	a = ( n * n ) % N
	f = factor(a)
	l = list(f)
    
	if l[-1][0] <= p:
		print( "n: ", n, " = ", f )
        
	n += 1
	
