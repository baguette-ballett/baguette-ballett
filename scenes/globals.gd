extends Node

var ducklingsLifeLeft = [100, 100, 100]

var baguettes = []
var player
var game_won = false

var playerOverPond = false

func getBaguettesInRange():
	return baguettes.filter(func(baguette): return baguette.isInRange)


func setPlayrOverPond(value) ->void:
	playerOverPond = value
