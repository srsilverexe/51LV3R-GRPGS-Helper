extends Node

var settings = {
	"language": "en",
	"theme": "dark",
	"auto_save": true,
	"auto_save_frequency": 0,
	"dices_log_files": true,
	"dices_log_auto_clear": false,
	"dices_log_auto_clear_frequency": 0,
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
	if settings["dices_log_auto_clear"]:
		_dices_log_auto_cleaner()
	
	var f = File.new()
	if f.file_exists("user://settings.cfg"):
		if SaveSistem.load_data("user://settings.cfg") != {}:
			var a = SaveSistem.load_data("user://settings.cfg")
			for i in settings:
				if i in a:
					settings[i] = a[i]

# warning-ignore:unused_argument
func _process(delta):
	TranslationServer.set_locale(settings["language"])
	if settings["theme"] == "dark":
		get_tree().current_scene.theme = darkTheme
	elif settings["theme"] == "light":
		get_tree().current_scene.theme = lightTheme
	

func _input(event):
	if event.is_action_pressed("popup_shortcurts"):
		var f = shortcurts.instance()
		get_parent().add_child(f)
		f.popup_centered()
		f.popup()
	pass

func _dices_log_auto_cleaner():
	for i in SaveSistem.scan_folder("user://logs/"):
		if i == "DicesLog.log":
			var f = File.new()
			
			var lmt = OS.get_datetime_from_unix_time(f.get_modified_time("user://logs/DicesLog.log"))
			var at = OS.get_date()
			
			var tlmt = 0
			var tat = 0
			
			tlmt = lmt["day"] + (30 * lmt["month"]) + (365 * lmt["year"])
			print(tlmt)
			tat = at["day"] + (30 * at["month"]) + (365 * at["year"])
			print(tat)
			
			if tlmt != tat:
				var td = tat - tlmt
				
				if td >= settings["dice_log_auto_clear_frequency"]:
					var d = Directory.new()
					
					d.remove("user://logs/DicesLog.log")
			
