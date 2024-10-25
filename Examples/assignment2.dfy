/**
 * Dafny template for Assignment 1,
 * 1DT034 Programming Theory.
 * Provide a solution using proof calculations (i.e., the calc block).
 * The proofs must adhere to the proof style
 * used in this course (see lecture notes).
 *
 * Do not forget to put a semicolon after each
 * proof step.
 *
 * An example is provided below.
 */

method Exercise1_2()
{
  // Question 1.2:
  // ((y < x) ∨ (y = x + 1)) → wp(“z := x; x := y; y := z + 2“, x < y)


  var x : int;
  var y : int;
  var z : int;

  assume{:axiom} y < x || y == x + 1;          // ((y < x) ∨ (y = x + 1))

  // wp(“z := x; x := y; y := z + 2“, x < y)
  z := x; x := y; y := z + 2; 
  assert x < y;

  //assert{:axiom} false;
}





// Question 2.2:

predicate Q(x : int, y : int) {
  (x == y + 2) || (y == x + 2) 
}

predicate R(x : int, y : int) {
    (x == y + 2) || (y == x + 2)
}

method Exercise2_2(x : int, y : int, z : int) returns (aux_x : int, aux_y: int)
  requires Q(x, y) 
  ensures  R(x, y) 
{
  if y < x{
    aux_x := x - 4;
    aux_y := y; //to make the program finite and have it pass the test, if going strictly by the assignment this line can be commented
  }
  else {
     aux_x := y + 3; 
     aux_y := y + 1;
  }
}

method Exercise2_2_proof1(x: int, y: int) {
    assert (Q(x, y) ==> (y < x) || (x < y)); //postcondition for S3
}

method Exercise2_2_proof2(x: int, y: int) {
    assume{:axiom} Q(x, y); //precondition for S2
    assume{:axiom} y < x;
    assert R(x - 4, y); //postcondition for S2
}

method Exercise2_2_proof3(x: int, y: int) {
    assume{:axiom} Q(x, y); //precondition for S3
    assume{:axiom} y < x; 
    assert R(y + 3, y + 1); //postcondition for S3
}