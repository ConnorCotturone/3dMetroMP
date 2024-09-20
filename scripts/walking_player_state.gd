class_name WalkingPlayerState

extends State

@onready var player: CharacterBody3D = $"../.."

func update(delta):
	if player.velocity.length() == 0.0:
		transition.emit("IdlePlayerState")
