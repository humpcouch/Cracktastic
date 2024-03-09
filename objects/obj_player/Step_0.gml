key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_jump = keyboard_check_pressed(ord("Z"))
key_sprint = keyboard_check(vk_shift)
key_crawl = keyboard_check(vk_down)
key_turn = (keyboard_check_pressed(vk_left) + keyboard_check_pressed(vk_right))
var move = (key_right - key_left)
global.hsp = (move * walksp)
global.vsp = (global.vsp + grv)
if (place_meeting(x, (y + 1), obj_wall) && key_jump == 1)
    global.vsp = -10
if (key_crawl == 1 && place_meeting(x, (y + 1), obj_wall) && global.sprinting == 0)
{
    global.hsp *= 0.6
    crawl = 1
}
else
    crawl = 0
if key_sprint
{
    alarm[0] = 1
    global.hsp = (image_xscale * walksp)
    global.sprinting = 1
    global.hsp *= global.accel
    if (global.accel <= 2 && place_meeting(x, (y + 1), obj_wall) && (!key_turn))
        global.accel += 0.025
}
else
{
    global.sprinting = 0
    global.accel = 0
}
if place_meeting((x + global.hsp), y, obj_wall)
{
    while (!(place_meeting((x + sign(global.hsp)), y, obj_wall)))
        x += sign(global.hsp)
    if (global.accel <= 0)
    {
        global.hsp = 0
        global.sprinting = 0
    }
    else
    {
        global.hsp = (global.hsp * -2)
        global.vsp = -6
        global.accel = 0
        global.knockback = 1
        global.sprinting = 0
    }
}
x += global.hsp
if place_meeting(x, (y + global.vsp), obj_wall)
{
    while (!(place_meeting(x, (y + sign(global.vsp)), obj_wall)))
        y += sign(global.vsp)
    global.vsp = 0
    global.knockback = 0
}
y += global.vsp
if (!(place_meeting(x, (y + 1), obj_wall)))
{
    sprite_index = spr_playerair
    image_speed = 0
    if (global.vsp >= 0)
        image_index = 1
    else
        image_index = 0
}
else
{
    image_speed = 1
    if (global.hsp == 0)
        sprite_index = spr_player
    else if (key_sprint == 1 && crawl == 0 && global.accel < 2)
        sprite_index = spr_playerstartcharge
    else if (global.accel >= 2)
        sprite_index = spr_playercharge
    else if (crawl == 0)
        sprite_index = spr_playerrun
    else
        sprite_index = spr_playercrawl
}
if (global.hsp != 0 && global.knockback == 0)
    image_xscale = sign(global.hsp)
if (key_jump && global.vsp < -0.1)
    audio_play_sound(jump, 3, false)
if keyboard_check_pressed(vk_shift)
{
    audio_play_sound(poopermario_chargefull, 3, true, 500)
    audio_sound_loop_start(poopermario_chargefull, 1.78)
    audio_sound_loop_end(poopermario_chargefull, 4.78)
}
if (global.sprinting == 0)
    audio_stop_sound(poopermario_chargefull)
