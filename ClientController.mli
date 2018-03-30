(* Main engine for the client. Contains current and some previous states. Contains*)

State state;

(* Old state used for interpolation. *)
State lastState;

(* TODO: change this *)
val onKeyDown: KEY -> ()
val onKeyUp: Key -> ()