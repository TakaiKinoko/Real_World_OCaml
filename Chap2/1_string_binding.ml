(** invocation:  
    $ ocamlbuild 1_string_binding.byte 
    $ ./1_string_binding.byte  *)

(** function signature: 
    val concat : string -> string list -> string 
    val split_on_char : char -> string -> string list 
     *)
     
let languages = "Ocaml, Scala, Java, C, Python"

let dashed_languages l = 
    String.concat "-" (String.split_on_char ',' l)

let () = print_string (dashed_languages languages);