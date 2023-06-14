extends Node2D

signal solved

func _on_Area2D_body_entered(body):
	emit_signal("solved")
