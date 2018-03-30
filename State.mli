(* MOVE THIS STUFF TO IMPLEMENTATION

type collisionShape =
	| Box of (position * position) (* top_left, bottom_right *)
	| Circle of (position * int)   (* origin, radius *)

type player = {
	isBot: bool;
	pos: position;
	health: int;
	speed: float;
	angle: float; (* 0.0 - 360.0 *)
	sprite: Sprite;
}

type staticObject = {
	pos: position;
	pickable: bool;
	collidible: bool;
	sprite: Sprite;
}

type bullet = {
	pos: position;
	speed: float;
	angle: float; (* 0.0 - 360.0 *)
	sprite: Sprite;
}

Player list players;
StaticObject list staticObjects;
Bullet list bullets;
*)

type weapon =
	| Pistol 		(* single shot *)
	| Shotgun 		(* short range, sprays like five bullets *)
	| BurstRifle 	(* three round burst, slightly different angles, 
					time delay between each one *)
	| Sniper 		(* single shot, draws red laser line from player
					to the first collision, long range *)

type position = float * float

(* [get_weapon_list st player_name] returns the list of
 * weapons that player can cycle through. *)
val get_weapon_list: State -> string -> weapon list

(* [get_cur_weapon st player_name] returns the current
 * item that player is using. *)
val get_cur_weapon: State -> string -> weapon

(* [get_ammo st player_name weapon] returns the ammo count that the
 * player *)
val get_ammo: State -> string -> weapon -> int option

(* [is_alive st player_name] is true iff the player is alive. *)
val is_alive: State -> string -> bool

(* [num_players st] is the number of live players in state. *)
val num_players: State -> int

(* [tick st ms] is the new state after ms milliseconds have passed.
 * Both clients and server frequently run tick to calculate the next
 * positions of objects, etc. The client's ticked state will get
 * clobbered by the next UDP packet, but if latency is small, the change
 * will be minor. *)
val tick: State -> int -> State

(* [update st ms update] is the new state after ms milliseconds
 * have passed and the StateUpdate has taken effect. *)
val update: State -> int -> StateUpdate -> State

(* used to convert state to UDP packet *)
val to_string: State -> string

(* used to convert UDP packet to state *)
val to_state: string -> State