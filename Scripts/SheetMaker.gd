extends Tabs

var temp_sheet = {
	#Base
	"name": "Joe Doe",
	"race": "Nenhuma",
	"class": "Nenhuma",
	#Status
	"level": 1,
	"life": 0,
	"stamina": 0,
	"mana_vital_energy": 0,
	"money": 0,
	"max_life": 0,
	"max_stamina": 0,
	"max_mana_vital_energy": 0,
	#Points
	"strength": 5,
	"velocity": 5,
	"intelligence": 5,
	"wisdom": 5,
	"charisma": 5,
	"vitality": 5,
	"sanity": 0,
	#Skills
	"cold_steel": false,
	"handguns": false,
	"medium_weapons": false,
	"long_weapons": false,
	"heavy_weapons": false,
	"break-ins": false,
	"martial_arts": false,
	"attention_notice": false,
	"fight": false,
	"credibility": false,
	"personal_cares": false,
	"disguise": false,
	"education_general_culture": false,
	"hide_evade": false,
	"dodge_escape": false,
	"falsification": false,
	"stealth": false,
	"questioning": false,
	"intimidation": false,
	"leadership": false,
	"medicines": false,
	"medicine": false,
	"bargain": false,
	"perception": false,
	"labia_persuasion": false,
	"first_aid": false,
	"drug_torture_resistance": false,
	"resistance": false,
	"seduction": false,
	"survival": false,
	"tracking": false,
	#Inventory
	"index": [],
	"names": [],
	"base_damage": [],
	"base_defense": [],
	"requirements": [],
	"durability": [],
	"rarity": [],
	"ability": []
}

var tempSheetPath = null

var firstGoal = false
var noSkills = false

var avaliable_points = 30
var avaliable_skills = 5
var last_goal = 1
var goals = 0
var points = 10
var skills = 1

func _ready():
	$FileDialog.current_dir = "user://sheets/"
	$FileDialog2.current_dir = "user://sheets/"
	$FileDialog.current_path = "user://sheets/"
	$FileDialog2.current_path = "user://sheets/"
	$FileDialog.add_filter("*.sheet")
	$FileDialog2.add_filter("*.sheet")
	pass

func _process(delta):
	for button in get_tree().get_nodes_in_group("skills_buttons"):
		_skills(button)
	_points_skills()
	_sync_labels()


func _points_skills():
	if temp_sheet["level"] == 5 and !firstGoal:
		last_goal = 5
		avaliable_points += points
		goals +=1
		if !noSkills:
			avaliable_skills += skills
		firstGoal = true
	elif temp_sheet["level"] > 5:
		if goals == 4:
			points += 10
			goals = 0
		if last_goal == temp_sheet["level"] / 2:
			avaliable_points += points
			if !noSkills:
				skills += 1
				avaliable_skills += skills
			goals +=1
			last_goal = temp_sheet["level"]
	if temp_sheet["level"] == 480 and !noSkills:
		avaliable_points += 10
		noSkills = true

func _skills(button: CheckBox):
	if avaliable_skills > 0:
		button.disabled = false
		if button.pressed and !button.pressed_before:
			avaliable_skills -= 1
			button.pressed_before = true
	else:
		if !button.pressed:
			button.disabled = true
	if !button.pressed and button.pressed_before:
			avaliable_skills += 1
			button.pressed_before = false
	pass # Replace with function body.

func _sync_labels():
	$HBoxContainer/VBoxContainer/HBoxContainer/Label.text = String(temp_sheet["level"])
	$HBoxContainer/VBoxContainer/HBoxContainer2/Label.text = String(temp_sheet["strength"])
	$HBoxContainer/VBoxContainer/HBoxContainer3/Label.text = String(temp_sheet["velocity"])
	$HBoxContainer/VBoxContainer/HBoxContainer4/Label.text = String(temp_sheet["intelligence"])
	$HBoxContainer/VBoxContainer/HBoxContainer5/Label.text = String(temp_sheet["wisdom"])
	$HBoxContainer/VBoxContainer/HBoxContainer6/Label.text = String(temp_sheet["charisma"])
	$HBoxContainer/VBoxContainer/HBoxContainer7/Label.text = String(temp_sheet["vitality"])
	$HBoxContainer/VBoxContainer/HBoxContainer8/Label.text = String(temp_sheet["sanity"])
	$HBoxContainer/VBoxContainer2/Label2.text = String(avaliable_points)
	$HBoxContainer/VBoxContainer2/Label4.text = String(avaliable_skills)

