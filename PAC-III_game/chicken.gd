extends KinematicBody2D

var eating = false
var walking = false

var xdir = 1  # 1 = direita e -1 = esquerda
var ydir = 1  # 1 = pra baixo e -1 = pra cima
var speed = 5

var motion = Vector2()

var moving_horizontal_vertical = 1  # 1 = horizontal e 2 = vertical

func _ready():
	walking = true
	randomize()
	
func _physics_process(delta):
	var waiting_time = 1
	if walking == false:
		var x = rand_range(1,2)
		if x > 1.5:
			moving_horizontal_vertical = 1
		else:
			moving_horizontal_vertical = 2
	if walking == true:
		$AnimatedSprite.play("walking")
		if moving_horizontal_vertical == 1:
			if xdir == -1:
				$AnimatedSprite.flip_h = true
			if xdir == 1:
				$AnimatedSprite.flip_h = false
			motion.x = speed * xdir
			motion.y = 0
		elif moving_horizontal_vertical == 2:
			motion.y = speed * ydir
			motion.x = 0
	if eating == true:
		$AnimatedSprite.play("eating")
		motion.x = 0
		motion.y = 0
	move_and_slide(motion)

func _on_changestate_timeout():
	var waiting_time = 1
	if walking == true:
		eating = true
		walking = false
		waiting_time = rand_range(1,5)
	elif eating == true:
		walking = true
		eating = false
		waiting_time = rand_range(2,6)
	$changestate.wait_time = waiting_time
	$changestate.start()


func _on_walking_timeout():
	var x = rand_range(1,2)
	var y = rand_range(1,2)
	var waiting_time = rand_range(1,4)
	if x > 1.5:
		xdir = 1
	else:
		xdir = -1
	if y > 1.5:
		ydir = 1
	else:
		ydir = -1
	$walking.wait_time = waiting_time
	$walking.start()
