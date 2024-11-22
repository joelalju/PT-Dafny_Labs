method Main()
{
  var a := new int[6];
  a[0],a[1],a[2],a[3],a[4],a[5] := 1,2,2,3,3,3;
  var plateau1_2 := checkPlateau(a,1,2);
  var plateau2_5 := checkPlateau(a,2,5);

  print "a[1 .. 2] : ";
  print plateau1_2;
  print "\na[2 .. 5]: ";
  print plateau2_5;
}


method checkPlateau(a:array<int>, l:int, u:int) returns (b:bool)
  requires 0 <= l < u < a.Length
  ensures (b == true && forall j :: l <= j < u ==> a[j] == a[j+1]) || (b == false && exists j :: l <= j < u && a[j] != a[j+1])
{
  var validate, i := true, l;
  while (i < u)
    invariant l <= i <= u
    invariant validate ==> forall j :: l <= j < i ==> a[j] == a[j + 1]
    invariant !validate ==> exists j :: l <= j < i && a[j] != a[j + 1]
    decreases u - i
  {
    if  a[i] != a[i + 1] {
      validate := false;
    }
    i := i + 1;
  }
  return validate;
}
