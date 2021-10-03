extends RichTextLabel

var jokes = ["[right][color=purple][wave amp=50 freq=2] Respeitem Jorge 2 O rei dos esqueletos [/wave][/color][/right]",
	"[right][color=purple][wave amp=50 freq=2] Que zamire nos proteja [/wave][/color][/right]",
	"[right][color=purple][wave amp=50 freq=2] Olá eu sou o Bibliotecario, em que posso lhe ajudar? [/wave][/color][/right]",
	"[right][color=purple][wave amp=50 freq=2] Vamos matar!!!!!!! [/wave][/color][/right]",
	"[right][color=purple][wave amp=50 freq=2] Lute como nunca, ganhe como sempre [/wave][/color][/right]",
	"[right][color=purple][wave amp=50 freq=2] A morte e igual a vida, so que ao contrario [/wave][/color][/right]",
	"[right][color=purple][wave amp=50 freq=2] A vitoria e uma duvida, e a derrota e uma certeza [/wave][/color][/right]",
]

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	var a = jokes.size() - 1
	var b = rng.randi_range(0, a)
	bbcode_text = jokes[b]
	pass
