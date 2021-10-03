extends Control

var dice = 0
var rolls = 1
var result = []
var rng = RandomNumberGenerator.new()

var customDice = false
var bonus = false
var onus = false


func _process(delta):
	bonus = $Panel/VBoxContainer/HBoxContainer/VBoxContainer2/CheckButton.pressed
	onus = $Panel/VBoxContainer/HBoxContainer/VBoxContainer2/CheckButton2.pressed
	
	if bonus:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer2/CheckButton2.disabled = true
		onus = false
	else:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer2/CheckButton2.disabled = false
	
	if onus:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer2/CheckButton.disabled = true
		bonus = false
	else:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer2/CheckButton.disabled = false
	
	if bonus or onus:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer4/LineEdit.editable = false
		$Panel/VBoxContainer/VBoxContainer3/Label2.text = String(rolls * 2) + "D" + String(dice)
		rolls = 1
	else:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer4/LineEdit.editable = true
		$Panel/VBoxContainer/VBoxContainer3/Label2.text = String(rolls) + "D" + String(dice)
		if int($Panel/VBoxContainer/HBoxContainer/VBoxContainer4/LineEdit.text) != 0:
			rolls = int($Panel/VBoxContainer/HBoxContainer/VBoxContainer4/LineEdit.text)
		else:
			rolls = 1
	
	if $Panel/VBoxContainer/HBoxContainer/VBoxContainer/LineEdit.editable:
		dice = int($Panel/VBoxContainer/HBoxContainer/VBoxContainer/LineEdit.text)
	
	if $Panel/VBoxContainer/HBoxContainer/VBoxContainer/CheckButton.pressed:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonAttack.disabled = true
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonRun.disabled = true
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonDef.disabled = true
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonShow.disabled = true
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonMagic.disabled = true
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/LineEdit.editable = true
	else:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonAttack.disabled = false
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonRun.disabled = false
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonDef.disabled = false
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonShow.disabled = false
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/ButtonMagic.disabled = false
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/LineEdit.editable = false
	
	_sync_vars()
	pass

func _sync_vars():
	if customDice:
		dice = int($Panel/VBoxContainer/HBoxContainer/VBoxContainer/LineEdit.text)

func _roll():
	result.clear()
	var temp_rolls = rolls
	
	if bonus or onus:
		temp_rolls = rolls * 2
		
	for n in temp_rolls:
		rng.randomize()
		var a = rng.randi_range(1, dice)
		result.insert(result.size(), a)
	
	if bonus:
		$Panel/VBoxContainer/VBoxContainer3/Label4.text = String(result.max())
	elif onus:
		$Panel/VBoxContainer/VBoxContainer3/Label4.text = String(result.min())
	else:
		$Panel/VBoxContainer/VBoxContainer3/Label4.text = String(result)
	


func _on_Button_button_down():
	_roll()
	pass # Replace with function body.


func _on_ButtonAttack_button_down():
	dice = 20
	pass # Replace with function body.


func _on_ButtonRun_button_down():
	dice = 12
	pass # Replace with function body.


func _on_ButtonDef_button_down():
	dice = 20
	pass # Replace with function body.


func _on_ButtonShow_button_down():
	dice = 6
	pass # Replace with function body.


func _on_ButtonMagic_button_down():
	dice = 8
	pass # Replace with function body.


func _on_TextureButton_button_down():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.
