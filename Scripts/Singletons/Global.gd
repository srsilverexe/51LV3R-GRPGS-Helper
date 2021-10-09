extends Node

var setings = {
	"Linguage": "en"
}

var shortcurts = preload("res://Scenes/Popups/PopupShortcurts.tscn")
var noFunc = preload("res://Scenes/Popups/UnvaliableFunc.tscn")

var curentSheet = null
var curentSheetPath = null

func _init():
	var dir = Directory.new()
	dir.open("user://")
	dir.make_dir("sheets")
	TranslationServer.set_locale("en")

func _ready():
	setings = SaveSistem.load_data("user://setings.cfg")

func _process(delta):
	TranslationServer.set_locale(setings["Linguage"])

func _input(event):
	if event.is_action_pressed("popup_shortcurts"):
		var f = shortcurts.instance()
		get_parent().add_child(f)
		f.popup_centered()
		f.popup()
	pass
