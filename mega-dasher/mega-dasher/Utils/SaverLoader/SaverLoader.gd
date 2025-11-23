extends Node

var decode_string : String = "hUjdeOp6è"

#region public methods

func save_to_file(dict : Dictionary, tags : Array[String]) -> void:
	
	var path : String = _make_path_from_tags(tags)
	var json_str : String = JSON.stringify(dict)
	
	# Ensure directory exists
	DirAccess.make_dir_recursive_absolute(path.get_base_dir())
	
	var file = FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, decode_string)
	if file:
		file.store_string(json_str)
		file.close()

func load_from_file(tags : Array[String]) -> Dictionary:
	
	var path : String = _make_path_from_tags(tags)
	var answer_text : String = ""
	var answer : Dictionary = {}
	
	var file = FileAccess.open_encrypted_with_pass(path, FileAccess.READ, decode_string)
	if file:
		answer_text = file.get_as_text()
		answer = JSON.parse_string(answer_text)
		file.close()
	return answer

#endregion

#region public methods

func _string_to_key(input: String) -> PackedByteArray:
	# Convert to UTF-8 bytes
	var key: PackedByteArray = input.to_utf8_buffer()

	# Ensure exactly 32 bytes
	if key.size() > 32:
		key = key.slice(0, 32)   # truncate if too long
	elif key.size() < 32:
		var padded := PackedByteArray()
		padded.resize(32)
		for i in range(key.size()):
			padded[i] = key[i]
		# Fill the rest with zeros (or any padding scheme you prefer)
		for i in range(key.size(), 32):
			padded[i] = 0
		key = padded
		
	return key

func _make_path_from_tags(tags : Array[String]) -> String:
	var path : String = "user:/"
	for tag in tags:
		path = str(path, "/", tag)
	return str(path, ".dat")

#endregion
