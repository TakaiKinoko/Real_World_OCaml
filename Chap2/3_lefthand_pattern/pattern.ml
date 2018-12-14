(** function sig: 
    val unzip : ('a * 'b) t ‑> 'a t * 'b t   *)
let ((ints:int list), (strings:string list)) = 
    Base.List.unzip [(1, "one"); (2, "two"); (3, "three")]

let () = 
    print_endline(string_of_int (List.fold_left (fun x y -> x + y) 0 ints)) ;
    List.iter print_endline strings;