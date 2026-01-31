extends CanvasLayer


var label_container: Control
var label_node: Label
var timer_node: Timer
var ticker_timer: Timer
var ticker_offset: float = 0.0
var ticker_speed: float = 70.0 # pixels per second (slower scroll)
var ticker_text: String = ""
var ticker_text_width: float = 0.0
var bg: Panel
var tween: Tween
var ticker_loops: int = 0
var max_ticker_loops: int = 50


func _ready():
	self.layer = 1024
	self.visible = true

	# Add a transparent, rounded background using Panel + StyleBoxFlat
	bg = Panel.new()
	bg.name = "PopupBG"
	bg.size = Vector2(340, 38)
	bg.position = Vector2(0, 0)
	bg.z_index = 1024
	var stylebox := StyleBoxFlat.new()
	stylebox.bg_color = Color(0.1, 0.1, 0.1, 0.7)
	stylebox.corner_radius_top_left = 12
	stylebox.corner_radius_top_right = 12
	stylebox.corner_radius_bottom_left = 12
	stylebox.corner_radius_bottom_right = 12
	stylebox.corner_detail = 8
	bg.add_theme_stylebox_override("panel", stylebox)
	bg.visible = false
	add_child(bg)

	label_container = Control.new()
	label_container.size = Vector2(340, 38)
	label_container.position = Vector2(0, 0)
	label_container.clip_contents = true
	label_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label_container.size_flags_vertical = Control.SIZE_EXPAND_FILL
	bg.add_child(label_container)

	label_node = Label.new()
	label_node.text = ""
	label_node.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label_node.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label_node.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label_node.size_flags_vertical = Control.SIZE_EXPAND_FILL
	label_node.position = Vector2(0, 0)
	label_node.size = Vector2(340, 38)
	label_node.z_index = 1025
	label_node.clip_text = false
	var theme := preload("res://Themes/button.tres")
	label_node.add_theme_font_override("font", theme.get_font("font", "Button"))
	label_node.add_theme_color_override("font_color", Color(1,1,1,1))
	label_node.add_theme_font_size_override("font_size", 18)
	# Add outline for visibility
	label_node.add_theme_color_override("font_outline_color", Color(0,0,0,1))
	label_node.add_theme_constant_override("outline_size", 2)
	label_container.add_child(label_node)

	timer_node = Timer.new()
	timer_node.one_shot = true
	timer_node.wait_time = 3.5
	timer_node.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer_node)

	ticker_timer = Timer.new()
	ticker_timer.one_shot = false
	ticker_timer.wait_time = 0.016
	ticker_timer.connect("timeout", Callable(self, "_on_ticker_timer_timeout"))
	add_child(ticker_timer)

	# Position at top right: move background (and label is child of bg)
	var win_size = DisplayServer.window_get_size()
	bg.position = Vector2(win_size.x - 360, 20)

	# Tween for fade in/out (Godot 4: use create_tween())
	tween = null


func show_now_playing(song_title: String):
	if label_node == null:
		push_warning("[NowPlayingPopup] label_node is null!")
		return
	var clean_title = song_title.strip_edges()
	if clean_title == "":
		push_warning("[NowPlayingPopup] show_now_playing called with blank song_title! Not showing popup.")
		label_node.text = ""
		self.visible = false
		bg.visible = false
		label_node.visible = false
		print("[NowPlayingPopup] Popup not shown due to blank title.")
		return
	# Robustly reset all state and kill any running tweens
	if tween:
		tween.kill()
		tween = null
	ticker_timer.stop()
	timer_node.stop()
	bg.modulate.a = 1.0
	label_container.modulate.a = 1.0
	label_node.modulate.a = 1.0
	ticker_offset = 0.0
	ticker_loops = 0
	label_node.position.x = 0
	label_node.text = ""
	self.layer = 1024
	self.visible = true
	self.show()
	bg.visible = true
	bg.show()
	label_container.visible = true
	label_container.show()
	label_node.visible = true
	label_node.show()
	# Set text only after all resets
	var base_text = "🎵 " + clean_title + "    "
	var font = label_node.get_theme_font("font")
	if font == null:
		font = label_node.get_font("font")
	# Dynamically repeat so ticker is always much wider than container
	var min_width = label_container.size.x * 2.5
	var repeat_count = 2
	var test_text = base_text.repeat(repeat_count)
	var test_width = font.get_string_size(test_text).x if font else 0.0
	while test_width < min_width and repeat_count < 20:
		repeat_count += 1
		test_text = base_text.repeat(repeat_count)
		test_width = font.get_string_size(test_text).x if font else 0.0
	ticker_text = test_text
	label_node.text = ticker_text
	label_node.hide()
	label_node.show()
	label_node.queue_redraw()
	ticker_offset = 0.0
	label_node.position.x = 0
	print("[NowPlayingPopup] Showing popup with title: ", clean_title, " | label_node.text: ", label_node.text, " | bg.modulate.a: ", bg.modulate.a, " | label_node.visible: ", label_node.visible)
	ticker_text_width = font.get_string_size(ticker_text).x if font else 0.0
	print("[NowPlayingPopup] ticker_text_width:", ticker_text_width, " label_container.size.x:", label_container.size.x, " (repeat_count=", repeat_count, ")")
	# Fallback: if ticker_text_width is 0 or too small, force scrolling
	if ticker_text_width < 10.0:
		ticker_text_width = 1000.0
		print("[NowPlayingPopup] WARNING: ticker_text_width too small, forcing scroll width to 1000")
	# Wait one frame to ensure label is redrawn before starting ticker
	await get_tree().process_frame
	ticker_timer.start()
	timer_node.wait_time = 7.0
	timer_node.start()


func _on_timer_timeout():
	# Fade out after ticker loops
	ticker_timer.stop()
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(bg, "modulate:a", 0.0, 0.5)
	await tween.finished
	bg.visible = false
	label_node.visible = false
	print("[NowPlayingPopup] Popup hidden after timer.")

func _on_ticker_timer_timeout():
	# Always scroll, even for short text
	ticker_offset += ticker_speed * ticker_timer.wait_time
	if ticker_offset > ticker_text_width / 2:
		ticker_offset = 0.0
	label_node.position.x = 0 - ticker_offset
	print("[NowPlayingPopup] ticker_timer: ticker_offset=", ticker_offset, ", label_node.position.x=", label_node.position.x)
