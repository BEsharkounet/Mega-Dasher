extends Control

class_name Menubutton

signal on_display_menu_element_emit(instance_scene : Control)

@export var background_color : Color = Color.LIME_GREEN
@export var text : String = "Menu"
@export var menu_element : PackedScene = null

@onready var label : Label = $Label

var instance_scene : Control = null

#region overrides

func _ready() -> void:
	_set_color()
	_set_text()
	_set_instance_scene()

#endregion

#region private

func _set_instance_scene() -> void:
	if menu_element :
		instance_scene = menu_element.instantiate()

func _set_color() -> void:
	modulate = background_color

func _set_text() -> void:
	label.text = text

func _display_menu_element() -> void:
	if instance_scene :
		on_display_menu_element_emit.emit(instance_scene)

#endregion

#region signals

func _on_touch_screen_for_control_pressed() -> void:
	_display_menu_element()

#endregion
