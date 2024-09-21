extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var temp_character: Node3D = $Visuals/TempCharacter
@onready var animation_player: AnimationPlayer = $Visuals/TempCharacter/AnimationPlayer
@onready var head: Node3D = $Head

func _ready() -> void:
	if animation_player:
		animation_player.speed_scale = 1.5
		animation_player.play("idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if !animation_player.is_playing() || animation_player.current_animation != "Jump":
			animation_player.play("Jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir = 0
	if Input.is_action_pressed("left"):
		input_dir = -1
		
	elif Input.is_action_pressed(("right")):
		input_dir = 1
		
	# facing right
	if input_dir == 1:
		temp_character.rotation = Vector3(0, 135.0, 0)
	# facing left
	elif input_dir == -1:
		temp_character.rotation = Vector3(0, -270.0, 0)
			
	var direction = (head.transform.basis * Vector3(0, 0, input_dir))
	if direction:
		if (!animation_player.is_playing() || animation_player.current_animation != "Walk") && animation_player.current_animation != "Jump":
			animation_player.play("Walk")
		velocity.z = direction.z * SPEED
	else:
		if (!animation_player.is_playing() || animation_player.current_animation != "Idle") && animation_player.current_animation != "Jump":
			animation_player.play("Idle")
		velocity.z = 0.0
		
	move_and_slide()
