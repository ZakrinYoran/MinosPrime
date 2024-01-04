extends "res://SoupModOptions/ModOptions.gd"

var sound

func _ready():
	var minosMenu = generate_menu("minosOptions", "Minos Prime Options")
	minosMenu.add_label("mainlbl", "Minos Prime Options")
	var btnVoice = minosMenu.add_bool("voiceLines", "Play Voice Lines", true)
	var btnVariable = minosMenu.add_bool("variableSounds", "Variable Voice Lines", false)

	btnVoice.connect("option_changed", ModOverride, "minosChanged")
	btnVariable.connect("option_changed", ModOverride, "minosChanged")

	add_menu(minosMenu)
	load_settings("minosOptions")

#	ModOverride.minosSounds = btn.btn.pressed
