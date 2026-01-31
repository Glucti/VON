
(* The type of tokens. *)

type token = 
  | SUB
  | STRING of (string)
  | START
  | SET
  | PRINT
  | INT of (int)
  | INIT
  | IGNORE
  | IDENT of (string)
  | EOF
  | END_SET
  | END
  | ADD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
