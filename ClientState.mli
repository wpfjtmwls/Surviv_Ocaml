Module State = sig
	
	type position = float * float

	Module Sprite = sig
		(* image, width, height, radius *)
	end

	Module Player = sig
		position pos
		int health
		float speed
		float angle (* 0.0 - 360.0 *)
		int score

		(* Sprite sprite *)
	end

	Module StaticObject = sig
		position pos
		bool pickable
		bool collidible
	end

	Module Bullet = sig
		position pos
		float speed
		float angle (* 0.0 - 360.0 *)
	end

	Player curPlayer
	Player list players
	StaticObject list staticObjects
	Bullet list bullets



	val init -> Js.t -> ClientState


	(* called every half second from server, corrects offsets *)
	val updateFromServer -> Js.t -> ClientState

	(* called 60 times a second. Makes prediction. *)
	val update 

end