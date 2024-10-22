extends TileMap
class_name Battlefield

func render(lex: Lex):
    var tile_coord = local_to_map(to_local(lex.global_position))
    lex.global_position = map_to_local(tile_coord)
    lex.tile_coord = tile_coord
