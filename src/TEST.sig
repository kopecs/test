signature TEST =
sig
  val expect : ('out -> string) -> string -> ('in -> 'out) -> 'in -> ('out -> bool) -> unit
  val expect_list : ('out -> string) -> (('in -> 'out) * 'in * ('out -> bool)) list -> unit

  val expect_eq : (''out -> string) -> string -> ('in -> ''out) -> 'in -> ''out -> unit
  val expect_list_eq : (''out -> string) -> (('in -> ''out) * 'in * ''out) list -> unit

  val raises : ('out -> string) -> string -> ('in -> 'out) -> 'in -> (exn -> bool) -> unit
end