func _sync_vars():
	temp_sheet["name"] = String($HBoxContainer/VBoxContainer/LineEdit.text)
	temp_sheet["race"] = String($HBoxContainer/VBoxContainer/LineEdit2.text)
	temp_sheet["class"] = String($HBoxContainer/VBoxContainer/LineEdit3.text)
	temp_sheet["cold_steel"] = bool($HBoxContainer/GridContainer/CheckBox.pressed)
	temp_sheet["handguns"] = bool($HBoxContainer/GridContainer/CheckBox2.pressed)
	temp_sheet["medium_weapons"] = bool($HBoxContainer/GridContainer/CheckBox3.pressed)
	temp_sheet["long_weapons"] = bool($HBoxContainer/GridContainer/CheckBox4.pressed)
	temp_sheet["heavy_weapons"] = bool($HBoxContainer/GridContainer/CheckBox5.pressed)
	temp_sheet["break-ins"] = bool($HBoxContainer/GridContainer/CheckBox6.pressed)
	temp_sheet["martial_arts"] = bool($HBoxContainer/GridContainer/CheckBox7.pressed)
	temp_sheet["attention_notice"] = bool($HBoxContainer/GridContainer/CheckBox8.pressed)
	temp_sheet["fight"] = bool($HBoxContainer/GridContainer/CheckBox9.pressed)
	temp_sheet["credibility"] = bool($HBoxContainer/GridContainer/CheckBox10.pressed)
	temp_sheet["personal_cares"] = bool($HBoxContainer/GridContainer/CheckBox11.pressed)
	temp_sheet["disguise"] = bool($HBoxContainer/GridContainer/CheckBox12.pressed)
	temp_sheet["education_general_culture"] = bool($HBoxContainer/GridContainer/CheckBox13.pressed)
	temp_sheet["hide_evade"] = bool($HBoxContainer/GridContainer/CheckBox14.pressed)
	temp_sheet["dodge_escape"] = bool($HBoxContainer/GridContainer/CheckBox15.pressed)
	temp_sheet["falsification"] = bool($HBoxContainer/GridContainer/CheckBox16.pressed)
	temp_sheet["stealth"] = bool($HBoxContainer/GridContainer/CheckBox17.pressed)
	temp_sheet["questioning"] = bool($HBoxContainer/GridContainer/CheckBox18.pressed)
	temp_sheet["intimidation"] = bool($HBoxContainer/GridContainer/CheckBox19.pressed)
	temp_sheet["leadership"] = bool($HBoxContainer/GridContainer/CheckBox20.pressed)
	temp_sheet["medicines"] = bool($HBoxContainer/GridContainer/CheckBox21.pressed)
	temp_sheet["medicine"] = bool($HBoxContainer/GridContainer/CheckBox22.pressed)
	temp_sheet["bargain"] = bool($HBoxContainer/GridContainer/CheckBox23.pressed)
	temp_sheet["perception"] = bool($HBoxContainer/GridContainer/CheckBox24.pressed)
	temp_sheet["labia_persuasion"] = bool($HBoxContainer/GridContainer/CheckBox25.pressed)
	temp_sheet["first_aid"] = bool($HBoxContainer/GridContainer/CheckBox26.pressed)
	temp_sheet["drug_torture_resistance"] = bool($HBoxContainer/GridContainer/CheckBox27.pressed)
	temp_sheet["resistance"] = bool($HBoxContainer/GridContainer/CheckBox28.pressed)
	temp_sheet["seduction"] = bool($HBoxContainer/GridContainer/CheckBox29.pressed)
	temp_sheet["survival"] = bool($HBoxContainer/GridContainer/CheckBox30.pressed)
	temp_sheet["tracking"] = bool($HBoxContainer/GridContainer/CheckBox31.pressed)

