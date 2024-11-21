method Main()
{
  var n, n_0, n_1 := 10,0,1;
  var fib := sequenceGenerate(n, n_0, n_1);
  var i := 0;
  while (i < fib.Length)
  {
		print fib[i];
		print " ";
    i:= i+1;
  }
	print "\n";
}

method sequenceGenerate(n:int,  n_0:int,  n_1:int) returns (sequence:array<int>)
{
  
}
