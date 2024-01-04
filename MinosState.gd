extends CharacterState

func setup_audio():
	if ModOverride.minosSounds:
		if ModOverride.minosVariableSounds:
			.setup_audio()
		else:
			if enter_sfx:
				enter_sfx_player = AudioStreamPlayer2D.new()
				add_child(enter_sfx_player)
				enter_sfx_player.bus = "Fx"
				enter_sfx_player.stream = enter_sfx
				enter_sfx_player.volume_db = enter_sfx_volume

			if sfx:
				sfx_player = AudioStreamPlayer2D.new()
				add_child(sfx_player)
				sfx_player.bus = "Fx"
				sfx_player.stream = sfx
				sfx_player.volume_db = sfx_volume
		
