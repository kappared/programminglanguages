use "hw1.sml";
(*
number_in_month ([(1989, 1, 21), (1994, 2, 14), (1, 2, 4)], 2) = 2 andalso
number_in_month ([(1989, 2, 21), (1994, 1, 14)], 2) = 1 andalso
number_in_month ([(19239, 4, 211), (1324, 42, 23)], 2) = 0 andalso
number_in_month ([(198239, 2, 2321), (1994, 2, 14)], 2) = 2;

number_in_months ([(1989, 1, 21), (1994, 3, 14), (1, 2, 4)], [2,3,5,7]) = 2;

dates_in_month ([(1989, 1, 21), (1994, 2, 14), (1, 2, 4)], 2);

dates_in_months ([(1989, 1, 21), (1994, 2, 14), (1, 2, 4)], [2]);
dates_in_months ([(1989, 1, 21), (1994, 2, 14), (1, 3, 4)], [2,3]);

get_nth (["ste", "stetw", "aolie"], 3);

number_before_reaching_sum ([1, 2, 4, 5, 6], 9);

what_month (31);
what_month (32);

month_range (30, 33);

oldest ([(1989, 2, 21), (1988, 2, 3), (2004, 3, 18)]);
better_oldest ([(1989, 2, 21), (1988, 2, 3), (2004, 3, 18)]);
*)
number_in_months_challenge ([(1989, 1, 21), (1994, 3, 14), (1, 2, 4)], [2,2,5,7]) = 1;
dates_in_months_challenge ([(12,3,4), (3,45,90), (42,53, 2424)], [2,3,3,3,4,5,5,53,4]);
