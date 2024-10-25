
method distributivityOfConjunction1(){
  var x, y : int;

  assume x > 0 && y > 0;          // wp(S, R) = ???

  x, y := x + 1, y + 1;

  // Q : x > 0
  // R : y > 0
  assert x > 1 && y > 1;
}


method distributivityOfConjunction2(){
  var x, y : int;

  assume x > 0 && y > 0;          // wp(S, R) = ???

  x, y := x + 1, y + 1;

  // Q : x > 0
  // R : y > 0
  assert x > 1;
  assert y > 1;
}


method ifNonDet(){
  var x : int;
  var flag : bool;

  //assume true;          // wp(S, R) = ???

  if {
  case x <= 0 => flag := false;
  case x >= 0 => flag := true;
  }

  assert flag == true || flag == false; // post-condition R
}



method ifDet(){
  var x : int;
  var flag : bool;

  assume x > 0;          // wp(S, R) = ???

  if x <= 0 {
    flag := false;
  } else if (x >= 0) {
    flag := true;
  }

  assert flag == true; // post-condition R
}


method skip() {}

method skipExample()
{
  var x : int;

  assume x > 0;  // wp(S, R) = ???

  skip();

  assert x > 0;  // post-condition R
}


predicate Q (x : int) {x > 0}
predicate R1(x : int) {x > 1}
predicate R2(x : int) {x > 2}

method sequentialCompositionExample()
{
  var x : int;

  assume Q(x);  // wp(S, R) = ???

  x := x + 1;    // S1

  //assert R1(x);  // post-condition R1 for S1
  //assume R1(x);  // pre-condition R1 for S2

  x := x + 1;    // S2

  assert x > 2;  // post-condition R2 for S2
}

// Pre-/Post-conditions using global variables
/*class Main {
  var x : int, y : int;
  method foo () 
    requires x >= 0;
    ensures  x >= 1;
    modifies this;
  {
    x := x + 1;
  }
}*/

// Pre-/Post-conditions using parameters
/*method foo (x : int) returns (x' : int)
  requires x >= 0;
  ensures  x' > x;
{
  x' := x + 1;
  // return x'; // this command is optional in this case.
}*/