extends State

@export
var idle_state: State
@export
var move_state: State
@export
var wall_slide_state: State
@export
var sprint_state: State

@onready var head: Node3D = $"../../Head"
@onready var player: Node3D = $"../../Visuals/TempCharacter"

func enter() -> void:
	state_name = "Fall"

func process_physics(delta: float) -> State:
	if parent.velocity.y > terminal_velocity:
		#print("Fall Vel=", parent.velocity.y)
		parent.velocity += Vector3(0.0, -fall_gravity, 0.0) * delta
	
	if parent.velocity.y < terminal_velocity:
		parent.velocity.y = terminal_velocity
	
	var input_direction = Input.get_axis('left', 'right') 
	
	if input_direction == -1:
		player.rotation = Vector3(0, -270.0, 0)
	elif input_direction == 1:
		player.rotation = Vector3(0, 135.0, 0)
	parent.move_and_slide()
	
	var direction = (head.transform.basis * Vector3(0, 0, input_direction))
	if direction:
		parent.velocity.z = direction.z * sprint_speed
	else:
		parent.velocity.z = 0.0
	
	if parent.is_on_floor():
		if input_direction != 0:
			if Input.is_action_pressed("sprint"):
				return process_state_change(sprint_state)
			return process_state_change(move_state)
		return process_state_change(idle_state)
	if parent.is_on_wall_only() && !Input.is_action_pressed("left") && !Input.is_action_pressed("right"):
		return process_state_change(wall_slide_state)
	return null
