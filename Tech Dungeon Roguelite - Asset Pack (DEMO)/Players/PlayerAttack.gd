extends Node2D

# Определяем доступные магии
enum MagicType {
	STONE,
	WIND,
	WATER,
	LIGHTNING,
	COLD,
	DARK,
	LIGHT,
	FIRE
}

# Переменные для хранения текущей и вторичной магии
var current_magic = null
var secondary_magic = null

# Список доступных магий
var magic_list = [MagicType.STONE, MagicType.WIND, MagicType.WATER, MagicType.LIGHTNING, MagicType.COLD, MagicType.DARK, MagicType.LIGHT, MagicType.FIRE]
var current_index = 0  # Индекс для текущей магии

# Сигналы для стрельбы
signal magic_casted(magic_type)

func _ready():
	# Устанавливаем начальную магию
	current_magic = magic_list[current_index]

func _process(delta):
	# Проверка нажатия ЛКМ для стрельбы
	if Input.is_action_just_pressed("shoot"):
		if current_magic:
			cast_magic(current_magic)

	# Проверка нажатия ПКМ для комбинирования магий
	if Input.is_action_just_pressed("combine"):
		if current_magic and secondary_magic:
			combine_magics(current_magic, secondary_magic)
			reset_magics()

# Функция для кастования магии
func cast_magic(magic_type):
	emit_signal("magic_casted", magic_type)
	print("Casting magic: ", magic_type)

# Функция для комбинирования магий
func combine_magics(magic1, magic2):
	print("Combining magics: ", magic1, " and ", magic2)
	# Здесь можно добавить логику для комбинированной магии

# Функция для сброса текущих магий
func reset_magics():
	secondary_magic = null

# Функция для выбора следующей или предыдущей магии
func select_next_magic():
	current_index = (current_index + 1) % magic_list.size()  # Переход к следующей магии
	current_magic = magic_list[current_index]

func select_previous_magic():
	current_index = (current_index - 1 + magic_list.size()) % magic_list.size()  # Переход к предыдущей магии
	current_magic = magic_list[current_index]

# Обработка событий ввода
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_WHEEL_UP and event.pressed:
		select_next_magic()
		print("Selected magic: ", current_magic)
	elif event is InputEventMouseButton and event.button_index == BUTTON_WHEEL_DOWN and event.pressed:
		select_previous_magic()
		print("Selected magic: ", current_magic)

	# Если хотите, чтобы можно было выбирать вторичную магию с помощью клавиш, добавьте это здесь
