structure Runner : RUNNER =
struct
  infixr 4 $ 
  val op$ = fn (f, x) => f x

  val fail = fn reason => "\027[91merror:\027[0m " ^ reason ^ "\n"
  val pass = "\027[92mok\027[0m\n"

  fun run_test error_msg desc p f x =
    let
      val () = print ("test " ^ desc ^ " ... ")
      val res = Result.evaluate (Time.fromSeconds 5) f x
    in
      if p res then
        print $ pass
      else
        print $ fail $ Result.toString error_msg res
    end
end

