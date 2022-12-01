extends KinematicBody2D

const MAXSPEED = 50
var velocity = Vector2(0, 0)
var moving = false
var candoublejump = true
var iscurrentpantsman = false
var nextlevel = load("res://Scenes/Individual/Level2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(_delta):
	iscurrentpantsman = Global.current_index == 1
	if(iscurrentpantsman):
		$Camera2D.current = true
	else:
		$Camera2D.current = false
	if(position.y >= 100):
		position.x = 0
		position.y = 0
	if(is_on_floor()):
		candoublejump = true
		velocity.y = 1
	moving = false
	velocity.y += 2
	if Input.is_action_pressed("Left") && iscurrentpantsman:
		velocity.x -= 5
		moving = true
	if Input.is_action_pressed("Right") && iscurrentpantsman:
		velocity.x += 5
		moving = true
	if Input.is_action_just_pressed("Jump") && is_on_floor() && iscurrentpantsman:
		velocity.y = -75
	else:
		if Input.is_action_just_pressed("Jump") && candoublejump && iscurrentpantsman:
			velocity.y = -60
			candoublejump = false
		else:
			if Input.is_action_pressed("Jump") && is_on_wall() && iscurrentpantsman:
				velocity.y = -60
				if(Input.is_action_pressed("Right") && iscurrentpantsman):
					velocity.x = -500
				if(Input.is_action_pressed("Left") && iscurrentpantsman):
					velocity.x = 500
	if(velocity.x > MAXSPEED):
		velocity.x = MAXSPEED
	if(velocity.x < -MAXSPEED):
		velocity.x = -MAXSPEED
	if(velocity.y > 70):
		velocity.y = 70
	if(velocity.x > 0):
		velocity.x -= 1
	if(velocity.x < 0):
		velocity.x += 1
	
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if(moving):
		$AnimationPlayer.play("RedMove")
	else:
		$AnimationPlayer.play("Idle")


func _on_TheI_body_entered(body):
	if(body.name == "PantsManGreen"):
		if(Global.current_level == "Level2"):
			get_tree().change_scene("res://Scenes/Individual/Finishgame.tscn")
		if(Global.current_level == "Tutorial"):
			get_tree().change_scene("res://Scenes/Individual/Level2.tscn")
			Global.current_level = "Level2"
