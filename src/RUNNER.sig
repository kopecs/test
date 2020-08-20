signature RUNNER =
sig
  val run_test : ('out -> string) -> string -> ('out Result.result -> bool) -> ('in -> 'out) -> 'in -> unit
end

