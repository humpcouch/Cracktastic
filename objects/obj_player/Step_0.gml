key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_jump = keyboard_check_pressed(ord("Z"))
key_sprint = keyboard_check(vk_shift)
key_crawl = keyboard_check(vk_down)
key_turn = (keyboard_check_pressed(vk_left) + keyboard_check_pressed(vk_right))
key_jrelease = keyboard_check_released(vk_space)
key_punch = keyboard_check_pressed(ord("X"))
var move = (key_right - key_left)
if (global.punching == 0 && global.knockback == 0)
    global.hsp = (move * walksp)
else
    global.hsp = 0
global.vsp = (global.vsp + grv)
if (Grounded && key_jump)
{
    if (global.accel >= 2)
    {
        global.vsp = -15
        spinning = 1
    }
    else
        global.vsp = -10
}
if (key_crawl == 1 && place_meeting(x, (y + 1), obj_wall) && global.sprinting == 0)
{
    global.hsp *= 0.6
    crawl = 1
    mask_index = spr_playercrawl
}
else
{
    crawl = 0
    mask_index = spr_player
}
if (key_sprint && global.punching == 0)
{
    alarm[0] = 1
    global.hsp = (image_xscale * walksp)
    global.sprinting = 1
    global.hsp *= global.accel
    if (global.accel <= 2 && place_meeting(x, (y + 1), obj_wall))
        global.accel += 0.025
}
else
{
    global.sprinting = 0
    global.accel = 0
}
if (key_punch && global.punching == 0 && Grounded)
{
    alarm[1] = 1
    sprinting = 0
}
if place_meeting((x + global.hsp), y, obj_wall)
{
    while (!(place_meeting((x + sign(global.hsp)), y, obj_wall)))
        x += sign(global.hsp)
    if (global.accel == 0)
    {
        global.hsp = 0
        global.sprinting = 0
    }
    else
    {
        global.hsp = 0
        global.accel = 0
        global.vsp = -5
        global.sprinting = 0
        global.knockback = 1
    }
}
x += global.hsp
if place_meeting(x, (y + global.vsp), obj_wall)
{
    while (!(place_meeting(x, (y + sign(global.vsp)), obj_wall)))
        y += sign(global.vsp)
    global.vsp = 0
    global.knockback = 0
    spinning = 0
}
y += global.vsp
if (place_meeting(x, y, obj_enemy) && hurt == 0)
{
    if (global.playerHealth > 1)
    {
        hurt = 1
        global.playerHealth -= 1
        global.vsp = -7
        global.knockback = 1
        alarm[3] = (room_speed * 3)
    }
    else
        scr_gameover()
}
Grounded = place_meeting(x, (y + 1), obj_wall)
InAir = place_meeting(x, (y - 1), obj_wall)
Wall_R = place_meeting((x + 1), y, obj_wall)
Wall_L = place_meeting((x - 1), y, obj_wall)
Clung = (Wall_R || Wall_L)
if (!(place_meeting(x, (y + 1), obj_wall)))
{
    if (spinning == 0)
    {
        if (global.knockback == 0)
        {
            sprite_index = spr_playerair
            image_speed = 0
            if (global.vsp >= 0)
                image_index = 1
            else
                image_index = 0
        }
        else if (global.knockback == 1)
            sprite_index = spr_pooperknockback
    }
    else
        sprite_index = spr_pooper_jumpspin
}
else
{
    image_speed = 1
    if (global.hsp == 0 && (!global.punching) == 1)
        sprite_index = spr_player
    else if (key_sprint == 1 && crawl == 0 && global.accel < 2)
        sprite_index = spr_playerstartcharge
    else if (global.accel >= 2)
        sprite_index = spr_playercharge
    else if (crawl == 1)
        sprite_index = spr_playercrawl
    else
        sprite_index = spr_playerrun
}
if (global.punching == 1)
    sprite_index = spr_pooper_punch
if (global.hsp != 0 && global.knockback == 0)
    image_xscale = sign(global.hsp)
if (hurt == 1)
    image_alpha = 0.5
else
    image_alpha = 1
if (key_jump && global.vsp < -0.1)
{
    if (spinning == 0)
        audio_play_sound(jump, 3, false)
    else
    {
        audio_stop_sound(Cartoon_spinning_sound_effect)
        audio_play_sound(Cartoon_spinning_sound_effect, 3, true)
        audio_sound_loop_start(Cartoon_spinning_sound_effect, 0)
        audio_sound_loop_end(Cartoon_spinning_sound_effect, 3.34)
    }
}
if keyboard_check_pressed(vk_shift)
{
    audio_play_sound(poopermario_chargefull, 3, true, 500)
    audio_sound_loop_start(poopermario_chargefull, 1.78)
    audio_sound_loop_end(poopermario_chargefull, 4.78)
}
if (global.sprinting == 0)
    audio_stop_sound(poopermario_chargefull)
if (spinning == 0)
    audio_stop_sound(Cartoon_spinning_sound_effect)
