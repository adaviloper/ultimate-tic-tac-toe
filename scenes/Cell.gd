extends Area2D

var active : bool = true
var row : int
var col : int
var value : String = " "

func _draw():
	var collision = get_node("CollisionShape2D").shape.get_rect()

func _on_input_event(viewport, event, shape_idx):
	if active == true and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var currentPlayer = get_node("/root/Board").currentPlayer
		if currentPlayer.isX == true:
			value = "X"
		else:
			value = "O"

		get_node("Label").text = value
		active = false
		get_node("/root/Board").endTurn()
	
