extends NinePatchRect

export(String, FILE, "*.json") var d_file

var dialogue = []
var current_dialogue_id = 0
var d_active = false

func _ready():
	self.visible = false
	
func load_dialogue(d_file):
	if d_file != null:
		var file = File.new()
		if file.file_exists(d_file):
			file.open(d_file, file.READ)
			dialogue = parse_json(file.get_as_text())
			file.close()
			
func clear_infos():
	d_file = null
	dialogue = null
	current_dialogue_id = 0
	$SeedName.text = ''
	$SeedInfo.text = ''

func _on_NextButton_pressed():
	
	if (dialogue == null):
		return
	
	if current_dialogue_id >= len(dialogue):
		current_dialogue_id -= 1
		return
	
	$SeedName.text = dialogue[current_dialogue_id]['name']
	$SeedInfo.text = dialogue[current_dialogue_id]['text']
	
	current_dialogue_id += 1

func _on_PreviewtButton_pressed():
	
	if (dialogue == null):
		return
	
	if current_dialogue_id < 0:
		current_dialogue_id += 1
		return
		
	if current_dialogue_id >= len(dialogue):
		current_dialogue_id -= 1
	
	$SeedName.text = dialogue[current_dialogue_id]['name']
	$SeedInfo.text = dialogue[current_dialogue_id]['text']
	
	current_dialogue_id -= 1
