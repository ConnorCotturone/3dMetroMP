class_name IdlePlayerState

extends State

@onready var player: CharacterBody3D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../Visuals/TempCharacter/AnimationPlayer"

func update(delta):
	animation_player.play("Idle")
	# leave state
	if player.velocity.length() > 0.0:
		transition.emit("WalkingPlayerState")

#func _physics_process(delta: float) -> void:
#	player.velocity.z = 0.0
