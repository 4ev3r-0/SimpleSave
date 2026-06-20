extends Node

func extract_exported(node:Node) -> Dictionary:
	var result = {}
	for prop in node.get_property_list():
		if prop.usage & PROPERTY_USAGE_EDITOR:
			var name = prop.name
			result[name] = node.get(name)
	return result
