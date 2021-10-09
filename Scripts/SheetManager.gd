extends Control

func _on_TextureButton_button_down():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.


func _on_Button2_button_down():
	get_tree().change_scene("res://Scenes/InventoryViewer.tscn")
	pass # Replace with function body.
