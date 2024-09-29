extends State

@export
var idle_state: State
@export
var fall_state: State
@export
var move_state: State
# specific jump animation needed
#@export
#var jump_state: State

@onready 
var left_ray_cast: RayCast3D = $"../../LeftRayCast"
@onready 
var right_ray_cast: RayCast3D = $"../../RightRayCast"
@onready 
var player: Node3D = $"../../Visuals/TempCharacter"

func enter() -> void:
	#super()
	parent.velocity.z = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed('left') && !left_ray_cast.is_colliding():
		player.rotation = Vector3(0.0, 0.0, 0.0)
		return process_state_change(fall_state)
	elif Input.is_action_pressed("right") && !right_ray_cast.is_colliding():
		player.rotation = Vector3(0.0, 0.0, 0.0)
		return process_state_change(fall_state)
	
	return null

func process_physics(delta: float) -> State:
	if !parent.is_on_floor():
		parent.velocity += Vector3(0.0, -wall_slide_gravity, 0.0) * delta
	else:
		player.rotation = Vector3(0.0, 0.0, 0.0)
		return process_state_change(idle_state)
	parent.move_and_slide()
	
	if left_ray_cast.is_colliding():
		player.rotation = Vector3(25.0, 401.0, 64.0)
	if right_ray_cast.is_colliding():
		player.rotation = Vector3(25.0, 41.0, 64.0)
	
	if !parent.is_on_wall_only():
		player.rotation = Vector3(0.0, 0.0, 0.0)
		return process_state_change(fall_state)
	return null
