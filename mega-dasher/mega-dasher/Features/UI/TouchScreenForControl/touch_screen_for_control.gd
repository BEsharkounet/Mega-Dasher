extends TouchScreenButton

#region overrides

func _ready():
	_init_with_parent()

#endregion

#region privates

func _init_with_parent() -> void:
	var parent = get_parent()
	if parent is Control:
		_update_shape(parent.size)
		parent.connect("resized", _on_parent_resized)

func _on_parent_resized():
	var parent = get_parent()
	if parent is Control:
		_update_shape(parent.size)
		_update_position(parent.size)

func _update_shape(new_size: Vector2):
	var rect_shape := RectangleShape2D.new()
	rect_shape.extents = new_size / 2.0
	shape = rect_shape

func _update_position(new_size: Vector2) -> void:
	position = new_size / 2.0 

#endregion
