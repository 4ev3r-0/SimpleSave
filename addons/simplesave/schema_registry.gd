extends Node

var schemas := {}

func set_schema(node_name:String, data:Array):
	schemas[node_name] = data

func get_schema(node_name:String):
	return schemas.get(node_name, [])

func get_all() -> Dictionary:
	return schemas
