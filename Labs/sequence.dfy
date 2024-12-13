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
requires n >= 2
ensures sequence.Length == n
ensures sequence[0] == n_0 && sequence[1] == n_1
ensures n == 2 || forall j :: 2 <= j < n ==> sequence[j] == sequence[j - 1] + sequence[j - 2]
{
  var sequence_aux, i := new int[n], 2;
  sequence_aux[0] := n_0;
  sequence_aux[1] := n_1;

  if (n == 2) {
    return sequence_aux;
  }
  else {
    while (i < n)
      invariant 2 <= i <= n
      invariant sequence_aux.Length == n
      invariant sequence_aux[0] == n_0 && sequence_aux[1] == n_1
      invariant forall j :: 2 <= j < i ==> sequence_aux[j] == sequence_aux[j - 1] + sequence_aux[j - 2]
      decreases (n - i)
    {
      sequence_aux[i] := sequence_aux[i - 1] + sequence_aux[i - 2];
      i := i + 1;
    }

    return sequence_aux;
  }
}
