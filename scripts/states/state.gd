class_name State
extends Node

@export
var animation_name: String
@export
var animation_speed: float = 1.5
@export
var move_speed: float = 6.0
@export
var sprint_speed: float = 9.0

var fall_gravity:       float = 25.0
var jump_gravity:       float = 5.0
var wall_slide_gravity: float = .4
var terminal_velocity: float  = -60.0

var parent: Player

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_state_change(state_togo: State) -> State:
	var state_name = (state_togo.name).replace("PlayerState", "")
	#if state_name == "Walk":
	#	print("doin it")
	#	parent.animation_player.speed_scale = 22
	#else:
	#	parent.animation_player.speed_scale = 1.5
	parent.animation_player_state_machine.travel(state_name)
	return state_togo

func process_frame(delta: float) -> State:
	#parent.animation_player.speed_scale = animation_speed
	#parent.animation_player.play("AnimationHeap/" + animation_name)
	#parent.animation_player_state_machine.travel(String(state_togo.state_name))
	#var current_animation = (parent.animation_player_state_machine).get_current_node()
	#print("CURR AN: ", current_animation)
	return null

func process_physics(delta: float) -> State:
	return null
