extends Control


@onready var time_left_label = %TimeLeftLabel
@onready var break_time_popup = %BreakTimePopup
@onready var timer = %Timer
@onready var audio_stream_player = %AudioStreamPlayer


func _process(delta):
	time_left_label.text = timer.time_left


func _on_timer_timeout():
	audio_stream_player.play()


func _on_start_button_pressed():
	timer.start()
