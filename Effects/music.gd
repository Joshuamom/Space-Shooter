extends AudioStreamPlayer
var stream_pos = 0
var streams = [
	load("res://assets/music.mp3")
]

func ready():
	streams = streams[stream_pos]
	play()


func music_on_finished():
	stream_pos = (stream_pos + 1) % len(streams)
	streams = streams[stream_pos]
	play()
