extends Control

func _ready():
	if Global.setings["Linguage"] == "en":
		$Panel/VBoxContainer/OptionButton.selected = 0
	elif Global.setings["Linguage"] == "pt_BR":
		$Panel/VBoxContainer/OptionButton.selected = 1

func _process(delta):
	if $Panel/VBoxContainer/OptionButton.selected == 0:
		Global.setings["Linguage"] = "en"
	elif $Panel/VBoxContainer/OptionButton.selected == 1:
		Global.setings["Linguage"] = "pt_BR"
	SaveSistem.save_data("user://setings.cfg", Global.setings)

func _on_TextureButton_button_down():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.
