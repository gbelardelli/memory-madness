extends Control

@export var level_button_scene: PackedScene
@onready var hb_levels = $VB/HBLevels
@onready var title_label = $VB/TitleLabel
@onready var music_label = $VB/MusicButton/MusicLabel

var _music_enabled:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_grid()
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_property(title_label, "label_settings:font_color:a", 0, 0.5)
	tween.tween_property(title_label, "label_settings:font_color:a", 1, 0.7).set_delay(0.2)

func create_level_button(lvl:int) -> void:
	var new_lb = level_button_scene.instantiate()
	hb_levels.add_child(new_lb)
	new_lb.set_level_number(lvl)
	
func setup_grid() -> void:
	for level in GameManager.LEVELS:
		create_level_button(level)


func _on_music_button_pressed():
	_music_enabled = !_music_enabled
	if _music_enabled == true:
		music_label.text = "Music Off"
	else:
		music_label.text = "Music On"

	SoundManager.enable_music(_music_enabled)
