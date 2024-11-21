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
{

}
