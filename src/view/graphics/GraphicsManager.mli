
open Graphics
open Base

val init : config -> SLAC.scene -> unit
val close : unit -> unit
val run : unit -> unit

val changeConfig : config -> unit