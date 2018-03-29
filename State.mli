type position = float * float

type player = {
	isBot: bool;
	pos: position;
	health: int;
	speed: float;
	angle: float; (* 0.0 - 360.0 *)
	(* sprite: Sprite; *)
}

type staticObject = {
	pos: position;
	pickable: bool;
	collidible: bool;
	(* sprite: Sprite; *)
}

type bullet = {
	pos: position;
	speed: float;
	angle: float; (* 0.0 - 360.0 *)
	(* sprite: Sprite. *)
}

Player list players;
StaticObject list staticObjects;
Bullet list bullets;
State lastState;
State lastLastState;

(* Converts State into a string that can be sent as a UDP packet. *)
val from_packet_string: string -> State

(* Converts incoming UDP packet string into a State. *)
val to_packet: State -> string

(* "Rubber-banding" update function. Updates player
 * position on client to make game feel responsive.
 * Updated based on object speeds. *)
val update: State -> State

(* Takes Player to center on (and display health etc), width and height,
 * and returns the image to display on the client. *)
val to_image: State -> Player -> int -> int -> Dom_html.imageElement