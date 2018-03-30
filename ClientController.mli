(* Main engine for the client. Contains current and some previous states.*)

State state;
State lastState; (* Old state used for interpolation. *)

string player_name; (* Should be unique. *)

(* Abstract form of input. For example, 'W' and the up arrow could both correspond to UP.
 * The int corresponds to the number of milliseconds the input has been down for. *)
type input =
	| UP 	of int
	| DOWN 	of int
	| LEFT 	of int
	| RIGHT of int
	| FIRE 	of int

(* Call send_input_start on the input *)
val on_key_down: event -> ()

(* Call send_input_end on the input *)
val on_key_up: event -> ()

(* send the server an encoding of the input that started.*)
val send_input_start: input -> ()

(* send the server an encoding of the input that ended. *)
val send_input_end: input -> ()

(* read the state data UDP packet and create a new ClientController with updated states. *)
val parse_packet: () -> ClientController