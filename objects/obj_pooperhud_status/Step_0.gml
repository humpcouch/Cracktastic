if (global.accel >= 1.9)
    sprite_index = pooperhud_charge
else
    sprite_index = pooperhud_idle
if (room == titlescreen || room == game_over || room == level_complete)
    image_alpha = 0
else
    image_alpha = 1
