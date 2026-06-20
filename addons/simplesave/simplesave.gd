@tool
extends EditorPlugin

var dock

func _enter_tree():
	dock = preload("res://addons/simplesave/editor/simplesave_dock.tscn").instantiate()
	dock.set_plugin(self)
	add_control_to_dock(DOCK_SLOT_RIGHT_UL, dock)

func _exit_tree():
	remove_control_from_docks(dock)
	dock.free()
