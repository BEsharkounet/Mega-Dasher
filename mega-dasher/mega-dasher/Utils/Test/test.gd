extends Control

@onready var label : Label = $HBoxContainer/Label

var apple : int = 0

var tags : Array[String] = [
	"test",
	"apple"
]

func _ready() -> void:
	var data : Dictionary = SaverLoader.load_from_file(tags)
	
	apple = 0 if data.is_empty() else data["apple"]

func _process(_delta : float) -> void:
	label.text = str(apple)

func _on_button_pressed() -> void:
	apple += 1
	var apple_dict : Dictionary = {
		"apple" = apple
	}
	SaverLoader.save_to_file(apple_dict, tags)
