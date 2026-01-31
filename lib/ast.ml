type stmt = 
  | Init of string
  | Print of string
  | Add of string * int
  | Sub of string * int

type program = stmt list
