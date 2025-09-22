extends AudioStreamPlayer

const background_music : AudioStream = preload("res://assets/audio/music/Espoir (version Star Deception).mp3")

func _ready() -> void:
	if !OS.has_feature("dedicated_server"):
		bus = "Music"
		set_bus_volume("Master", 0.5)
		set_bus_volume("Music", 0.5)
		set_bus_volume("SFX", 0.5)
		set_bus_volume("VoIP", 0.5)
		play_background_music()

func set_bus_mute(bus_name : String, mute : bool) -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index(bus_name), mute)

func set_bus_volume(bus_name : String, volume : float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index(bus_name), clamp(volume, 0, 1))

func get_bus_volume(bus_name : String) -> float:
	return AudioServer.get_bus_volume_linear(AudioServer.get_bus_index(bus_name))

func is_bus_mute(bus_name : String) -> bool:
	return AudioServer.is_bus_mute(AudioServer.get_bus_index(bus_name))

func play_music(music : AudioStream) -> void:
	if stream != music:
		stream = music
		play()

func play_background_music() -> void:
	play_music(background_music)
