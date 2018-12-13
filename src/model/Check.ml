
open Base

let check_current (bsp : bsp) =
  let rec aux bsp even =
    match bsp with
    | R _ -> true
    | L (lab, bsp_g, bsp_d) ->
      if((aux bsp_g (not even)) = false || aux bsp_d (not even))
        then false
      else Option.map_default (fun c -> (Bsp.color_of_line bsp_g bsp_d even) = c) true lab.color
  in aux bsp false

module LittSolver = Sat_solver.Make(String)

let check_solve (bsp : bsp) : bool =
  let fnc = FNC.bsp_to_fnc bsp in
  Option.is_some (LittSolver.solve fnc)

(* let solve (bsp : bsp) : bsp option = *)
