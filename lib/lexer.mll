{
  open parser
}

let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z' '_']
let intlit = '-'? digit+
let id = alpha (alpha|digit|'_')*
let whitespace = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule token = parse 
  | whitespace { token lexbuf }
  | newline { token lexbuf }

  | "Von, Von Huh? What?" { START }
  | "He don't want no smoke, boy, he not bulletproof" { END }

  | "Just got some top, from this stripper bitch, she from" { INIT }
  
  | "Told that bitch" { PRINT }
  | "cuz she lookin' confused" { IGNORE }

  | "VON" { ADD }
  | "HUH?" { SUB }

  | ident as id { IDENT id }
  | number as n { INT (int_of_string n)}

  | eof { EOF }

  | _ as c {
    failwith ("Unexpected char: " ^ String.make 1 c)
  }



