extends Area3D

signal interacted()

@export var label = "Interact"

func interact(interactor: Node = null) -> void:
	emit_signal("interacted", interactor)
	
	# TODO: @audio UI_validated sound (like a bell or something similaire)
