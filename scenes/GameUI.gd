extends Node2D

var startX : int = 350
var startY : int = 200
var width : int = 360
var height : int = width
var cellWidth : int = width / 3
var lineWidth : int = 4
const NUMBER_OF_ROWS : int = 3
const NUMBER_OF_COLS : int = 3
const NUMBER_OF_CELLS : int = NUMBER_OF_ROWS * NUMBER_OF_COLS
var cell_scene = preload("res://scenes/cell.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var cells = get_node("/root/Board").cells
	for i in NUMBER_OF_ROWS:
		for j in NUMBER_OF_COLS:
			var cell = cell_scene.instantiate()
			cell.position.x = startX + (cellWidth / 2) + (cellWidth * (i % 3))
			cell.position.y = startY + (cellWidth / 2) + (cellWidth * (j % 3))
			cell.row = i
			cell.col = j
			add_child(cell)
			cells[i].append(cell)

	pass

func _draw():
	draw_line(
		Vector2(startX, startY + (width / 3)),
		Vector2(startX + width, startY + (width / 3)), 
		Color.BLACK, lineWidth, 
		true
	)
	draw_line(
		Vector2(startX, startY + (width * 2 / 3)),
		Vector2(startX + width, startY + (width * 2 / 3)), 
		Color.BLACK, lineWidth, 
		true
	)
	draw_line(
		Vector2(startX + (width / 3), startY),
		Vector2(startX + (width / 3), startY + width), 
		Color.BLACK, lineWidth, 
		true
	)
	draw_line(
		Vector2(startX + (width * 2 / 3), startY),
		Vector2(startX + (width * 2 / 3), startY + width), 
		Color.BLACK, lineWidth, 
		true
	)
