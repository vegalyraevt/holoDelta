extends Button

func _ready():
	text = "⏭"
	set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT)
	offset_right = -20
	offset_top = 60
	mouse_filter = Control.MOUSE_FILTER_STOP
	z_index = 1000
	connect("pressed", Callable(self, "_on_skip_pressed"))

func _on_skip_pressed():
	print("[SkipSongButton] Skip button pressed!")
	if typeof(GlobalBGM) == TYPE_OBJECT and GlobalBGM.has_method("skip_bgm_track"):
		print("[SkipSongButton] Calling skip_bgm_track() on GlobalBGM global autoload")
		GlobalBGM.skip_bgm_track()
	else:
		print("[SkipSongButton] GlobalBGM autoload not found or missing skip_bgm_track!")
