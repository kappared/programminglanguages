(* Dan Grossman, Coursera PL, HW2 Provided Tests *)

(* These are just two tests for problem 2; you will want more.

   Naturally these tests and your tests will use bindings defined 
   in your solution, in particular the officiate function, 
   so they will not type-check if officiate is not defined.
 *)
use "hw2provided.sml";
(*
all_except_option ("aaa", ["bbb", "aaa", "ccc", "ddd"]);
all_except_option ("aaa", ["bbb", "eee", "ccc", "ddd"]);
get_substitutions1 ([["a", "b"], ["c", "d"]], "e");
get_substitutions1 ([["a", "b"], ["c", "d"]], "a");
get_substitutions1 ([["a", "b"], ["c", "d"]], "d");
get_substitutions1 ([["a", "b"], ["c", "a"]], "a");
get_substitutions1 ([["a", "b"], ["a", "c"]], "a");

get_substitutions2 ([["a", "b"], ["c", "d"]], "e");
get_substitutions2 ([["a", "b"], ["c", "d"]], "a");
get_substitutions2 ([["a", "b"], ["c", "d"]], "d");
get_substitutions2 ([["a", "b"], ["c", "a"]], "a");
get_substitutions2 ([["a", "b"], ["a", "c"]], "a");

similar_names ([["a", "b"], ["a", "c"]], {first = "a", middle = "M", last = "L"});


fun provided_test1 () = (* correct behavior: raise IllegalMove *)
    let val cards = [(Clubs,Jack),(Spades,Num(8))]
	val moves = [Draw,Discard(Hearts,Jack)]
    in
	officiate(cards,moves,42)
    end

fun provided_test2 () = (* correct behavior: return 3 *)
    let val cards = [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)]
	val moves = [Draw,Draw,Draw,Draw,Draw]
    in
 	officiate(cards,moves,42)
    end
*)

val testG0 = (officiate ([(Clubs, Jack), (Spades, Num 8)], [Draw, Discard (Hearts, Jack)], 42) handle IllegalMove => 9999) = 9999
val testG1 = officiate ([(Clubs, Ace), (Spades, Ace), (Clubs, Ace), (Spades, Ace)], [Draw, Draw, Draw, Draw, Draw], 42) = 3
val testG2 = officiate ([(Clubs, Ace), (Spades, Ace), (Clubs, Ace), (Spades, Ace)], [Draw, Draw, Draw, Draw, Draw], 30)  = 4
val testG3 = officiate ([(Clubs, Ace), (Spades, Ace), (Clubs, Ace), (Spades, Ace)], [Draw, Draw, Draw, Draw, Draw], 22)  = 16
val testG4 = officiate ([(Clubs, Ace), (Spades, Ace), (Clubs, Ace), (Spades, Ace)], [Draw, Draw, Draw, Draw, Draw], 100) = 28
val testG5 = officiate ([(Clubs, Ace), (Spades, Ace), (Clubs, Ace), (Spades, Ace)], [Draw, Draw, Draw, Draw, Draw], 44)  = 0

val testG6 = officiate ([(Diamonds, Ace), (Spades, Ace), (Clubs, Ace), (Spades, Ace)], [Draw, Draw, Draw, Draw, Draw], 30)  = 9
val testG7 = officiate ([(Clubs, Ace), (Hearts, Ace), (Clubs, Ace), (Spades, Ace)], [Draw, Draw, Draw, Draw, Draw], 22)     = 33
val testG8 = officiate ([(Clubs, Ace), (Spades, Ace), (Diamonds, Ace), (Spades, Ace)], [Draw, Draw, Draw, Draw, Draw], 100) = 56
val testG9 = officiate ([(Clubs, Ace), (Spades, Ace), (Clubs, Ace), (Hearts, Ace)], [Draw, Draw, Draw, Draw, Draw], 44)     = 0

val testG10 = officiate ([(Clubs, Ace), (Diamonds, Ace), (Clubs, Ace), (Hearts, Ace)], [Draw, Draw], 30) = 8
val testG11 = officiate ([(Clubs, Ace), (Diamonds, Ace), (Clubs, Ace), (Hearts, Ace)], [Draw, Draw], 22) = 0
val testG12 = officiate ([(Clubs, Ace), (Diamonds, Ace), (Clubs, Ace), (Hearts, Ace)], [Draw, Draw], 11) = 33

val testG13 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Clubs, Ace), (Hearts, Ace)], [Draw, Discard (Clubs, Queen), Draw, Draw], 11) = 33
val testG14 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Clubs, Ace), (Hearts, Ace)], [Draw, Discard (Clubs, Queen), Draw, Draw], 22) = 0
val testG15 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Clubs, Ace), (Hearts, Ace)], [Draw, Discard (Clubs, Queen), Draw, Draw], 30) = 8

val testG16 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Hearts, Ace), (Diamonds, Ace)], [Draw, Discard (Clubs, Queen), Draw, Draw], 11) = 16
val testG17 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Hearts, Ace), (Diamonds, Ace)], [Draw, Discard (Clubs, Queen), Draw, Draw], 22) = 0
val testG18 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Hearts, Ace), (Diamonds, Ace)], [Draw, Discard (Clubs, Queen), Draw, Draw], 30) = 4

val testG19 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Hearts, Ace), (Diamonds, Ace)], [Draw, Draw, Discard (Clubs, Queen), Draw], 11) = 30
val testG20 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Hearts, Ace), (Diamonds, Ace)], [Draw, Draw, Discard (Clubs, Queen), Draw], 22) = 0
val testG21 = officiate ([(Clubs, Queen), (Diamonds, Ace), (Hearts, Ace), (Diamonds, Ace)], [Draw, Draw, Discard (Clubs, Queen), Draw], 30) = 4
