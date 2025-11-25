extends Control

@onready var menu_button_container : HBoxContainer = $MainContainer/MenuButtonContainer
@onready var menu_element_container : Control = $MainContainer/MenuContent

#region overrides

func _ready() -> void:
	_link_menu_button_signals()

#endregion

#region privates

func _link_menu_button_signals() -> void:
	for menu_button : Menubutton in menu_button_container.get_children():
		menu_button.on_display_menu_element_emit.connect(_display_menu_element)

func _display_menu_element(scene : Control) -> void:
	_remove_menu_element()
	menu_element_container.add_child(scene)

func _remove_menu_element() -> void:
	for child in menu_element_container.get_children():
		menu_element_container.remove_child(child)
#endregion
