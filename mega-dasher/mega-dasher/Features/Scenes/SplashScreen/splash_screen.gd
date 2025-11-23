extends Control

var next_scene_name : String = "Menu"

#region nodes
@onready var animation_player : AnimationPlayer = $Center/CenterNode2d/AnimationPlayer
#endregion

#region overrides

func _ready() -> void:
	_start_animation()

#endregion

#region private methods

func _start_animation() -> void:
	animation_player.play("Start")

func _change_to_scene(scene_name : String) -> void:
	SceneManager.change_scene(next_scene_name, fade_out_options, fade_in_options, general_options)

#endregion

#region signals

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	_change_to_scene(next_scene_name)

#endregion

#region change scene

@export var fade_out_speed: float = 0.7
@export var fade_in_speed: float = 0.7
@export var fade_out_pattern: String = "fade"
@export var fade_in_pattern: String = "fade"
@export var fade_out_smoothness = 0.1 # (float, 0, 1)
@export var fade_in_smoothness = 0.1 # (float, 0, 1)
@export var fade_out_inverted: bool = true
@export var fade_in_inverted: bool = false
@export var color: Color = Color(0, 0, 0)
@export var timeout: float = 0.0
@export var clickable: bool = false
@export var add_to_back: bool = true

@onready var fade_out_options = SceneManager.create_options(fade_out_speed, fade_out_pattern, fade_out_smoothness, fade_out_inverted)
@onready var fade_in_options = SceneManager.create_options(fade_in_speed, fade_in_pattern, fade_in_smoothness, fade_in_inverted)
@onready var general_options = SceneManager.create_general_options(color, timeout, clickable, add_to_back)

#endregion
