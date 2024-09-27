class_name State
extends Node

@export
var animation_name: String
@export
var move_speed: float = 5.0
@export
var sprint_speed: float = 7.0

var fall_gravity: float = 10.0 #ProjectSettings.get_setting("physics/3d/default_gravity")
var jump_gravity: float = 5.0
var parent: Player

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	parent.animation_player.play(animation_name)
	return null

func process_physics(delta: float) -> State:
	return null
