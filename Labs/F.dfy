// This exercise is from the book Program Proofs by K. Rustan M. Leino.
// Find a decreases clause that provides the termination of the following function.
// Hint: You'll need a lexicographic pair and you'll need to be creative with the form
// of the two expressions. 
// Dafny accepts bound functions in the form of lexicographic tuples:
// "decreases f1, f2, f3"
// "decreases (x + 1), (if ... then ... else ...)"
// Tuples are compared elementwise (which must have the same type), 
// and earlier elements of a tuple have higher priority. 
// Some examples:
// "(1, 2) > (1, 3)", "(1, 2) > (0, 1000)", "(true, 42) > (false, 42)"

function F(x : nat, y : nat) : int
decreases (if (x % 2 != 0) then x else 0), (if (x % 2 == 0 && x <= 1000) then 1000 - x else 0) 
{
  if 1000 <= x then
    x + y
  else if x % 2 == 0 then
    F(x + 2, y + 1)
  else if x < 6 then
    F(2 * y, y)
  else
    F(x - 4, y + 3)
}
