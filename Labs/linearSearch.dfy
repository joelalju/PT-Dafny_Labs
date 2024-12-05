/* 
   Exercise is from the book Program Proofs by K. Rustan M. Leino.

   Let's consider a method for finding an element in an array. To make the 
   method usable for various search applications, we'll parameterize it 
   with a predicate P and write the method to look for an array element
   that satisfies P. The type signature of the method is thus:

     method LinearSearch<T>(a : array<T>, P : T -> bool) returns (n : int)

   For example suppose you declare
     predicate method NearPi(r : real) { 3.14 <= r <= 3.15 }
   Then one can call teh method above as follows:
     var n := LinearSearch(rls, NearPi)
    
   Write a linear-search specification for a method that always returns
   a value strictly less than a.Length and uses a negative value (instead
   of a.Length) to signal that no element satisfies P. Then implement
   the method according to this specification and verify it.
*/

method LinearSearch<T>(a : array<T>, P : T -> bool) returns (n : int)
ensures ((n == -1 && forall j :: 0 <= j < a.Length ==> P(a[j]) == false) ||
         (( a.Length > n >= 0 && P(a[n]) == true) && forall j :: n < j < a.Length ==> P(a[j]) == false))
{
  var i, size, pos := 0, a.Length, -1;
  while i < size 
    invariant 0 <= i <= size
    invariant ((pos == -1 && forall j :: 0 <= j < i ==> P(a[j]) == false) ||
              (i > pos >= 0 && P(a[pos]) == true && forall j :: pos < j < i ==> P(a[j]) == false))
    decreases size - i
  {
    if(P(a[i]) == true) {
      pos := i;
    }
    i := i + 1;
  }
  return pos;
}
