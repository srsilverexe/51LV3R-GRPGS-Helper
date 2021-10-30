extends Control

func _ready():
	if Global.settings["language"] == "en":
		$Panel/GridContainer/VBoxContainer/OptionButton.selected = 0
	elif Global.settings["language"] == "pt_BR":
		$Panel/GridContainer/VBoxContainer/OptionButton.selected = 1
	
	if Global.settings["theme"] == "dark":
		$Panel/GridContainer/VBoxContainer2/OptionButton.selected = 0
	elif Global.settings["theme"] == "light":
		$Panel/GridContainer/VBoxContainer2/OptionButton.selected = 1
	
	
	$Panel/GridContainer/VBoxContainer3/CheckButton.pressed = Global.settings["auto_save"]
	$Panel/GridContainer/VBoxContainer4/CheckButton.pressed = Global.settings["dices_log_files"]
	$Panel/GridContainer/VBoxContainer5/CheckButton.pressed = Global.settings["dices_log_auto_clear"]
	
	
	
	$Panel/GridContainer/VBoxContainer3/LineEdit.text = String(Global.settings["auto_save_frequency"])
	$Panel/GridContainer/VBoxContainer5/LineEdit.text = String(Global.settings["dices_log_auto_clear_frequency"])
	print(Global.settings)
	print(SaveSistem.load_data("user://settings.cfg"))

# warning-ignore:unused_argument
func _process(delta):
	Global.settings["auto_save"] = $Panel/GridContainer/VBoxContainer3/CheckButton.pressed
	Global.settings["dices_log_files"] = $Panel/GridContainer/VBoxContainer4/CheckButton.pressed
	Global.settings["dices_log_auto_clear"] = $Panel/GridContainer/VBoxContainer5/CheckButton.pressed
	
	
	if $Panel/GridContainer/VBoxContainer/OptionButton.selected == 0:
		Global.settings["language"] = "en"
	elif $Panel/GridContainer/VBoxContainer/OptionButton.selected == 1:
		Global.settings["language"] = "pt_BR"
	
	if $Panel/GridContainer/VBoxContainer2/OptionButton.selected == 0:
		Global.settings["theme"] = "dark"
	elif $Panel/GridContainer/VBoxContainer2/OptionButton.selected == 1:
		Global.settings["theme"] = "light"
	
	if $Panel/GridContainer/VBoxContainer3/CheckButton.pressed:
		$Panel/GridContainer/VBoxContainer3/LineEdit.editable = true
		Global.settings["auto_save_frequency"] = int($Panel/GridContainer/VBoxContainer3/LineEdit.text)
	else:
		$Panel/GridContainer/VBoxContainer3/LineEdit.editable = false
	
	if $Panel/GridContainer/VBoxContainer5/CheckButton.pressed:
		$Panel/GridContainer/VBoxContainer5/LineEdit.editable = true
		Global.settings["dices_log_auto_clear_frequency"] = int($Panel/GridContainer/VBoxContainer5/LineEdit.text)
	else:
		$Panel/GridContainer/VBoxContainer5/LineEdit.editable = false
	
	SaveSistem.save_data("user://settings.cfg", Global.settings)

func _on_TextureButton_button_down():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.
