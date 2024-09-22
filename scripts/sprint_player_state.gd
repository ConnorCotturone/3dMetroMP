class_name SprintPlayerState

extends State
const SPEED = 7.5
@onready var player: CharacterBody3D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../Visuals/TempCharacter/AnimationPlayer"
@onready var temp_character: Node3D = $"../../Visuals/TempCharacter"
@onready var head: Node3D = $"../../Head"

func update(delta):
	animation_player.play("Run")
	if Input.is_action_just_released("sprint"): transition.emit("WalkingPlayerState")

func _physics_process(delta: float) -> void:
	var input_dir = 0
	if Input.is_action_pressed("left") and Input.is_action_pressed("sprint"):
		temp_character.rotation = Vector3(0, -270.0, 0)
		input_dir = -1
	elif Input.is_action_pressed("right") and Input.is_action_pressed("sprint"):
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
