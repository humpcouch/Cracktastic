function scr_gameover() //gml_Script_scr_gameover
{
    instance_destroy(obj_player)
    instance_destroy(obj_camera)
    audio_stop_all()
    room_goto(game_over)
    global.collectible = 0
    global.playerHealth = 5
}

