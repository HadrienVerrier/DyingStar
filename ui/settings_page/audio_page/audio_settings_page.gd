extends Control

@onready var General : HSlider = $MarginContainer/VBoxContainer/General/HSlider
@onready var Music : HSlider = $MarginContainer/VBoxContainer/Music/HSlider
@onready var SFX : HSlider = $MarginContainer/VBoxContainer/SFX/HSlider
@onready var VoIP : HSlider = $MarginContainer/VBoxContainer/VoIP/HSlider

func _ready() -> void:
	General.value = AudioManager.get_bus_volume("Master") * 100
	Music.value = AudioManager.get_bus_volume("Music") * 100
	SFX.value = AudioManager.get_bus_volume("SFX") * 100
	VoIP.value = AudioManager.get_bus_volume("VoIP") * 100
	
	General.value_changed.connect(_on_slider_value_changed.bind("Master"))
	Music.value_changed.connect(_on_slider_value_changed.bind("Music"))
	SFX.value_changed.connect(_on_slider_value_changed.bind("SFX"))
	VoIP.value_changed.connect(_on_slider_value_changed.bind("VoIP"))

func _on_mute_button_pressed(mute : bool, bus : String) -> void:
	AudioManager.set_bus_mute(bus, mute)

func _on_slider_value_changed(volume : float, bus : String) -> void:
	AudioManager.set_bus_volume(bus, volume / 100)
