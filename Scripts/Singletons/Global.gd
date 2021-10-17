extends Node

var setings = {
	"Linguage": "en",
	"AutoSave": true,
	"AutoSaveFrequency": 0,
	"LogFiles": true,
	"MaxLogFiles": 1,
	"Theme": "dark",
}

var curentSheet = {
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
	"ability": [],
	#Grimory
	"g_index": [],
	"g_names": [],
	"g_ability": [],
	"g_requirements": [],
	"g_cost": [],
	"g_min_level": []
}

var curentSheetPath = null

var shortcurts = preload("res://Scenes/Popups/PopupShortcurts.tscn")
var noFunc = preload("res://Scenes/Popups/UnvaliableFunc.tscn")

var darkTheme = preload("res://Themes/Dark.theme")
var lightTheme = preload("res://Themes/Light.theme")

func _init():
	var dir = Directory.new()
	dir.open("user://")
	dir.make_dir("sheets")

func _ready():
	if SaveSistem.load_data("user://setings.cfg") != {}:
		var a = SaveSistem.load_data("user://setings.cfg")
		for i in setings:
			if i in a:
				i = a[i]

# warning-ignore:unused_argument
func _process(delta):
	TranslationServer.set_locale(setings["Linguage"])
	if setings["Theme"] == "dark":
		ProjectSettings.set_setting("gui/theme/custom", darkTheme)
	elif setings["Theme"] == "light":
		ProjectSettings.set_setting("gui/theme/custom", lightTheme)
	ProjectSettings.set_setting("logging/file_logging/enable_file_logging", setings["LogFiles"])
	ProjectSettings.set_setting("logging/file_logging/max_log_files", setings["MaxLogFiles"])


func _input(event):
	if event.is_action_pressed("popup_shortcurts"):
		var f = shortcurts.instance()
		get_parent().add_child(f)
		f.popup_centered()
		f.popup()
	pass
