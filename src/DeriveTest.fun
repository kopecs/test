functor DeriveTest (Test : RUNNER) : TEST =
struct
  infixr 4 $
  fun f $ x = f x

  fun expect toString desc f x p =
    Test.run_test
      (fn x => "expected predicate to return true; output was " ^ toString x)
      desc
      (fn Result.Value v => p v | _ => false)
      f
      x

  fun snd (_, x) = x

  (* expanded to avoid value restriction *)
  fun enumerate xs =
    snd $ List.foldr (fn (x, (i, ys)) => (i + 1, (i, x)::ys)) (0, []) xs

  fun expect_list toString tests =
  let
    val tester = fn (n, (f, x, p)) => expect toString (Int.toString n) f x p
  in 
    app tester $ enumerate tests
  end


  fun expect_eq toString desc f x v = expect toString desc f x (fn y => y = v)

  fun expect_list_eq toString tests =
    expect_list toString $ map (fn (f, x, v) => (f, x, (fn y => y = v))) tests

  fun raises toString desc f x p =
    Test.run_test
      (fn x => "expected an exception to be raised, \
               \but evaluated to " ^ toString x)
      desc
      (fn Result.Raise e => p e | _ => false)
      f
      x
end

