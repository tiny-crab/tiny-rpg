extends Node2D

var lex: Lex

@onready var overworld: Overworld = $Overworld
@onready var battlefield: Battlefield = $Battlefield
@onready var spawnloc = $SpawnLoc1.global_position
@onready var toBattle = false

func _ready():
    lex = load("res://lex.tscn").instantiate()
    var spawn_position = overworld.local_to_map(spawnloc)
    lex.global_position = overworld.map_to_local(spawn_position)
    add_child(lex)
    lex.swap_mode(toBattle)

func _process(delta):
    if Input.is_action_just_pressed("switch_perspective"):
        toBattle = !toBattle
        lex.swap_mode(toBattle)
        if toBattle:
            battlefield.render(lex)
        else:
            overworld.render(lex)