func _sync_lines():
	$HBoxContainer/VBoxContainer/LineEdit.text = String(temp_sheet["name"])
	$HBoxContainer/VBoxContainer/LineEdit2.text = String(temp_sheet["race"])
	$HBoxContainer/VBoxContainer/LineEdit2.text = String(temp_sheet["class"])
	$HBoxContainer/GridContainer/CheckBox.pressed = bool(temp_sheet["cold_steel"])
	$HBoxContainer/GridContainer/CheckBox2.pressed = bool(temp_sheet["handguns"])
	$HBoxContainer/GridContainer/CheckBox3.pressed = bool(temp_sheet["medium_weapons"])
	$HBoxContainer/GridContainer/CheckBox4.pressed = bool(temp_sheet["long_weapons"])
	$HBoxContainer/GridContainer/CheckBox5.pressed = bool(temp_sheet["heavy_weapons"])
	$HBoxContainer/GridContainer/CheckBox6.pressed = bool(temp_sheet["break-ins"])
	$HBoxContainer/GridContainer/CheckBox7.pressed = bool(temp_sheet["martial_arts"])
	$HBoxContainer/GridContainer/CheckBox8.pressed = bool(temp_sheet["attention_notice"])
	$HBoxContainer/GridContainer/CheckBox9.pressed = bool(temp_sheet["fight"])
	$HBoxContainer/GridContainer/CheckBox10.pressed = bool(temp_sheet["credibility"])
	$HBoxContainer/GridContainer/CheckBox11.pressed = bool(temp_sheet["personal_cares"])
	$HBoxContainer/GridContainer/CheckBox12.pressed = bool(temp_sheet["disguise"])
	$HBoxContainer/GridContainer/CheckBox13.pressed = bool(temp_sheet["education_general_culture"])
	$HBoxContainer/GridContainer/CheckBox14.pressed = bool(temp_sheet["hide_evade"])
	$HBoxContainer/GridContainer/CheckBox15.pressed = bool(temp_sheet["dodge_escape"])
	$HBoxContainer/GridContainer/CheckBox16.pressed = bool(temp_sheet["falsification"])
	$HBoxContainer/GridContainer/CheckBox17.pressed = bool(temp_sheet["stealth"])
	$HBoxContainer/GridContainer/CheckBox18.pressed = bool(temp_sheet["questioning"])
	$HBoxContainer/GridContainer/CheckBox19.pressed = bool(temp_sheet["intimidation"])
	$HBoxContainer/GridContainer/CheckBox20.pressed = bool(temp_sheet["leadership"])
	$HBoxContainer/GridContainer/CheckBox21.pressed = bool(temp_sheet["medicines"])
	$HBoxContainer/GridContainer/CheckBox22.pressed = bool(temp_sheet["medicine"])
	$HBoxContainer/GridContainer/CheckBox23.pressed = bool(temp_sheet["bargain"])
	$HBoxContainer/GridContainer/CheckBox24.pressed = bool(temp_sheet["perception"])
	$HBoxContainer/GridContainer/CheckBox25.pressed = bool(temp_sheet["labia_persuasion"])
	$HBoxContainer/GridContainer/CheckBox26.pressed = bool(temp_sheet["first_aid"])
	$HBoxContainer/GridContainer/CheckBox27.pressed = bool(temp_sheet["drug_torture_resistance"])
	$HBoxContainer/GridContainer/CheckBox28.pressed = bool(temp_sheet["resistance"])
	$HBoxContainer/GridContainer/CheckBox29.pressed = bool(temp_sheet["seduction"])
	$HBoxContainer/GridContainer/CheckBox30.pressed = bool(temp_sheet["survival"])
	$HBoxContainer/GridContainer/CheckBox31.pressed = bool(temp_sheet["tracking"])

