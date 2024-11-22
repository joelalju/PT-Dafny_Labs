method Main()
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
  ensures res == true || res == false
{
  if (x == 2) {
    return true;
  }
  else {
    var i := (x - 1);
    while (i > 2) 
      invariant x - 1 <= i
      decreases i
    {
      if (i%x != 0) {
        return false;
      }
      i := i - 1;
    }
    return true;
  }
}

method nextPrime(x:int) returns (r:int)
  requires x >= 2
  ensures x < r
{
  var next := x + 1;
  var check := isPrime(next);
  while (!check) 
    invariant next > x
  {
    next := next + 1;
    check := isPrime(next);
  }
  return next;
}
