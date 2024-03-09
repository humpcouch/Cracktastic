key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_jump = keyboard_check_pressed(ord("Z"))
key_sprint = keyboard_check(vk_shift)
var move = (key_right - key_left)
hsp = (move * walksp)
vsp += grv
if (place_meeting(x, (y + 1), obj_wall) && key_jump)
    vsp = -10
if (key_sprint && place_meeting(x, (y + 1), obj_wall))
    hsp *= 1.5
if place_meeting((x + hsp), y, obj_wall)
{
    while (!(place_meeting((x + sign(hsp)), y, obj_wall)))
        x += sign(hsp)
    hsp = 0
}
x += hsp
if place_meeting(x, (y + vsp), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vsp)), obj_wall)))
        y += sign(vsp)
    vsp = 0
}
y += vsp
if (!(place_meeting(x, (y + 1), obj_wall)))
{
    sprite_index = spr_playerair
    image_speed = 0
    if (vsp >= 0)
        image_index = 1
    else
        image_index = 0
}
else
{
    image_speed = 1
    if (hsp == 0)
        sprite_index = spr_player
    else if (key_sprint == 1)
        sprite_index = spr_playercharge
    else
        sprite_index = spr_playerrun
}
if (hsp != 0)
    image_xscale = sign(hsp)
