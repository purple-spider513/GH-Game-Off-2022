extends Node

var pantsmeninorder = ["Red", "Green", "Blue"]
var current_pantsman = "Red"
var current_index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("SwitchPantsManForward")):
		current_index += 1
		if(current_index == 3):
			current_index = 0
		current_pantsman = pantsmeninorder[current_index]
	if(Input.is_action_just_pressed("SwitchPantsManBack")):
		current_index -= 1
		if(current_index == -1):
			current_index = 2
		current_pantsman = pantsmeninorder[current_index]
