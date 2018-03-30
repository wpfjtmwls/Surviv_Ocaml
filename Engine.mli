(* The game engine *)
module type Engine = sig 
  (* The type of the engine *)
  type eng

  (* Contains a list of past X updates *)
  type updates

  (* Updates the state *)
  val update_state : eng -> eng 

  (* returns list of updates *)
  val get_updates : eng -> updates

  (* *)

  (* Initialize engine *)
  val init_engine : unit -> eng

  (* Shutdown engine *)
  val shutdown_engine : eng -> unit 

end 

(* The game as a whole *)
module type Game = sig 
  module Eng : Engine
  module Serv : Server
  module State : State

  type t
  val init : t 
  type playerlist = string list 
  type playerloc = (string * string) list
  
  type stats = string list 
end

(* Creates a game object with a engine and server *)
module type GameMaker = 
  functor (E : Engine)
    -> functor (S : Server)
    -> Game with module Eng = E and module Serv = S and module State = Game.init