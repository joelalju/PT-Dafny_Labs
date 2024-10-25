/*method max(x : int, y : int) returns (z : int)
  ensures z >= x && z >= y && (z == x || z == y);
{
  if {
    case x >= y => z := x;
    case x <= y => z := y;
  }
}
*/

/*
method regularAbs(x: int) returns (z:int)
{
  if (x >= 0) {
    z := x;
  } else if(x <= 0) {
    z := -x;
  }
}

method abs(x : int) returns (z : int)
  ensures z >= x;
{
  if {
    case x >= 0 => z := x;
    case x < 0 => z := -x;
  }
  assert z >= x;
} */


/*
method abs_fail(x : int) returns (z : int)
{
  if {
    case x > 0 => z := x;
    case x < 0 => z := -x;
  }
}
*/

/*
predicate method even(x : int) {
  x % 2 == 0
}
predicate method odd(x : int) {
  !even(x)
}
method odd_even_ex(){
  var x : int, y : int;

  assume(odd(x) || x-3 > y);

  if {
    case odd(x)  => x := y + 2;
    case even(x) => x := x - 3;
  }
  
  assert(x > y);
}

method Main() {
  var a := new int[4];
  var b := new int[4];
  a[0],a[1],a[2],a[3] := -3, 42, -42, 0;

  var i:=0;
  while(i < a.Length)
    invariant 0 <= i <= a.Length
    invariant forall j :: 0 <= j < i ==> a[j] <= b[j];
  {
    b[i] := abs(a[i]);
    print "abs(",a[i], ") = ", b[i], "\n";
    i := i + 1;
  }
  assert forall j :: 0 <= j < a.Length ==> a[j] <= b[j];
}
*/

predicate Q(x : int, y : int, z: int) {
  x <= y && x <= z
}

predicate R(x : int, y : int, z: int, w: int) {
  (w == x || w == y || w == z) &&
  (x <= w && y <= w && z <= w)
}

method s15_ex(x : int, y : int, z : int) returns (w : int)
  requires Q(x, y, z)
  ensures  R(x, y, z, w)
{
  if {
    case y <= z => w := z;
    case z <= y => w := y; 
  }
}

method s15_ex_proof_goal1(x : int, y : int, z : int) returns (w : int)
{
  assert (Q(x, y, z) ==> y <= z || z <= y);
}
method s15_ex_proof_goal2(x : int, y : int, z : int) returns (w : int)
{
  assume Q(x, y, z) && y <= z;
  w := z;
  assert R(x, y, z, w);
}
method s15_ex_proof_goal3(x : int, y : int, z : int) returns (w : int)
{
  assume Q(x, y, z) && z <= y;
  w := y;
  assert R(x, y, z, w);
}