@tool
extends Control

var plugin
var selected_node

@onready var register_button = $VBox/RegisterButton
@onready var list = $VBox/PropertyList

func _ready():
	register_button.pressed.connect(_on_register_pressed)

func set_plugin(p):
	plugin = p

func refresh(node:Node):
	selected_node = node
	list.clear()
	if !node:
		return

	for prop in node.get_property_list():
		if prop.usage & PROPERTY_USAGE_EDITOR:
			list.add_item(prop.name)

func _on_register_pressed():
	if selected_node and plugin:
		plugin.register_node(selected_node)
