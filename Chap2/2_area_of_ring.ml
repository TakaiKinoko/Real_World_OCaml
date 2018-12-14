let area_of_ring inner_r outer_r = 
    let area r = 
        let pi = acos(-1.) in
        pi *. r *. r
    in 
    area outer_r -. area inner_r 

let () = print_string (string_of_float (area_of_ring 1. 3.));