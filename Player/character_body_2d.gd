extends CharacterBody2D  # Используем CharacterBody2D

# Скорость передвижения персонажа
var speed = 200

func _process(delta):
	# Создаем новый вектор скорости
	var direction = Vector2()

	# Получаем ввод от игрока
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

	# Двигаем персонажа
	velocity = direction  # Устанавливаем внутреннюю переменную velocity
	move_and_slide()  # Вызываем метод без параметров
