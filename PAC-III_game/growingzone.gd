extends StaticBody2D

var plant = Global.plantselected
var plantgrowing = false
var plant_grow = false

func _physics_process(delta):
	if plantgrowing ==  false:
		plant = Global.plantselected
		


func _on_Area2D_area_entered(area):
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true
			$carrotgrowtimer.start()
			$plant.play("carrotgrowing")
		if plant == 2:
			plantgrowing = true
			$tomatogrowtimer.start()
			$plant.play("tomatogrowing")
		if plant == 3:
			plantgrowing = true
			$strawberrygrowtimer.start()
			$plant.play("strawberrygrowing")
		if plant == 4:
			plantgrowing = true
			$pumpkingrowtimer.start()
			$plant.play("pumpkingrowing")
		if plant == 5:
			plantgrowing = true
			$corngrowtimer.start()
			$plant.play("corngrowing")
		if plant == 6:
			plantgrowing = true
			$lettucegrowtimer.start()
			$plant.play("lettucegrowing")
	else:
		print("plant is already growing here")


func _on_carrotgrowtimer_timeout():
	var carrot_plant = $plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrotgrowtimer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		$carrotgrowtimer.start()
	elif carrot_plant.frame == 2:
		carrot_plant.frame = 3
		$carrotgrowtimer.start()
	elif carrot_plant.frame == 3:
		carrot_plant.frame = 4
		$carrotgrowtimer.start()
	elif carrot_plant.frame == 4:
		carrot_plant.frame = 5
		plant_grow = true 


func _on_tomatogrowtimer_timeout():
	var tomato_plant = $plant
	if tomato_plant.frame == 0:
		tomato_plant.frame = 1
		$tomatogrowtimer.start()
	elif tomato_plant.frame == 1:
		tomato_plant.frame = 2
		$tomatogrowtimer.start()
	elif tomato_plant.frame == 2:
		tomato_plant.frame = 3
		$tomatogrowtimer.start()
	elif tomato_plant.frame == 3:
		tomato_plant.frame = 4
		$tomatogrowtimer.start()
	elif tomato_plant.frame == 4:
		tomato_plant.frame = 5
		plant_grow = true 

func _on_strawberrygrowtimer_timeout():
	var strawberry_plant = $plant
	if strawberry_plant.frame == 0:
		strawberry_plant.frame = 1
		$strawberrygrowtimer.start()
	elif strawberry_plant.frame == 1:
		strawberry_plant.frame = 2
		$strawberrygrowtimer.start()
	elif strawberry_plant.frame == 2:
		strawberry_plant.frame = 3
		$strawberrygrowtimer.start()
	elif strawberry_plant.frame == 3:
		strawberry_plant.frame = 4
		$strawberrygrowtimer.start()
	elif strawberry_plant.frame == 4:
		strawberry_plant.frame = 5
		plant_grow = true 

func _on_pumpkingrowtimer_timeout():
	var pumpkin_plant = $plant
	if pumpkin_plant.frame == 0:
		pumpkin_plant.frame = 1
		$pumpkingrowtimer.start()
	elif pumpkin_plant.frame == 1:
		pumpkin_plant.frame = 2
		$pumpkingrowtimer.start()
	elif pumpkin_plant.frame == 2:
		pumpkin_plant.frame = 3
		$pumpkingrowtimer.start()
	elif pumpkin_plant.frame == 3:
		pumpkin_plant.frame = 4
		$pumpkingrowtimer.start()
	elif pumpkin_plant.frame == 4:
		pumpkin_plant.frame = 5
		plant_grow = true 

func _on_corngrowtimer_timeout():
	var corn_plant = $plant
	if corn_plant.frame == 0:
		corn_plant.frame = 1
		$corngrowtimer.start()
	elif corn_plant.frame == 1:
		corn_plant.frame = 2
		$corngrowtimer.start()
	elif corn_plant.frame == 2:
		corn_plant.frame = 3
		$corngrowtimer.start()
	elif corn_plant.frame == 3:
		corn_plant.frame = 4
		$corngrowtimer.start()
	elif corn_plant.frame == 4:
		corn_plant.frame = 5
		plant_grow = true 
		
func _on_lettucegrowtimer_timeout():
	var lettuce_plant = $plant
	if lettuce_plant.frame == 0:
		lettuce_plant.frame = 1
		$lettucegrowtimer.start()
	elif lettuce_plant.frame == 1:
		lettuce_plant.frame = 2
		$lettucegrowtimer.start()
	elif lettuce_plant.frame == 2:
		lettuce_plant.frame = 3
		$lettucegrowtimer.start()
	elif lettuce_plant.frame == 3:
		lettuce_plant.frame = 4
		$lettucegrowtimer.start()
	elif lettuce_plant.frame == 4:
		lettuce_plant.frame = 5
		plant_grow = true 


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grow:
			if plant == 1:
				Global.numofcarrots += 1
				plantgrowing = false
				plant_grow = false
				$plant.play("none")
			if plant == 2:
				Global.numoftomatos += 1
				plantgrowing = false
				plant_grow = false
				$plant.play("none")
			if plant == 3:
				Global.numofstrawberry += 1
				plantgrowing = false
				plant_grow = false
				$plant.play("none")
			if plant == 4:
				Global.numofpumpkin += 1
				plantgrowing = false
				plant_grow = false
				$plant.play("none")
			if plant == 5:
				Global.numofcorns += 1
				plantgrowing = false
				plant_grow = false
				$plant.play("none")
			if plant == 6:
				Global.numoflettuces += 1
				plantgrowing = false
				plant_grow = false
				$plant.play("none")
			else:
				pass
		print("number of carriots:" + str(Global.numofcarrots))
		print("number of tomatos:" + str(Global.numoftomatos))
		print("number of strawberry:" + str(Global.numofstrawberry))
		print("number of pumpkin:" + str(Global.numofpumpkin))
		print("number of corns:" + str(Global.numofcorns))
		print("number of lettuces:" + str(Global.numoflettuces))
