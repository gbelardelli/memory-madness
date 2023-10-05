extends Node

const GROUP_TILE: String = "tile"

const LEVELS: Dictionary = {
	1: { "rows": 3, "cols": 4 },
	2: { "rows": 4, "cols": 4 },
	3: { "rows": 4, "cols": 5 },
	4: { "rows": 5, "cols": 6 },
	5: { "rows": 6, "cols": 6 },
	6: { "rows": 6, "cols": 7 }
}

func get_level_selection(level_num:int) -> Dictionary:
	var lvl_data=LEVELS[level_num]
	var num_tiles = lvl_data.rows * lvl_data.cols
	var target_pairs: int = num_tiles / 2
	var selected_level_images = []
	
	ImageManager.shuffle_images()
	for i in range(target_pairs):
		selected_level_images.append(ImageManager.get_image(i))
		selected_level_images.append(ImageManager.get_image(i))
	
	selected_level_images.shuffle()
	selected_level_images.shuffle()
	
	return {
		"target_pairs": target_pairs,
		"num_cols": lvl_data.cols,
		"image_list": selected_level_images
	}

func clear_node_of_group(group:String) -> void:
	for n in get_tree().get_nodes_in_group(group):
		n.queue_free()
