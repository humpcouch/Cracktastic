if place_meeting(x, y, obj_player)
{
    audio_play_sound(pickupCoin, 3, false)
    global.collectible += 1
    instance_destroy()
}
