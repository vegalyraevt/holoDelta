
extends Node

var _bgm_playlist: Array = []
var _bgm_index: int = 0
var _bgm_player: AudioStreamPlayer = null
var _now_playing_popup: Node = null
var _skip_button: Node = null

func _ready():
	# Ensure skip action exists in Input Map
	if not InputMap.has_action("bgm_skip"):
		InputMap.add_action("bgm_skip")
	# Add overlays to the root viewport, using call_deferred to avoid timing issues
	var root = get_tree().get_root()
	if not root.has_node("NowPlayingPopup"):
		_now_playing_popup = preload("res://Scenes/NowPlayingPopup.tscn").instantiate()
		root.call_deferred("add_child", _now_playing_popup)
	else:
		_now_playing_popup = root.get_node("NowPlayingPopup")
	if not root.has_node("SkipSongButtonLayer"):
		_skip_button = preload("res://Scenes/SkipSongButton.tscn").instantiate()
		root.call_deferred("add_child", _skip_button)
	else:
		_skip_button = root.get_node("SkipSongButtonLayer")
	# Add a global AudioStreamPlayer if not present
	if not root.has_node("GlobalBGMPlayer"):
		_bgm_player = AudioStreamPlayer.new()
		_bgm_player.name = "GlobalBGMPlayer"
		root.call_deferred("add_child", _bgm_player)
	else:
		_bgm_player = root.get_node("GlobalBGMPlayer") as AudioStreamPlayer
	# Defer playlist setup until overlays and player are in the tree
	call_deferred("_setup_bgm_playlist")
	set_process(true)

# Listen for skip keybind in _unhandled_input to avoid repeated firing
func _unhandled_input(event):
	if InputMap.has_action("bgm_skip") and event.is_action_pressed("bgm_skip"):
		skip_bgm_track()

func _collect_audio_files() -> Array:
	var found := []
	var exts := [".mp3", ".ogg", ".wav", ".flac", ".aiff"]
	for base in ["user://Music", "res://Music"]:
		var dir = DirAccess.open(base)
		if dir:
			for fname in dir.get_files():
				for ext in exts:
					if fname.to_lower().ends_with(ext):
						found.append(base + "/" + fname)
						break
	return found

func _setup_bgm_playlist() -> void:
	var files = _collect_audio_files()
	_bgm_playlist.clear()
	for p in files:
		var res = ResourceLoader.load(p)
		if res != null:
			_bgm_playlist.append(res)
	if _bgm_playlist.size() == 0:
		return
	_bgm_playlist.shuffle()
	_bgm_index = 0
	_bgm_player.stream = _bgm_playlist[_bgm_index]
	_bgm_player.bus = "BGM"
	_bgm_player.autoplay = true
	_bgm_player.play()
	_show_now_playing()
	if not _bgm_player.finished.is_connected(_on_bgm_finished):
		_bgm_player.finished.connect(_on_bgm_finished)

func _on_bgm_finished() -> void:
	if _bgm_playlist.size() == 0:
		return
	_bgm_player.stop()
	_bgm_index = (_bgm_index + 1) % _bgm_playlist.size()
	_bgm_player.stream = _bgm_playlist[_bgm_index]
	_bgm_player.play()
	_show_now_playing()

func skip_bgm_track() -> void:
	print("[GlobalBGM] skip_bgm_track called!")
	if _bgm_playlist.size() == 0:
		print("[GlobalBGM] Playlist empty, cannot skip.")
		return
	_bgm_player.stop()
	_bgm_index = (_bgm_index + 1) % _bgm_playlist.size()
	_bgm_player.stream = _bgm_playlist[_bgm_index]
	_bgm_player.play()
	print("[GlobalBGM] Skipped to index ", _bgm_index)
	_show_now_playing()

func _show_now_playing() -> void:
	if _bgm_playlist.size() == 0 or _now_playing_popup == null:
		print("[BGM] NowPlayingPopup not found or playlist empty")
		return
	var stream = _bgm_playlist[_bgm_index]
	if stream == null:
		print("[BGM] Stream is null at index ", _bgm_index)
		return
	var song_title = ""
	if stream.has_method("get_path"):
		song_title = stream.get_path().get_file().get_basename()
	elif stream.has("resource_path"):
		song_title = stream.resource_path.get_file().get_basename()
	else:
		print("[BGM] Stream at index ", _bgm_index, " has no valid path or resource_path: ", stream)
		return
	if song_title.strip_edges() == "":
		print("[BGM] Blank song title for stream at index ", _bgm_index, ": ", stream)
		return
	_now_playing_popup.layer = 100 # ensure on top
	_now_playing_popup.visible = true
	_now_playing_popup.show()
	if _now_playing_popup.has_method("show_now_playing"):
		print("[GlobalBGM] Calling show_now_playing on NowPlayingPopup with ", song_title)
		_now_playing_popup.show_now_playing(song_title)
	else:
		print("[GlobalBGM] NowPlayingPopup has no show_now_playing method!")
	print("[BGM] Now Playing: " + song_title)
