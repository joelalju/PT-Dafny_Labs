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
{

}
