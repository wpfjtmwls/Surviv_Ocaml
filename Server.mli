(* Contains functions for the game server *)
module type GameServer = sig 
  type server 
  (* To and from the server *)
  type outqueue 
  type inqueue

  (* Init functions *)
  val start : server -> unit
  
  val shutdown : server -> unit 

  (* Process functions *)
  val processInp : server -> server 

  val processOutP : server -> server 
end