if place_meeting(x, y, obj_player)
{
    draw_self()
    draw_set_font(Font1)
    draw_set_halign(fa_center)
    draw_text(x, (y - 100), levelName)
}
else
    draw_self()
