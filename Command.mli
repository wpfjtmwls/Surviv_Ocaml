(* Directions for player to go *)
type move = 
  | WALK of string
  | SPRINT of string
  | TURN of int

(* Player action *)
type action = 
  | GRAB of string
  | DROP of string
  | USE
  | RELOAD

(* Defining a command for the player to use *)
type cmd = 
  | NOOP
  | JOIN
  | LEAVE
  | GO of move 
  | FIRE of string
  | DO of action
  | EMPTY


module type request = sig 
  type clientID = string 
  type clientIP = string
  type t = cmd
  
  val empty : t
  (* Helper *)
  val get_clientid : cmd -> string 

  val format : cmd -> unit 

end