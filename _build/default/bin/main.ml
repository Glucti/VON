open TheO

let parse_file filename =
  let c = open_in filename in
  let lexbuf = Lexing.from_channel c in
  try
    let prog = Parser.program Lexer.token lexbuf
    in
    close_in c;
    prog 
  with e -> 
    close_in c;
    raise e


let () = 
  if Array.length Sys.argv < 2 then (
    Printf.eprintf "Usage: von <file>\n";
    exit 1;
  );

  let prog = parse_file Sys.argv.(1) in 
  Eval.eval_program prog

