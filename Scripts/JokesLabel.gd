extends RichTextLabel

var jokes = ["[right][color=purple][wave amp=50 freq=2] Respeitem Jorge 2 O rei dos esqueletos [/wave][/color][/right]",
"[right][color=purple][wave amp=50 freq=2] Felipe Neto sempre sensato [/wave][/color][/right]",
"[right][color=purple][wave amp=50 freq=2] É os guri [/wave][/color][/right]",
"[right][color=purple][wave amp=50 freq=2] Vamos Lutar !!!!!!!!!! [/wave][/color][/right]",
"[right][color=purple][wave amp=50 freq=2] Olá meu nome e Bibliotecario, em que posso ajudar? [/wave][/color][/right]",
"[right][color=purple][wave amp=50 freq=2] Que Zamire nos proteja [/wave][/color][/right]"]

var rng = RandomNumberGenerator.new()

func _init():
	rng.randomize()
	var a = jokes.size() - 1
	var b = rng.randi_range(0, a)
	bbcode_text = jokes[b]
