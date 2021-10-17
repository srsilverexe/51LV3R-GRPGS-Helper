extends Control

func _ready():
	if Global.setings["Linguage"] == "en":
		$Panel/GridContainer/VBoxContainer/OptionButton.selected = 0
	elif Global.setings["Linguage"] == "pt_BR":
		$Panel/GridContainer/VBoxContainer/OptionButton.selected = 1
	
	if Global.setings["Theme"] == "dark":
		$Panel/GridContainer/VBoxContainer2/OptionButton.selected = 0
	elif Global.setings["Theme"] == "light":
		$Panel/GridContainer/VBoxContainer2/OptionButton.selected = 1

	
	$Panel/GridContainer/VBoxContainer3/CheckButton.pressed = Global.setings["AutoSave"]
	$Panel/GridContainer/VBoxContainer4/CheckButton.pressed = Global.setings["LogFiles"]
	
	$Panel/GridContainer/VBoxContainer3/LineEdit.text = String(Global.setings["AutoSaveFrequency"])
	print(Global.setings)
	print(SaveSistem.load_data("user://setings.cfg"))

func _process(delta):
	Global.setings["AutoSave"] = $Panel/GridContainer/VBoxContainer3/CheckButton.pressed
	Global.setings["LogFiles"] = $Panel/GridContainer/VBoxContainer4/CheckButton.pressed
	
	if $Panel/GridContainer/VBoxContainer/OptionButton.selected == 0:
		Global.setings["Linguage"] = "en"
	elif $Panel/GridContainer/VBoxContainer/OptionButton.selected == 1:
		Global.setings["Linguage"] = "pt_BR"
	
	if $Panel/GridContainer/VBoxContainer2/OptionButton.selected == 0:
		Global.setings["Theme"] = "dark"
	elif $Panel/GridContainer/VBoxContainer2/OptionButton.selected == 1:
		Global.setings["Theme"] = "light"
	
	if $Panel/GridContainer/VBoxContainer3/CheckButton.pressed:
		$Panel/GridContainer/VBoxContainer3/LineEdit.editable = true
		Global.setings["AutoSaveFrequency"] = int($Panel/GridContainer/VBoxContainer3/LineEdit.text)
	else:
		$Panel/GridContainer/VBoxContainer3/LineEdit.editable = false
	
	if $Panel/GridContainer/VBoxContainer4/CheckButton.pressed:
		$Panel/GridContainer/VBoxContainer4/LineEdit.editable = true
	else:
		$Panel/GridContainer/VBoxContainer4/LineEdit.editable = false
	
	SaveSistem.save_data("user://setings.cfg", Global.setings)

func _on_TextureButton_button_down():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.
