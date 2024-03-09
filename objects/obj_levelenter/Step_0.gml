if (place_meeting(x, y, obj_player) && keyboard_check(vk_up))
{
    room_goto(doorDestination)
    audio_play_sound(Door_Closing_Sound_Effect, 3, false)
    global.collectible = 0
    global.playerHp = 5
}
