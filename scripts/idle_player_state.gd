class_name IdlePlayerState

extends State

@onready var player: CharacterBody3D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../Visuals/TempCharacter/AnimationPlayer"

func update(delta):
	animation_player.play("Idle")
	# leave state
	
	
	if (Input.is_action_just_pressed("left") || Input.is_action_just_pressed("right") and Input.is_action_pressed("sprint")):
		transition.emit("SprintPlayerState")

	if (Input.is_action_just_pressed("left") || Input.is_action_just_pressed("right")):
		transition.emit("WalkingPlayerState")

func _physics_process(delta: float) -> void:
	player.velocity.z = 0.0
	player.move_and_slide()
