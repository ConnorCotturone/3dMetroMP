class_name WalkingPlayerState

extends State
const SPEED = 5.0
@onready var temp_character: Node3D = $"../../Visuals/TempCharacter"
@onready var player: CharacterBody3D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../Visuals/TempCharacter/AnimationPlayer"
@onready var head: Node3D = $"../../Head"

func update(delta):
	animation_player.play("Walk")

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	
	
	var input_dir = 0
	if Input.is_action_pressed("left"):
		temp_character.rotation = Vector3(0, -270.0, 0)
		input_dir = -1
	elif Input.is_action_pressed(("right")):
		temp_character.rotation = Vector3(0, 135.0, 0)
		input_dir = 1
	else:
		input_dir = 0
	
	var direction = (head.transform.basis * Vector3(0, 0, input_dir))
	if direction:
		player.velocity.z = direction.z * SPEED
	else:
		transition.emit("IdlePlayerState")
	player.move_and_slide()
	if (Input.is_action_pressed("sprint")): transition.emit("SprintPlayerState")
