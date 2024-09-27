extends State

@export
var fall_state: State
@export
var jump_state: State
@export
var move_state: State
@export
var sprint_state: State

func enter() -> void:
	super()
	parent.velocity.z = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed('jump') and parent.is_on_floor():
		return jump_state
	if (Input.is_action_pressed('left') or Input.is_action_pressed('right')) and !Input.is_action_pressed("sprint"):
		return move_state
	if (Input.is_action_pressed('left') or Input.is_action_pressed('right')) and Input.is_action_pressed("sprint"):
		return sprint_state
	return null

func process_physics(delta: float) -> State:
	#parent.velocity += Vector3(0.0, -fall_gravity, 0.0) * delta
	#parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
