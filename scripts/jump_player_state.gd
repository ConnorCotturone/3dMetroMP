extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State

@export
var jump_force: float = 4.5

@onready var head: Node3D = $"../../Head"
@onready var player: Node3D = $"../../Visuals/TempCharacter"


func enter() -> void:
	super()
	#parent.velocity.y = -jump_force

func process_physics(delta: float) -> State:	
	if parent.velocity.y > 0:
		return fall_state
	
	var input_direction = Input.get_axis('left', 'right') 
	
	if input_direction == -1:
		player.rotation = Vector3(0, -270.0, 0)
	elif input_direction == 1:
		player.rotation = Vector3(0, 135.0, 0)
		
	var direction = (head.transform.basis * Vector3(0, 0, input_direction))
	if direction:
		parent.velocity.y = -jump_force
		parent.velocity.z = direction.z * sprint_speed
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if input_direction != 0:
			return move_state
		return idle_state
	
	return null
