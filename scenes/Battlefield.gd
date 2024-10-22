extends TileMap
class_name Battlefield

var lex_battle: LexBattle

func render(entities: Array[Node2D]):
    for entity in entities:
        if entity.name == "LexOverworld":
            var lex_battle = load("res://lex_battle.tscn").instantiate()
            var tile_coord = local_to_map(to_local(entity.global_position))
            self.add_child(lex_battle)
            lex_battle.global_position = map_to_local(tile_coord)
            lex_battle.tile_coord = tile_coord
            entity.hide()
