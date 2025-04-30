extends Node2D

var mainMenu : PackedScene = preload("res://screens/MainMenu.tscn")
var gamePlayScene : PackedScene = preload("res://screens/GamePlayScene.tscn")
var gameOverScene : PackedScene = preload("res://screens/GameOver.tscn")

var canPress: bool = true

var currentSceneName = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("start_game"):
		print_debug("ACTION!")
		changeScene();
	

func changeScene() -> void :
	
	if currentSceneName == "":
		self.add_child(mainMenu.instantiate())
		currentSceneName = "mainMenu"
		return
	if currentSceneName == "mainMenu":
		var currentChild = self.get_child(0)
		self.remove_child(currentChild)
		self.add_child(gamePlayScene.instantiate())
		currentSceneName = "gamePlay"
		return
	if currentSceneName == "gamePlay":
		var currentChild = self.get_child(0)
		self.remove_child(currentChild)
		self.add_child(gameOverScene.instantiate())
		currentSceneName = "GameOver"
		return
	if currentSceneName == "GameOver":
		var currentChild = self.get_child(0)
		self.remove_child(currentChild)
		self.add_child(mainMenu.instantiate())
		currentSceneName = "mainMenu"
		return
