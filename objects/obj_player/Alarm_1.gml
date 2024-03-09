image_index = 0
audio_play_sound(player_punch, 3, false)
instance_create_layer(obj_player.x, obj_player.y, layer_get_id("Environment"), obj_punchhitbox)
global.punching = 1
alarm[2] = (room_speed * 0.25)
