-- Target by the window's title string
hl.window_rule({
	match = { class = "wgpu_shader" },
	fullscreen_state = "2",
	workspace = "3 silent",
})

hl.window_rule({
	match = { title = "nvim-float-term" },
	float = true,
	center = true,
	size = { "monitor_w / 2", "monitor_h / 2" },
})
