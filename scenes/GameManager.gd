extends Node2D

@export var playerX : Node
@export var playerO : Node

var currentPlayer : Player
var nextTurnDelay : float = 0.25
var gameOver : bool = false
var cells : Array = [[], [], []]

signal beginPlayerTurn(player)
signal endPlayerTurn(player)

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(nextTurnDelay).timeout
	beginTurn()

func beginTurn():
	if currentPlayer == playerO:
		currentPlayer = playerX
	elif currentPlayer == playerX:
		currentPlayer = playerO
	else:
		currentPlayer = playerX
	
	emit_signal("beginPlayerTurn", currentPlayer)

func checkVictory():
	# Check cols
	for i in range(3):
		if cells[i][0].value == cells[i][1].value && cells[i][1].value == cells[i][2].value && cells[i][0].value != " ":
			gameOver = true

	# Check columns
	for i in range(3):
		if cells[0][i].value == cells[1][i].value && cells[1][i].value == cells[2][i].value && cells[0][i].value != " ":
			gameOver = true

	# Check diagonals
	if cells[0][0].value == cells[1][1].value && cells[1][1].value == cells[2][2].value && cells[0][0].value != " ":
		gameOver = true
	if cells[0][2].value == cells[1][1].value && cells[1][1].value == cells[2][0].value && cells[0][2].value != " ":
		gameOver = true
	
	if gameOver == true:
		disableCells()

func endTurn():
	checkVictory()
	emit_signal("endPlayerTurn", currentPlayer)
	
	if gameOver == false:
		beginTurn()
	else:
		print("Game over!")

func disableCells():
	for i in 3:
		for j in 3:
			cells[i][j].active = false
