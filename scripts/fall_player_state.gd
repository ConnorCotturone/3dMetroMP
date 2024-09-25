extends State

@export
var idle_state: State
@export
var move_state: State

@onready var head: Node3D = $"../../Head"
@onready var player: Node3D = $"../../Visuals/TempCharacter"


func process_physics(delta: float) -> State:
	parent.velocity += parent.get_gravity() * delta
	
	var input_direction = Input.get_axis('left', 'right') 
	
	if input_direction == -1:
		player.rotation = Vector3(0, -270.0, 0)
	elif input_direction == 1:
		player.rotation = Vector3(0, 135.0, 0)
	parent.move_and_slide()
	
	var direction = (head.transform.basis * Vector3(0, 0, input_direction))
	if direction:
		parent.velocity.z = direction.z * move_speed
	
	if parent.is_on_floor():
		if input_direction != 0:
			return move_state
		return idle_state
	return null
