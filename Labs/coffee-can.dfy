/*
  =============================================================================
  Coffee can problem
  -----------------------------------------------------------------------------
  We have a can of beans, black and white. Take two beans and if they are
  of the
    1. same colour, throw them both away and put a black bean in the can.
    2. different colour, throw away the black bean and put the white bean 
       back in the can.

  Question : What is the colour of the final bean based on the number of 
             white beans and black beans initially in the can ?
  =============================================================================
 */

/* We use datatypes for beans. A bean can be either black or white. 
 */
datatype Bean = BlackBean | WhiteBean

/*
   Dafny does not seem to automatically infer that a bean can only be black or
   white in a multiset of beans.
*/
lemma allBeansAreWhiteOrBlack() ensures
  forall can : multiset<Bean>, bean : Bean :: bean in can ==> (bean.WhiteBean? || bean.BlackBean?)
{
}

predicate isEven(x : int) {
  x % 2 == 0
}

method puzzle(inCan : multiset<Bean>) returns (outCan : multiset<Bean>)
  // coffee can must have at least 2 beans to begin with
  requires |inCan| >= 2
  // it will (randomly) remove beans until only 1 bean is left
  ensures |outCan| == 1
  // write down and prove the relation between the pre- and post-condition
  // in terms of the (starting and remaining) number of white and black beans in the can
  ensures isEven(inCan[WhiteBean])  ==> outCan[BlackBean] == 1
  ensures !isEven(inCan[WhiteBean]) ==> outCan[WhiteBean] == 1
{
  // Use this lemma for proofs inside this method
  allBeansAreWhiteOrBlack();
  // Program starts below:
  
  // TODO //
}