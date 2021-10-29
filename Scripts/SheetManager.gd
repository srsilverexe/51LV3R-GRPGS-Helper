extends Control

var sheets = 0

func _process(delta):
	for i in SaveSistem.scan_folder("user://sheets/"):
		if ".sheet" in i:
			sheets += 1
	
	if sheets > 0:
		$TabContainer.set_tab_disabled(1, false)
	else:
		$TabContainer.set_tab_disabled(1, true)
	
	

func _on_TextureButton_button_down():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.

func _on_Button2_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/InventoryViewer.tscn")
	pass # Replace with function body.

func _on_Button3_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/GrimoryViewer.tscn")
	pass # Replace with function body.
