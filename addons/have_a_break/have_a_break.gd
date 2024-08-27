@tool
extends Control


@onready var time_left_label = %TimeLeftLabel
@onready var break_time_popup = %BreakTimePopup
@onready var start_button = %StartButton
@onready var pause_button = %PauseButton
@onready var reset_button = %ResetButton

@onready var sound_check_box = %SoundCheckBox

@onready var timer = %Timer
@onready var audio_stream_player = %AudioStreamPlayer


func _ready():
	timer.paused = true
	time_left_label.text = "Time left: " + _sec_to_string(timer.wait_time)


func _process(delta):
	if not timer.is_stopped():
		time_left_label.text = "Time left: " + _sec_to_string(timer.time_left)
	else:
		time_left_label.text = "Time left: " + _sec_to_string(timer.wait_time)
	
	start_button.disabled = not timer.paused
	pause_button.disabled = timer.paused


func _sec_to_string(sec: int):
	var seconds = sec % 60
	var minutes = (sec / 60) % 60
	var hours = (sec / 60) / 60
	return "%02d:%02d:%02d" % [hours, minutes, seconds]


func _on_timer_timeout():
	if sound_check_box.button_pressed:
		audio_stream_player.play()
	break_time_popup.show()


func _on_start_button_pressed():
	timer.paused = false
	if timer.time_left == 0:
		timer.start()


func _on_pause_button_pressed():
	timer.paused = true


func _on_reset_button_pressed():
	timer.paused = true
	timer.stop()


func _on_stop_button_pressed():
	audio_stream_player.stop()
	break_time_popup.hide()
	_on_reset_button_pressed()
