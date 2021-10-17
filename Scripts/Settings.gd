extends Control

func _ready():
	if Global.setings["language"] == "en":
		$Panel/GridContainer/VBoxContainer/OptionButton.selected = 0
	elif Global.setings["language"] == "pt_BR":
		$Panel/GridContainer/VBoxContainer/OptionButton.selected = 1
	
	if Global.setings["theme"] == "dark":
		$Panel/GridContainer/VBoxContainer2/OptionButton.selected = 0
	elif Global.setings["theme"] == "light":
		$Panel/GridContainer/VBoxContainer2/OptionButton.selected = 1

	
	$Panel/GridContainer/VBoxContainer3/CheckButton.pressed = Global.setings["auto_save"]
	$Panel/GridContainer/VBoxContainer4/CheckButton.pressed = Global.setings["log_files"]
	
	$Panel/GridContainer/VBoxContainer3/LineEdit.text = String(Global.setings["auto_save_frequency"])
	print(Global.setings)
	print(SaveSistem.load_data("user://settings.cfg"))

func _process(delta):
	Global.setings["auto_save"] = $Panel/GridContainer/VBoxContainer3/CheckButton.pressed
	Global.setings["log_files"] = $Panel/GridContainer/VBoxContainer4/CheckButton.pressed
	
	if $Panel/GridContainer/VBoxContainer/OptionButton.selected == 0:
		Global.setings["language"] = "en"
	elif $Panel/GridContainer/VBoxContainer/OptionButton.selected == 1:
		Global.setings["language"] = "pt_BR"
	
	if $Panel/GridContainer/VBoxContainer2/OptionButton.selected == 0:
		Global.setings["theme"] = "dark"
	elif $Panel/GridContainer/VBoxContainer2/OptionButton.selected == 1:
		Global.setings["theme"] = "light"
	
	if $Panel/GridContainer/VBoxContainer3/CheckButton.pressed:
		$Panel/GridContainer/VBoxContainer3/LineEdit.editable = true
		Global.setings["auto_save_frequency"] = int($Panel/GridContainer/VBoxContainer3/LineEdit.text)
	else:
		$Panel/GridContainer/VBoxContainer3/LineEdit.editable = false
	
	if $Panel/GridContainer/VBoxContainer4/CheckButton.pressed:
		$Panel/GridContainer/VBoxContainer4/LineEdit.editable = true
	else:
		$Panel/GridContainer/VBoxContainer4/LineEdit.editable = false
	
	SaveSistem.save_data("user://settings.cfg", Global.setings)

func _on_TextureButton_button_down():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.
