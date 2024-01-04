extends "res://ModOverride.gd"

# If minos plays his voice lines
var minosSounds = true
# If the voicelines are randomly pitch shifted
var minosVariableSounds = false

func minosChanged(what, how):
	print("Setting: %s set to %s" % [what, how])
	match what:
		"voiceLines":
			minosSounds = how
		"variableSounds":
			minosVariableSounds = how
