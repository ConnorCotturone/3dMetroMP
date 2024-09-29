extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var jump_state: State
@export
var move_state: State

@onready var head: Node3D = $"../../Head"
@onready var player: Node3D = $"../../Visuals/TempCharacter"

func enter() -> void:
	state_name = "Sprint"

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed('jump') and parent.is_on_floor():
		return process_state_change(jump_state)
	if !Input.is_action_pressed("sprint") && (Input.is_action_pressed("left") || Input.is_action_pressed("right")):
		return process_state_change(move_state)
	return null

func process_physics(delta: float) -> State:

	
	var input_direction = Input.get_axis('left', 'right') 
	
	if input_direction == 0:
		return process_state_change(idle_state)
	elif input_direction == -1:
		player.rotation = Vector3(0, -270.0, 0)
	elif input_direction == 1:
		player.rotation = Vector3(0, 135.0, 0)

	var direction = (head.transform.basis * Vector3(0, 0, input_direction))
	if direction && Input.is_action_pressed("sprint"):
		parent.velocity.z = direction.z * sprint_speed
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return process_state_change(fall_state)
	return null
