extends Area2D

func _draw():
	var collision = get_node("CollisionShape2D").shape.get_rect()

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("assigning X")
		get_node("Label").text = "X"
	
