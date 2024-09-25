class_name Player
extends CharacterBody3D

@onready
var animation_player = $Visuals/TempCharacter/AnimationPlayer
@onready
var player_state_machine = $PlayerStateMachine

func _ready() -> void:
	if animation_player:
		animation_player.speed_scale = 1.5
	player_state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	player_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	player_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	player_state_machine.process_frame(delta)
