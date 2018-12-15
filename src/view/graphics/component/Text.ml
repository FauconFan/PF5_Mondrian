open Graphics
open GMessage
open Base

class text content coord =
  object (self)
    inherit SLAC.acomponent coord (0, 0) as super (* No hitbox *)

    method getLines () : (coords * coords * color * int) list =
      []

    method getRects () : (coords * dim * color) list =
      []

    method subClick c =
      Nothing

    method getStrings () =
      let padding = 10 in
      let coord = (padding, padding) in
      let cont = construct_string_content coord 30 content in
      [cont]
  end
