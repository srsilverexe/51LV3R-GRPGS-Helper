extends Control

var temp_sheet = {
	#base
	"name": "Joe Doe",
	"level": 1,
	"strength": 0,
	"velocity": 0,
	"intelligence": 0,
	"wisdom": 0,
	"charisma": 0,
	"vitality": 0,
	"sanity": 0,
	#Pericias
	"cold_steel": true,
	"handguns": true,
	"medium_weapons": true,
	"long_weapons": true,
	"heavy_weapons": true,
	"break-ins": true,
	"martial_arts": true,
	"attention_notice": true,
	"fight": true,
	"credibility": true,
	"personal_cares": true,
	"disguise": true,
	"education_general_culture": true,
	"hide_evade": true,
	"dodge_escape": true,
	"falsification": true,
	"stealth": true,
	"questioning": true,
	"intimidation": true,
	"leadership": true,
	"medicines": true,
	"medicine": true,
	"bargain": true,
	"perception": true,
	"labia_persuasion": true,
	"first_aid": true,
	"drug_torture_resistance": true,
	"resistance": true,
	"seduction": true,
	"survival": true,
	"tracking": true
}

func _ready():
	$FileDialog.add_filter("*.sheet")
	pass

func _sync_vars():
	temp_sheet["name"] = String($Panel/HBoxContainer/VBoxContainer/LineEdit.text)
	temp_sheet["level"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit9.text)
	temp_sheet["strength"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit2.text)
	temp_sheet["velocity"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit3.text)
	temp_sheet["intelligence"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit4.text)
	temp_sheet["wisdom"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit5.text)
	temp_sheet["charisma"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit6.text)
	temp_sheet["vitality"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit7.text)
	temp_sheet["sanity"] = int($Panel/HBoxContainer/VBoxContainer/LineEdit8.text)
	temp_sheet["cold_steel"] = bool($Panel/HBoxContainer/GridContainer/CheckBox.pressed)
	temp_sheet["handguns"] = bool($Panel/HBoxContainer/GridContainer/CheckBox2.pressed)
	temp_sheet["medium_weapons"] = bool($Panel/HBoxContainer/GridContainer/CheckBox3.pressed)
	temp_sheet["long_weapons"] = bool($Panel/HBoxContainer/GridContainer/CheckBox4.pressed)
	temp_sheet["heavy_weapons"] = bool($Panel/HBoxContainer/GridContainer/CheckBox5.pressed)
	temp_sheet["break-ins"] = bool($Panel/HBoxContainer/GridContainer/CheckBox6.pressed)
	temp_sheet["martial_arts"] = bool($Panel/HBoxContainer/GridContainer/CheckBox7.pressed)
	temp_sheet["attention_notice"] = bool($Panel/HBoxContainer/GridContainer/CheckBox8.pressed)
	temp_sheet["fight"] = bool($Panel/HBoxContainer/GridContainer/CheckBox9.pressed)
	temp_sheet["credibility"] = bool($Panel/HBoxContainer/GridContainer/CheckBox10.pressed)
	temp_sheet["personal_cares"] = bool($Panel/HBoxContainer/GridContainer/CheckBox11.pressed)
	temp_sheet["disguise"] = bool($Panel/HBoxContainer/GridContainer/CheckBox12.pressed)
	temp_sheet["education_general_culture"] = bool($Panel/HBoxContainer/GridContainer/CheckBox13.pressed)
	temp_sheet["hide_evade"] = bool($Panel/HBoxContainer/GridContainer/CheckBox14.pressed)
	temp_sheet["dodge_escape"] = bool($Panel/HBoxContainer/GridContainer/CheckBox15.pressed)
	temp_sheet["falsification"] = bool($Panel/HBoxContainer/GridContainer/CheckBox16.pressed)
	temp_sheet["stealth"] = bool($Panel/HBoxContainer/GridContainer/CheckBox17.pressed)
	temp_sheet["questioning"] = bool($Panel/HBoxContainer/GridContainer/CheckBox18.pressed)
	temp_sheet["intimidation"] = bool($Panel/HBoxContainer/GridContainer/CheckBox19.pressed)
	temp_sheet["leadership"] = bool($Panel/HBoxContainer/GridContainer/CheckBox20.pressed)
	temp_sheet["medicines"] = bool($Panel/HBoxContainer/GridContainer/CheckBox21.pressed)
	temp_sheet["medicine"] = bool($Panel/HBoxContainer/GridContainer/CheckBox22.pressed)
	temp_sheet["bargain"] = bool($Panel/HBoxContainer/GridContainer/CheckBox23.pressed)
	temp_sheet["perception"] = bool($Panel/HBoxContainer/GridContainer/CheckBox24.pressed)
	temp_sheet["labia_persuasion"] = bool($Panel/HBoxContainer/GridContainer/CheckBox25.pressed)
	temp_sheet["first_aid"] = bool($Panel/HBoxContainer/GridContainer/CheckBox26.pressed)
	temp_sheet["drug_torture_resistance"] = bool($Panel/HBoxContainer/GridContainer/CheckBox27.pressed)
	temp_sheet["resistance"] = bool($Panel/HBoxContainer/GridContainer/CheckBox28.pressed)
	temp_sheet["seduction"] = bool($Panel/HBoxContainer/GridContainer/CheckBox29.pressed)
	temp_sheet["survival"] = bool($Panel/HBoxContainer/GridContainer/CheckBox30.pressed)
	temp_sheet["tracking"] = bool($Panel/HBoxContainer/GridContainer/CheckBox31.pressed)

