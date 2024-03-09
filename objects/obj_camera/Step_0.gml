if instance_exists(follow)
{
    xTo = follow.x
    yTo = follow.y
}
x += ((xTo - x) / 10)
y += ((yTo - y) / 10)
x = clamp(x, view_w_half, (room_width - view_w_half))
y = clamp(y, view_h_half, (room_height - view_h_half))
camera_set_view_pos(cam, (x - view_w_half), (y - view_h_half))
if keyboard_check_pressed(vk_f4)
{
    if window_get_fullscreen()
        window_set_fullscreen(false)
    else
        window_set_fullscreen(true)
}
