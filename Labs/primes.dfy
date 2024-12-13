method Main()
  decreases *
{
  var i:= 25;
  var prime := nextPrime(i);
  print "Next prime number after ";
  print i;
  print " is ";
  print prime;
  print "\n";
}

method isPrime(x:int) returns (res:bool)
  requires x >= 2
  ensures (res == true && forall j :: 2 <= j < x ==> x%j != 0) || (res == false && exists j :: 2 <= j < x && x%j == 0)
{
  if (x == 2) {
    return true;
  }
  else {
    var i := 2;
    while (i < x)
      invariant 2 <= i <= x
      invariant forall j :: 2 <= j < i ==> x%j != 0
      decreases x - i
    {
      if (x%i == 0) {
        return false;
      }
      i := i + 1;
    }
    return true;
  }
}

method nextPrime(x: int) returns (r: int)
  requires x >= 2
  ensures forall i :: 2 <= i < r ==> r % i != 0 
  ensures forall j :: x <= j <= r ==> r % j != 0 
  ensures r >= x
  decreases *
{
  var next := x;
  var check := isPrime(next);
  
  if (!check) {
    next := next + 1;
    check := isPrime(next);
    while (!check)
      invariant next > x
      invariant exists k :: 2 <= k < (next -1) && (next-1) % k == 0
      decreases *
    {
      check := isPrime(next);
      if (!check) {
        next := next + 1;
      }
    }
  }
  r := next;
}
