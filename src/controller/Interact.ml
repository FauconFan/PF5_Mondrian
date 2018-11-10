
open Base
open Graphics

(**
  Table rassemblant l'ensemble des couleur / caractère correspondant
*)
let table_of_color = [('r', Some(red)); ('b', Some(blue)); ('n', None)]

(**
  Current drawing color
*)
let actual_color = ref None


(**
   Change la couleur en cours et la renvoie
*)
let changeColor c =
  let col = maybe (snd) (List.find_opt (fun (ch, _) -> c = ch) table_of_color) None in
  maybe2 (set_color) col (set_color) white; actual_color := col

(**
   Fonction d'interaction avec l'utilisateur :
   - 'q' pour quitter le jeu
   - 'r'/ 'b' pour mettre en couleur
   - 'n' pour enlever la couleur
*)
let rec interact () : coords * color option =
  let even = wait_next_event([Key_pressed; Button_down])
  in
  if even.keypressed then
    (match even.key with
     | 'q' -> raise Exit
     | k -> changeColor k);
  if even.button then
    let mouse = (even.mouse_x, even.mouse_y)
    and screen = (size_x (), size_y ()) in
    if bounds mouse screen
    then (mouse, ! actual_color)
    else interact ()
  else interact ()