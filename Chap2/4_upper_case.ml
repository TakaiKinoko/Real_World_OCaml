(** write a function for upper casing the first element of a comma-seperated list *)
let upper_case_first line = 
    let word_list = String.split_on_char ',' line in 
    match word_list with 
    | [] -> assert false (*split should return at least one element*)
    | hd::tl -> String.uppercase_ascii hd :: tl

(** alternatively: *)
let upper_case_first2 line = 
    let (hd::tl) = String.split_on_char ',' line in
    String.concat "," ((String.uppercase_ascii hd):: tl)

let line = "artificial intelligence, machine learning, data science"
let () = 
    List.iter print_endline (upper_case_first line);
    print_endline(upper_case_first2 line)
