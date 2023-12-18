extends Node

var _savedObjects = []



func _init(modLoader = ModLoader):
	  installScriptExtension("res://MinosPrime/CharacterSelect.gd")
#func _init(modLoader = ModLoader):
#	  modLoader.installScriptExtension("res://MinosPrime/CharacterSelect.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Helper function to replace scenes
func replaceScene(path:String, oldPath:String = "none"):
	print("Updating scene: %s" % path)
	var newScene
	var oldScene

	if oldPath == "none":
		newScene = str("res://MinosPrime/" + path)
		oldScene = str("res://" + path)

	else:
		newScene = path
		oldScene = oldPath

	var scene = load(newScene)
	scene.take_over_path(oldScene)
	_savedObjects.append(scene)
	print("Finished updating: %s" % oldScene)


# Helper function to extend scripts
func installScriptExtension(childPath:String):
	var childScript = ResourceLoader.load(childPath)
	childScript.new()
	var parentScript = childScript.get_base_script()
	var parentPath = parentScript.resource_path
	print("Installing script extension: %s <- %s" % [parentPath, childPath])
	childScript.take_over_path(parentPath)
