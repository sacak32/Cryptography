SCIPERS: 313202, 313192, 333972, 297168, 301569


# Solution:

### Problem 1: Introduction to Concurrency
#### Question 1
Yes.
#### Question 2
The first property does not hold anymore. If multiple `transfer` methods are called concurrently (suppose n times), then the amount of money that can be exchanged is `n * amount` although there is no guarantee that the balance of `from` has more than this amount.
The second property holds.


#### Question 3
##### Variant 1
This variant does not solve the problem. In fact, when running multiple threads concurrently, the value `balanceFrom` will be the same for each of them, thus can lead to a balance < 0.
In any case, it isn't vulnerable to deadlocks: one thread at a time will have access to `from` and to `to`.

##### Variant 2
This variant solves the previous problem of having a potential negative balance but yields a vulnerability to deadlocks. In fact, suppose two threads are running in parallel:
 - [Thread 1]: transfer(from, to, amount)
 - [Thread 2]: transfer(to, from, amount)
`from` and `to` will both be synchronized at the same time, blocking the execution of both threads.

##### Variant 3
This variant is the same as executing everything sequentially.

### Problem 2
#### Question 1
##### Sequential
```
def minMax1(a: Array[Int]): (Int, Int) = {
    a.foldLeft((a(0), a(0))) { case ((min, max), e) => (math.min(min, e), math.max(max, e))}
}
```

##### Parallel
```
def minMax(a: Array[Int]): (Int, Int) = {
    val maxDepth = 5; // arbitrary

    def traverse(a: Array[Int], start: Int, end: Int): (Int, Int) = {
      var i = start;
      var min = Int.MaxValue;
      var max = Int.MinValue;

      while ( i <= end )
      {
        min = math.min(a(i), min)
        max = math.max(a(i), max)
        i = i + 1
      }
      return (min, max)
    }
      
    def reduce(a: Array[Int], start: Int, end: Int, depth: Int): (Int, Int) = {
      if (depth >= maxDepth) 
        return traverse(a, start, end);

      val mid = start + (end - start) / 2;
      val (left, right) = parallel(
        reduce(a, 0, mid, depth + 1), 
        reduce(a, mid, end, depth + 1))

      return (math.min(left._1, right._1), math.max(left._2, right._2));
    }

    return reduce(a, 0, a.length - 1, 0);
  }
```

#### Question 2
```
def minMax(a: ParSeq[A]): (A, A) = {
    return parallel(
      a.reduce((x: A, y: A) => { if (x > y) { y } else x } ),
      a.reduce((x: A, y: A) => { if (x < y) { y } else x } )
    )
  }
```

#### Question 3
Associativity: `f(f(x, y), z) = f(x, f(y, z))`
```
(X > Y) > Z
 = (X > Y > Z)
 = X > (Y > Z)
```

same applies for `< `

