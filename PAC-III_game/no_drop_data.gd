extends ColorRect

var dropAreaRect = Rect2(Vector2(50, 50), Vector2(200, 200))

func can_drop_data(position: Vector2, data) -> bool:
	return dropAreaRect.has_point(position)

func drop_data(position: Vector2, data) -> void:
	if dropAreaRect.has_point(position):
		# Realizar a ação de drop dentro da área permitida
		data.backup.get_node("sprite").texture = data.sprite
		data.backup.get_node("amount").text = data.amount
