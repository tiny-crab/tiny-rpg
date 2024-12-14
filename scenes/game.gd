extends Node2D

var base_level = preload("res://levels/test_level.tscn")

func _ready():
    add_child(base_level.instantiate())
