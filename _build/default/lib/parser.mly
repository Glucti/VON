%{
  open Ast
%}

%token START END INIT PRINT ADD SUB IGNORE SET END_SET
%token <string> IDENT
%token <string> STRING
%token <int> INT
%token EOF

%start program
%type <Ast.program> program

%%

program: 
  START stmts END EOF { $2 }

stmts:
  stmt stmts { $1 :: $2 }
  | { [] }
  ;

stmt:
  INIT IDENT { Init $2}
  | SET IDENT value END_SET { Assign ($2, $3) }
  | PRINT IDENT IGNORE { Print $2 }
  | ADD IDENT INT { Add ($2, $3) }
  | SUB IDENT INT { Sub ($2, $3) }
  ;

value: 
  INT { VInt $1 }
  | STRING { VString $1 };
