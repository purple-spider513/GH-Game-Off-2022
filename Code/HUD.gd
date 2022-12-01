extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.current_index == 0):
		$AnimationPlayer.play("RedPantsMan")
	if(Global.current_index == 1):
		$AnimationPlayer.play("GreenPantsMan")
	if(Global.current_index == 2):
		$AnimationPlayer.play("BluePantsMan")
	
