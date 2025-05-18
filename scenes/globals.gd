extends Node

var baguettes = []
var player

var playerOverPond = false

func getBaguettesInRange():
	return baguettes.filter(func(baguette): return baguette.isInRange)


func setPlayrOverPond(value) ->void:
	playerOverPond = value
	print(playerOverPond)

