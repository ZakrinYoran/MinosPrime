extends Node

var _savedObjects = []


func _init(modLoader = ModLoader):
	  installScriptExtension("res://MinosPrime/CharacterSelect.gd")


# Helper function to extend scripts
func installScriptExtension(childPath:String):
	var childScript = ResourceLoader.load(childPath)
	childScript.new()
	var parentScript = childScript.get_base_script()
	var parentPath = parentScript.resource_path
	print("Installing script extension: %s <- %s" % [parentPath, childPath])
	childScript.take_over_path(parentPath)
