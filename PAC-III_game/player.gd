extends Area2D

export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size



func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$Corpo.play()
		$Cabelo.play()
		$Blusa.play()
		$Calca.play()
		$Sapato.play()
	else:
		$Corpo.stop()
		$Cabelo.stop()
		$Blusa.stop()
		$Calca.stop()
		$Sapato.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.y < 0:
		$Corpo.animation = "cima"
		$Cabelo.animation = "cima"
		$Blusa.animation = "cima"
		$Calca.animation = "cima"
		$Sapato.animation = "cima"

	elif velocity.y > 0:
		$Corpo.animation = "baixo"
		$Cabelo.animation = "baixo"
		$Blusa.animation = "baixo"
		$Calca.animation = "baixo"
		$Sapato.animation = "baixo"
		
	elif velocity.x > 0:
		$Corpo.animation = "direita"
		$Cabelo.animation = "direita"
		$Blusa.animation = "direita"
		$Calca.animation = "direita"
		$Sapato.animation = "direita"
		
	elif velocity.x < 0:
		$Corpo.animation = "esquerda"
		$Cabelo.animation = "esquerda"
		$Blusa.animation = "esquerda"
		$Calca.animation = "esquerda"
		$Sapato.animation = "esquerda"

