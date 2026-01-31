{
  open Parser
}

let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z' '_']
let intlit = '-'? digit+
let ident = alpha (alpha|digit|'_')*
let whitespace = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"
let stringlit = '"' [^ '"' '\n' '\r']* '"'


rule token = parse 
  | whitespace { token lexbuf }
  | newline { token lexbuf }

  | "Von, Von Huh? What?" { START }
  | "He don't want no smoke boy he not bulletproof" { END }

  | "Just got some top, from this stripper bitch, she from" { INIT }
  | "Now I'm like" { SET }
  | "I hopped out so quick, then I raised my blick" { END_SET }
  
  | "Told that bitch" { PRINT }
  | "cuz she lookin' confused" { IGNORE }

  | "VON" { ADD }
  | "HUH?" { SUB }

  | stringlit as s {
    let len = String.length s in 
    STRING (String.sub s 1 (len - 2))
  }
  | ident as id { IDENT id }
  | intlit as n { INT (int_of_string n)}

  | eof { EOF }

  | _ as c {
    failwith ("Unexpected char: " ^ String.make 1 c)
  }



