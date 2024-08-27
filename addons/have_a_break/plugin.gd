@tool
extends EditorPlugin

var _dock_instance : Control

func _enter_tree():
	_dock_instance = preload("res://addons/have_a_break/have_a_break.tscn").instantiate()
	_dock_instance.name = "Have a break"
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_BL, _dock_instance)


func _exit_tree():
	remove_control_from_docks(_dock_instance)
	_dock_instance.free()
