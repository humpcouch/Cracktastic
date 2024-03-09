vsp += grv
if (place_meeting((x + hsp), y, obj_wall) && knockout == 0)
{
    while (!(place_meeting((x + sign(hsp)), y, obj_wall)))
        x += sign(hsp)
    hsp = (-hsp)
}
x += hsp
if (place_meeting(x, (y + vsp), obj_wall) && knockout == 0)
{
    while (!(place_meeting(x, (y + sign(vsp)), obj_wall)))
        y += sign(vsp)
    vsp = 0
}
y += vsp
image_xscale = sign(hsp)
if (place_meeting(x, y, obj_attackhitbox) && knockout == 0)
    alarm[0] = 1
