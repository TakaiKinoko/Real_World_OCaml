(**  a utility that reads lines from stdin and computes a frequency count of the lines. 
    At the end the 10 lines with the highest frequency counts are written out *)

(* use association list, in particular List.Assoc.find and List.Assoc.add *)

(** INVOCATION: ocamlfind ocamlc -linkpkg -package base -package stdio freq.ml -o freq.byte  *)
open Base
open Stdio

(** In_channel module func sig: 
    val fold_lines : ?fix_win_eol:bool -> t -> init:'a -> f:('a -> string -> 'a) -> 'a   
    val add : ('a, 'b) t -> ?equal:('a -> 'a -> bool) -> 'a -> 'b -> ('a, 'b) t   *)

let build_counts () =
  In_channel.fold_lines In_channel.stdin ~init:[] ~f:(fun counts line ->
    let count =
      match List.Assoc.find ~equal:String.equal counts line with
      | None -> 0
      | Some x -> x
    in
    List.Assoc.add ~equal:String.equal counts line (count + 1)
  )

let () =
  build_counts ()
  |> List.sort ~compare:(fun (_,x) (_,y) -> Int.descending x y)
  |> (fun l -> List.take l 10)
  |> List.iter ~f:(fun (line,count) -> printf "%3d: %s\n" count line)