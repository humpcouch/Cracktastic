if (place_meeting(x, y, obj_player) && exploded == 0)
{
    instance_destroy(obj_tntblock)
    audio_play_sound(Roblox_Rocket_Explosion_Sound, 3, false)
    image_index = 1
    exploded = 1
}
