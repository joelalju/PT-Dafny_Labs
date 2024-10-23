method ex1(){
  var x : int;

  assume x >= 0;    // wp(S, R) = ???
  x := x + 1;    // a statement S
  assert x >= 1; // post-condition R
}


method ex2(){
  var x : int;

  assume x >= 3;    // wp(S, R) = ???
  x := x + 5;    // a statement S
  assert x >= 8; // post-condition R
}



method ex3(){
  var x : int;
  var y : int;

  assume x + 10 > y;   // wp(S, R) = ???
  x := x + 10;  // a statement S
  assert x > y; // post-condition R
}



method ex4(){
  var x : int;
  var flag : bool;

  assume x > 0;    // wp(S, R) = ???

  // a statement S
  if (x <= 0) {
    flag := false;
  } else {
    flag := true;
  }

  assert flag == true; // post-condition R
}



method ex5(){
  var x : int;
  var flag : bool;

  assume x >= 0;    // wp(S, R) = ???

  // a statement S
  while (x != 0) {
    x := x - 1;
  }

  assert x == 0; // post-condition R
}



method ex6(){
  var x : int, y: int, z: int;

  assume x < y;    // wp(S, R) = ???

  // a statement S
  if (x < y) {
    x := z - 1;
  } else {
    x := z + 1;
  }

//  assert x > z;  // post-condition R
  assert x < z;  // post-condition R
//  assert x == z; // post-condition R
//  assert x != z; // post-condition R
}



method ex7() {
  var x : int;

  assume x >= 0;

  while x != 0 {
    x := x - 1;
  }

  assert x == 0;

}
