extends Node

var baguettes = []
var player

func getBaguettesInRange():
	return baguettes.filter(func(baguette): return baguette.isInRange)
