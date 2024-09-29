extends State

@export
var idle_state: State


func enter() -> void:
	super()
	parent.velocity.z = 0

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