func _sync_lines():
	$Panel/HBoxContainer/VBoxContainer/LineEdit.text = String(temp_sheet["name"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit9.text = String(temp_sheet["level"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit2.text = String(temp_sheet["strength"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit3.text = String(temp_sheet["velocity"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit4.text = String(temp_sheet["intelligence"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit5.text = String(temp_sheet["wisdom"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit6.text = String(temp_sheet["charisma"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit7.text = String(temp_sheet["vitality"])
	$Panel/HBoxContainer/VBoxContainer/LineEdit8.text = String(temp_sheet["sanity"])
	$Panel/HBoxContainer/GridContainer/CheckBox.pressed = bool(temp_sheet["cold_steel"])
	$Panel/HBoxContainer/GridContainer/CheckBox2.pressed = bool(temp_sheet["handguns"])
	$Panel/HBoxContainer/GridContainer/CheckBox3.pressed = bool(temp_sheet["medium_weapons"])
	$Panel/HBoxContainer/GridContainer/CheckBox4.pressed = bool(temp_sheet["long_weapons"])
	$Panel/HBoxContainer/GridContainer/CheckBox5.pressed = bool(temp_sheet["heavy_weapons"])
	$Panel/HBoxContainer/GridContainer/CheckBox6.pressed = bool(temp_sheet["break-ins"])
	$Panel/HBoxContainer/GridContainer/CheckBox7.pressed = bool(temp_sheet["martial_arts"])
	$Panel/HBoxContainer/GridContainer/CheckBox8.pressed = bool(temp_sheet["attention_notice"])
	$Panel/HBoxContainer/GridContainer/CheckBox9.pressed = bool(temp_sheet["fight"])
	$Panel/HBoxContainer/GridContainer/CheckBox10.pressed = bool(temp_sheet["credibility"])
	$Panel/HBoxContainer/GridContainer/CheckBox11.pressed = bool(temp_sheet["personal_cares"])
	$Panel/HBoxContainer/GridContainer/CheckBox12.pressed = bool(temp_sheet["disguise"])
	$Panel/HBoxContainer/GridContainer/CheckBox13.pressed = bool(temp_sheet["education_general_culture"])
	$Panel/HBoxContainer/GridContainer/CheckBox14.pressed = bool(temp_sheet["hide_evade"])
	$Panel/HBoxContainer/GridContainer/CheckBox15.pressed = bool(temp_sheet["dodge_escape"])
	$Panel/HBoxContainer/GridContainer/CheckBox16.pressed = bool(temp_sheet["falsification"])
	$Panel/HBoxContainer/GridContainer/CheckBox17.pressed = bool(temp_sheet["stealth"])
	$Panel/HBoxContainer/GridContainer/CheckBox18.pressed = bool(temp_sheet["questioning"])
	$Panel/HBoxContainer/GridContainer/CheckBox19.pressed = bool(temp_sheet["intimidation"])
	$Panel/HBoxContainer/GridContainer/CheckBox20.pressed = bool(temp_sheet["leadership"])
	$Panel/HBoxContainer/GridContainer/CheckBox21.pressed = bool(temp_sheet["medicines"])
	$Panel/HBoxContainer/GridContainer/CheckBox22.pressed = bool(temp_sheet["medicine"])
	$Panel/HBoxContainer/GridContainer/CheckBox23.pressed = bool(temp_sheet["bargain"])
	$Panel/HBoxContainer/GridContainer/CheckBox24.pressed = bool(temp_sheet["perception"])
	$Panel/HBoxContainer/GridContainer/CheckBox25.pressed = bool(temp_sheet["labia_persuasion"])
	$Panel/HBoxContainer/GridContainer/CheckBox26.pressed = bool(temp_sheet["first_aid"])
	$Panel/HBoxContainer/GridContainer/CheckBox27.pressed = bool(temp_sheet["drug_torture_resistance"])
	$Panel/HBoxContainer/GridContainer/CheckBox28.pressed = bool(temp_sheet["resistance"])
	$Panel/HBoxContainer/GridContainer/CheckBox29.pressed = bool(temp_sheet["seduction"])
	$Panel/HBoxContainer/GridContainer/CheckBox30.pressed = bool(temp_sheet["survival"])
	$Panel/HBoxContainer/GridContainer/CheckBox31.pressed = bool(temp_sheet["tracking"])

func _on_Button_button_down():
	_sync_vars()
	SaveSistem.save_data("user://" + temp_sheet["name"] + ".sheet", temp_sheet)
	pass 


func _on_Button2_button_down():
	$FileDialog.popup_centered()
	$FileDialog.popup()
	
	pass 


# warning-ignore:shadowed_variable
func _on_FileDialog_file_selected(path):
	temp_sheet = SaveSistem.load_data(path)
	_sync_lines()
	pass 

func _on_TextureButton_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass 