func _on_Button_button_down():
	_sync_vars()
	
	if avaliable_points == 0 and avaliable_skills == 0: 
		if tempSheetPath != null:
			SaveSistem.save_data(tempSheetPath, temp_sheet)
		else:
			$FileDialog2.popup_centered()
			$FileDialog2.popup()
	else:
		$AcceptDialog.popup_centered()
		$AcceptDialog.popup()


func _on_Button2_button_down():
	$FileDialog.popup_centered()
	$FileDialog.popup()
	pass 

func _on_ButtonRemoveLevel_button_down():
	if temp_sheet["level"] > 1:
		temp_sheet["level"] -= 1
	pass 

func _on_ButtonAddLevel_button_down():
	if temp_sheet["level"] >= 1:
		temp_sheet["level"] += 1
	pass 

func _on_ButtonRemoveStrength_button_down():
	if temp_sheet["strength"] > 5:
		temp_sheet["strength"] -= 1
		avaliable_points += 1
	pass 

func _on_ButtonAddStrength_button_down():
	if avaliable_points > 0:
		temp_sheet["strength"] += 1
		avaliable_points -= 1
	pass 

func _on_ButtonRemoveVelocity_button_down():
	if temp_sheet["velocity"] > 5:
		temp_sheet["velocity"] -= 1
		avaliable_points += 1
	pass 

func _on_ButtonAddVelocity_button_down():
	if avaliable_points > 0:
		temp_sheet["velocity"] += 1
		avaliable_points -= 1
	pass 

func _on_ButtonRemoveIntelligence_button_down():
	if temp_sheet["intelligence"] > 5:
		temp_sheet["intelligence"] -= 1
		avaliable_points += 1
	pass 

func _on_ButtonAddIntelligence_button_down():
	if avaliable_points > 0:
		temp_sheet["intelligence"] += 1
		avaliable_points -= 1
	pass 

func _on_ButtonRemoveWisdom_button_down():
	if temp_sheet["wisdom"] > 5:
		temp_sheet["wisdom"] -= 1
		avaliable_points += 1
	pass 

func _on_ButtonAddWisdom_button_down():
	if avaliable_points > 0:
		temp_sheet["wisdom"] += 1
		avaliable_points -= 1
	pass 

func _on_ButtonRemoveCharisma_button_down():
	if temp_sheet["charisma"] > 5:
		temp_sheet["charisma"] -= 1
		avaliable_points += 1
	pass 

func _on_ButtonAddCharisma_button_down():
	if avaliable_points > 0:
		temp_sheet["charisma"] += 1
		avaliable_points -= 1
	pass 

func _on_ButtonRemoveVitality_button_down():
	if temp_sheet["vitality"] > 5:
		temp_sheet["vitality"] -= 1
		avaliable_points += 1
	pass 

func _on_ButtonAddVitality_button_down():
	if avaliable_points > 0:
		temp_sheet["vitality"] += 1
		avaliable_points -= 1
	pass 

func _on_ButtonRemoveSanity_button_down():
	if temp_sheet["sanity"] > 0:
		temp_sheet["sanity"] -= 1
		avaliable_points += 1
	pass 

func _on_ButtonAddSanity_button_down():
	if avaliable_points > 0:
		temp_sheet["sanity"] += 1
		avaliable_points -= 1
	pass 

# warning-ignore:shadowed_variable
func _on_FileDialog_file_selected(path):
	tempSheetPath = path
	temp_sheet = SaveSistem.load_data(path)
	_sync_lines()
	pass 

func _on_FileDialog2_file_selected(path):
	tempSheetPath = path
	SaveSistem.save_data(path, temp_sheet)
	pass 

func _on_FileDialog_about_to_show():
	get_tree().paused = true
	pass 

func _on_FileDialog2_about_to_show():
	get_tree().paused = true
	pass 

func _on_FileDialog_popup_hide():
	get_tree().paused = false
	pass 

func _on_FileDialog2_popup_hide():
	get_tree().paused = false
	pass 

