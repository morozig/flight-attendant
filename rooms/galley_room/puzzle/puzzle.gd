extends Node2D

var lockScene = preload("res://rooms/galley_room/puzzle/lock.tscn")
var lock

func unlock():
	escoria.globals_manager.set_global("cargo_open", true)

func close():
	escoria.main.current_scene.game.show_ui()
	escoria.main.current_scene.show()
	escoria.inputs_manager.input_mode = escoria.inputs_manager.INPUT_ALL
	queue_free()
	
func reset():
	if (lock):
		lock.queue_free()
		remove_child(lock)
	lock = lockScene.instance()
	lock.connect("solved", self, "_on_solved")
	add_child(lock)

func _ready():
	escoria.main.current_scene.game.hide_ui()
	escoria.main.current_scene.hide()
	escoria.inputs_manager.input_mode = escoria.inputs_manager.INPUT_NONE
	reset()

func _on_Button_pressed():
	close()

func _on_solved():
	unlock()
	close()

func _on_Exit_pressed():
	close()

func _on_Skip_pressed():
	unlock()
	close()

func _on_Reset_pressed():
	reset()
