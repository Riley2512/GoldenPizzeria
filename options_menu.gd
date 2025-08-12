extends Control

# Reference to the TabContainer
onready var tab_container = $TabContainer

# References to specific controls
onready var volume_slider = $TabContainer/Options/VolumeSlider  # Adjust name if different
onready var music_check = $TabContainer/Options/MusicCheckBox  # Adjust name if different

# Default volume value
var volume = 0.5

func _ready():
	# Set initial volume
	volume_slider.value = volume * 100  # Convert to percentage
	update_volume()
	
	# Connect signals
	volume_slider.connect("value_changed", self, "_on_volume_changed")
	music_check.connect("toggled", self, "_on_music_toggled")

func _on_volume_changed(value):
	volume = value / 100.0
	update_volume()

func _on_music_toggled(button_pressed):
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), !button_pressed)

func update_volume():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(volume))

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = !visible
		get_tree().paused = visible
