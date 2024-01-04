extends Node

var _savedObjects = []


func _init(modLoader = ModLoader):
	installScriptExtension("res://MinosPrime/CharacterSelect.gd")


func _ready():
	pass


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
