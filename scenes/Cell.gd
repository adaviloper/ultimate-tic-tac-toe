extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	var collision = get_node("CollisionShape2D").shape.get_rect()
	draw_rect(Rect2(collision.position.x, collision.position.y, collision.size.x, collision.size.y), Color.CORNSILK, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("assigning X")
		get_node("Label").text = "X"
	