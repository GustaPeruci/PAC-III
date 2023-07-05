extends CanvasLayer

export(String, FILE, "*.json") var d_file

var text_box = []
var current_text_id = 0
var text_active = false

onready var NinePatchRect = $NinePatchRect
onready var NameLabel = $NinePatchRect/Name
onready var ChatLabel = $NinePatchRect/Chat
onready var Timer = $Timer

func _ready():
	NinePatchRect.visible = false

func start():
	if text_active:
		return
	text_active = true
	NinePatchRect.visible = true
	text_box = load_text_box()
	current_text_id = -1
	next_text()

func load_text_box():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file, File.READ)
		return parse_json(file.get_as_text())

func _input(event):
	if not text_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_text()

func next_text():
	current_text_id += 1
	
	if current_text_id >= len(text_box):
		end_text_box()
		return 
	
	NameLabel.text = text_box[current_text_id]['name']
	ChatLabel.text = text_box[current_text_id]['text']

func end_text_box():
	Timer.start()
	NinePatchRect.visible = false

func _on_Timer_timeout():
	text_active = false
