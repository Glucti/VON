
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SUB
    | STRING of (
# 7 "lib/parser.mly"
       (string)
# 16 "lib/parser.ml"
  )
    | START
    | SET
    | PRINT
    | INT of (
# 8 "lib/parser.mly"
       (int)
# 24 "lib/parser.ml"
  )
    | INIT
    | IGNORE
    | IDENT of (
# 6 "lib/parser.mly"
       (string)
# 31 "lib/parser.ml"
  )
    | EOF
    | END_SET
    | END
    | ADD
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Ast

# 46 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState01 : ('s, _menhir_box_program) _menhir_state
    (** State 01.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState22 : (('s, _menhir_box_program) _menhir_cell1_stmt, _menhir_box_program) _menhir_state
    (** State 22.
        Stack shape : stmt.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (Ast.stmt)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 6 "lib/parser.mly"
       (string)
# 67 "lib/parser.ml"
)

and ('s, 'r) _menhir_cell1_SET = 
  | MenhirCell1_SET of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (Ast.program) [@@unboxed]

let _menhir_action_01 =
  fun _2 ->
    (
# 17 "lib/parser.mly"
                      ( _2 )
# 81 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_02 =
  fun _2 ->
    (
# 25 "lib/parser.mly"
             ( Init _2)
# 89 "lib/parser.ml"
     : (Ast.stmt))

let _menhir_action_03 =
  fun _2 _3 ->
    (
# 26 "lib/parser.mly"
                            ( Assign (_2, _3) )
# 97 "lib/parser.ml"
     : (Ast.stmt))

let _menhir_action_04 =
  fun _2 ->
    (
# 27 "lib/parser.mly"
                       ( Print _2 )
# 105 "lib/parser.ml"
     : (Ast.stmt))

let _menhir_action_05 =
  fun _2 _3 ->
    (
# 28 "lib/parser.mly"
                  ( Add (_2, _3) )
# 113 "lib/parser.ml"
     : (Ast.stmt))

let _menhir_action_06 =
  fun _2 _3 ->
    (
# 29 "lib/parser.mly"
                  ( Sub (_2, _3) )
# 121 "lib/parser.ml"
     : (Ast.stmt))

let _menhir_action_07 =
  fun _1 _2 ->
    (
# 20 "lib/parser.mly"
             ( _1 :: _2 )
# 129 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_08 =
  fun () ->
    (
# 21 "lib/parser.mly"
    ( [] )
# 137 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_09 =
  fun _1 ->
    (
# 33 "lib/parser.mly"
      ( VInt _1 )
# 145 "lib/parser.ml"
     : (Ast.value))

let _menhir_action_10 =
  fun _1 ->
    (
# 34 "lib/parser.mly"
           ( VString _1 )
# 153 "lib/parser.ml"
     : (Ast.value))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ADD ->
        "ADD"
    | END ->
        "END"
    | END_SET ->
        "END_SET"
    | EOF ->
        "EOF"
    | IDENT _ ->
        "IDENT"
    | IGNORE ->
        "IGNORE"
    | INIT ->
        "INIT"
    | INT _ ->
        "INT"
    | PRINT ->
        "PRINT"
    | SET ->
        "SET"
    | START ->
        "START"
    | STRING _ ->
        "STRING"
    | SUB ->
        "SUB"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let _2 = _v in
          let _v = _menhir_action_01 _2 in
          MenhirBox_program _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_stmt -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_07 _1 _2 in
      _menhir_goto_stmts _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_stmts : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState01 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  let rec _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_2, _3) = (_v, _v_0) in
              let _v = _menhir_action_06 _2 _3 in
              _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SUB ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | SET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | PRINT ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | INIT ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | ADD ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | END ->
          let _v_0 = _menhir_action_08 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_10 _1 in
              _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_09 _1 in
              _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_value : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_SET _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | END_SET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_SET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_03 _2 _3 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IGNORE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _2 = _v in
              let _v = _menhir_action_04 _2 in
              _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _2 = _v in
          let _v = _menhir_action_02 _2 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_2, _3) = (_v, _v_0) in
              let _v = _menhir_action_05 _2 _3 in
              _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | START ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SUB ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | SET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | PRINT ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | INIT ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | ADD ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | END ->
              let _v = _menhir_action_08 () in
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
