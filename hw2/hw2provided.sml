(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)

fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option (_, []) = NONE
  | all_except_option (str, x :: xs) = 
        if same_string (str, x)
	then SOME (xs)
	else case all_except_option (str, xs) of
		  NONE => NONE
		| SOME y  => SOME (x :: y)

fun get_substitutions1 ([], _) = []
  | get_substitutions1 (sub :: subs, str) = 
    case all_except_option (str, sub) of
	 NONE => get_substitutions1 (subs, str)
       | SOME y => y @ get_substitutions1 (subs, str)

fun get_substitutions2 (subs, str) = 
    let fun helper ([], acc) = acc
	  | helper (sub :: subs, acc) = 
		   case all_except_option (str, sub) of
		        NONE => helper (subs, acc)
		      | SOME y => helper (subs, acc @ y)
    in
	helper (subs, [])
    end

fun similar_names (subs, {first, middle, last}) = 
    let fun iter ([], acc) = acc
	  | iter (x :: xs, acc) = 
	    iter (xs, {first = x, middle = middle, last = last} :: acc)
    in
	iter (first :: get_substitutions2 (subs, first), [])
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
fun card_color (Clubs, _)    = Black
  | card_color (Spades, _)   = Black
  | card_color (Hearts, _)   = Red
  | card_color (Diamonds, _) = Red

fun card_value (_, Ace)   = 11
  | card_value (_, Num n) = n
  | card_value (_, _)     = 10

fun remove_card ([], c, e) = raise e
  | remove_card (x :: xs, c, e) = 
    if x = c
    then xs
    else x :: remove_card (xs, c, e)

fun all_same_color (cs) = 
    case cs of
	[] => true
     |  _ :: [] => true
     |  head :: (neck :: rest) => card_color head = card_color neck andalso all_same_color (neck :: rest)

fun sum_cards (cs) = 
    let fun iter ([], acc) = acc
	  | iter (x :: xs, acc) = iter (xs, acc + card_value x)
    in
	iter(cs, 0)
    end

fun score (cs, g) = 
    let
	val sum = sum_cards cs
	val pre = if sum > g then 3 * (sum - g) else g - sum
    in
	if all_same_color cs then pre div 2 else pre
    end

fun officiate (cs, ms, g) = 
    let
	fun play (_, [], held) = score (held, g)
	  | play ([], Draw :: _, held) = score (held, g)
	  | play (c :: cs, Draw :: ms, held) = 
	    if sum_cards (c :: held) > g
	    then score (c :: held, g)
	    else play (cs, ms, c :: held)
	  | play (cs, Discard d :: ms, held) = 
	    play (cs, ms, remove_card (held, d, IllegalMove))
    in
	play (cs, ms, [])
    end
