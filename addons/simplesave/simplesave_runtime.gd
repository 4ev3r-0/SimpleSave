extends Node

const SAVE_PATH = "user://SimpleSave/"

var encryption = preload("res://addons/simplesave/encryption.gd").new()

func _ensure_dir(path: String):
	if !DirAccess.dir_exists_absolute(path):
		DirAccess.make_dir_recursive_absolute(path)

func save_slot(slot: int, schema: Dictionary):
	var slot_path = SAVE_PATH + "slot_%s/" % slot
	_ensure_dir(slot_path)

	for node_name in schema.keys():
		var data = schema[node_name]
		var json = JSON.stringify({
			"node": node_name,
			"data": data
		})

		if encryption.enabled:
			json = encryption.encrypt(json)

		var file = FileAccess.open(slot_path + node_name + ".json", FileAccess.WRITE)
		file.store_string(json)


func load_slot(slot: int, schema: Dictionary):
	var slot_path = SAVE_PATH + "slot_%s/" % slot
	for node_name in schema.keys():
		var file_path = slot_path + node_name + ".json"
		if !FileAccess.file_exists(file_path):
			continue
		var file = FileAccess.open(file_path, FileAccess.READ)
		var raw = file.get_as_text()
		if encryption.enabled:
			raw = encryption.decrypt(raw)
		var parsed = JSON.parse_string(raw)
		if parsed:
			schema[node_name] = parsed["data"]
