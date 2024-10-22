extends Node2D

@onready var lex = $LexOverworld

@onready var tilemap: TileMap = $Background
@onready var battlefield: Battlefield = $Battlefield
@onready var spawnloc = $SpawnLoc1.global_position
@onready var tile_mode = false

func _ready():
    var spawn_position = tilemap.local_to_map(spawnloc)
    lex.global_position = tilemap.map_to_local(spawn_position)

func _process(delta):
    if Input.is_action_just_pressed("switch_perspective"):
        tile_mode = !tile_mode
        if tile_mode:
            battlefield.render([lex])

