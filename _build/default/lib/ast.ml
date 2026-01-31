
type value = 
  | VInt of int
  | VString of string

type stmt = 
  | Init of string
  | Assign of string * value
  | Print of string
  | Add of string * int
  | Sub of string * int

type program = stmt list
