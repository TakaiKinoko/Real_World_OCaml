(** anonymous functions can be stuffed in data structures *)

(** a list of anonymous functions *)
let incr_list = [(fun x -> x + 1); (fun x -> x + 2)]

(** (fun f -> f 5) takes as param a function f, apply it to 5 *)
let new_list = List.map (fun f -> f 5) incr_list

let () = 
    print_endline(String.concat " " (List.map string_of_int new_list));