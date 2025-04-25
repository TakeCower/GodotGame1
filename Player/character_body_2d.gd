extends CharacterBody2D

# Скорость передвижения персонажа
var speed = 200

func _process(delta):
	var direction = Vector2()


	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Нормализуем вектор направления и умножаем на скорость
	direction = direction.normalized() * speed

	velocity = direction 
	move_and_slide()  
