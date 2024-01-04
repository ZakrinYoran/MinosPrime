extends Node

var _savedObjects = []


func _init(modLoader = ModLoader):
	print("Initializing Minos Prime")
	
	installScriptExtension("res://MinosPrime/ModOverride.gd")
	installScriptExtension("res://MinosPrime/CharacterSelect.gd")

# Check if mod options is installed
	if ResourceLoader.exists("res://SoupModOptions/ModOptions.gd"):
		installScriptExtension("res://MinosPrime/ModOptions.gd")
	else:
		print("Mod Options not installed, settings not availible.")


# Helper function to replace scenes
func replaceScene(path:String, oldPath:String):
	var scene = load(path)
	scene.take_over_path(oldPath)
	print("Replacing Scene: %s <- %s" % [oldPath, path])
	_savedObjects.append(scene)


# Helper function to extend scripts
func installScriptExtension(childPath:String):
	var childScript = ResourceLoader.load(childPath)
	childScript.new()
	var parentScript = childScript.get_base_script()
	var parentPath = parentScript.resource_path
	print("Installing script extension: %s <- %s" % [parentPath, childPath])
	childScript.take_over_path(parentPath)
