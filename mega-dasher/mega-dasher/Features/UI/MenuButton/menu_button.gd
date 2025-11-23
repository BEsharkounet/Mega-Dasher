extends Control

class_name Menubutton

@export var background_color : Color = Color.LIME_GREEN
@export var text : String = "Menu"

@onready var label : Label = $Label

#region overrides

func _ready() -> void:
	_set_color()
	_set_text()

#endregion

#region private

func _set_color() -> void:
	modulate = background_color

func _set_text() -> void:
	label.text = text

#endregion

#region signals

func _on_touch_screen_for_control_pressed() -> void:
	print("YES")

#endregion
