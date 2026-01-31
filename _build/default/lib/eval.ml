open Ast 

module Env = Map.Make(String)

let eval_stmts env = function
  | Init v ->
      Env.add v (VInt 0) env

  | Assign (v, value) ->
      if not (Env.mem v env) then
        failwith ("Variable not initialized " ^ v);
      Env.add v value env

  | Print v -> 
      let value = 
        match Env.find_opt v env with
        | Some x -> x
        | None -> failwith ("Undefined variable: " ^ v)
      in 
      (match value with
        | VInt n -> print_endline (string_of_int n)
        | VString s -> print_endline s);
      env

  | Add (v, n) ->
      let cur = 
        match Env.find v env with
        | VInt x -> x
        | VString _ -> failwith "Cannot add to string yn, whatchu tryna do"
      in
      Env.add v (VInt (cur + n)) env

  | Sub (v, n) ->
      let cur = 
        match Env.find v env with
        | VInt x -> x
        | VString _ -> failwith "Cannot subtract from string yn, whatchu tryna do"
      in
      Env.add v (VInt(cur - n)) env

let eval_program prog =
  ignore (List.fold_left eval_stmts Env.empty prog)

