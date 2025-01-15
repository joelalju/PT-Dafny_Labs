method Main()
{
  var a := new int[9];
  a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8] := 3,1,7,5,8,3,2,-1,34;
  var i := 0;
  print "Starting array:\n";
  while( i < a.Length)
  {
    print a[i];
    print " ";
    i := i + 1;
  }
  print "\n";

  selectionSort(a);

  print "Selection sort gives: \n";
  i:=0;
  while( i < a.Length)
  {
    print a[i];
    print " ";
    i := i + 1;
  }
  print "\n";
}

method selectionSort(a:array<int>)
modifies a
ensures forall i, j :: 0 <= i <= j < a.Length ==> a[i] <= a[j] 
ensures multiset(a[..]) == old(multiset(a[..]))
{
  var i, size := 0, a.Length;
  if size >= 2 {
    while i < size 
      invariant 0 <= i <= size
      invariant forall k, l :: 0 <= k <= l < i ==> a[k] <= a[l]
      invariant multiset(a[..]) == old(multiset(a[..])) 
      decreases size - i
    {
      var j, min := i + 1, i;
      while j < size
        invariant 0 <= i < size
        invariant i <= min < j <= size
        invariant forall k :: i <= k < j ==> a[min] <= a[k]
        invariant multiset(a[..]) == old(multiset(a[..]))  
        decreases size - j
      {
        if a[min] > a[j] {
          min := j;
        }
        j := j + 1;
      }
      var temp := a[i];
      a[i] := a[min];
      a[min] := temp;
      i := i + 1;
    }
  }
}