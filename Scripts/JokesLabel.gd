extends Label

var jokes = [
	"MENU_JOKE_1",
	"MENU_JOKE_2",
	"MENU_JOKE_3",
	"MENU_JOKE_4",
	"MENU_JOKE_5",
	"MENU_JOKE_6",
	"MENU_JOKE_7"
]

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	var a = jokes.size() - 1
	var b = rng.randi_range(0, a)
	text = jokes[b]
	pass
