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

method Example(p: bool, q: bool)
{
  // This is an example, your solutions should
  // use the same proof style.
  // Show the following:
  // p ==> (q ==> (p && q));

  // Proof 1:
  // We will assume the LHS of the implication,
  // and prove that the RHS holds under this assignment.
  {
    assume p; // Assumption 1

    // show q ==> (p && q)

    calc {
      q ==> (p && q);
      == // { Implication }
      !q || (p && q);
      == // { Assumption 1: "p" }
      !q || (true && q);
      == // { And simplification }
      !q || q;
      == // { Excluded middle }
      true;
    }

    // It is a good idea to check at the end
    // by inserting an "assert false" statement
    // and verifying that it fails, in order
    // to see if we introduced any contradictions.
    // Uncomment below statement and make sure it fails.

     //assert false;
  }
}

method Exercise1(p: bool, q: bool)
{
  calc {
    (p == q);
      == // { TODO: fill in the proof }
    (!p == !q);
  }
}

// Model and solve Exercises 2, 3 & 4 in a similar way.
// You can introduce methods/predicates/functions if needed.