extends Node

const SOUND_MAIN_MENU = "main"
const SOUND_IN_GAME = "ingame"
const SOUND_SUCCESS = "success"
const SOUND_GAME_OVER = "gameover"
const SOUND_SELECT_TILE = "tile"
const SOUND_SELECT_BUTTON = "button"


const SOUNDS = {
	SOUND_MAIN_MENU: preload("res://assets/sounds/bgm_action_3.mp3"),
	SOUND_IN_GAME: preload("res://assets/sounds/bgm_action_4.mp3"),
	SOUND_SUCCESS: preload("res://assets/sounds/sfx_sounds_fanfare3.wav"),
	SOUND_GAME_OVER: preload("res://assets/sounds/sfx_sounds_powerup12.wav"),
	SOUND_SELECT_TILE: preload("res://assets/sounds/sfx_sounds_impact1.wav"),
	SOUND_SELECT_BUTTON: preload("res://assets/sounds/sfx_sounds_impact7.wav")
}

var _volume:float = 0
var _enable_music:bool = true

func play_sound(player: AudioStreamPlayer, key: String) -> void:
	if SOUNDS.has(key) == false:
		return

	if _enable_music == false:
		if key == SOUND_GAME_OVER or key == SOUND_MAIN_MENU or key == SOUND_IN_GAME:
			player.stop()
			return

	player.volume_db = _volume
	player.stop()
	player.stream = SOUNDS[key]
	player.play()

func play_button_click(player: AudioStreamPlayer) -> void:
	play_sound(player, SOUND_SELECT_BUTTON)

func play_tile_click(player: AudioStreamPlayer) -> void:
	play_sound(player, SOUND_SELECT_TILE)

func set_volume(vol: float)->void:
	_volume=vol
	
func enable_music(e: bool)->void:
	_enable_music = e
	SignalManager.on_music_enable.emit(_enable_music)
		
