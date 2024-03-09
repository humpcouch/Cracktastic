function scr_after_image(argument0, argument1, argument2, argument3) //gml_Script_scr_after_image
{
    if (!(variable_instance_exists(id, "trail_x")))
    {
        number_of_after_images = argument0
        spacing = argument1
        fade_length = argument2
        colour = argument3
        trail_x = array_create(number_of_after_images, undefined)
        trail_y = array_create(number_of_after_images, undefined)
        alpha = array_create(number_of_after_images, 1)
        temp_x = array_create(number_of_after_images, undefined)
        temp_y = array_create(number_of_after_images, undefined)
        temp_alpha = array_create(number_of_after_images, undefined)
    }
    if (argument2 == undefined)
        argument2 = 16777215
    for (var i = 1; i < number_of_after_images; i++)
    {
        if (trail_x[i] != x || trail_y[i] != y)
        {
            if (trail_x[i] != undefined)
                draw_sprite_ext(sprite_index, image_index, trail_x[i], trail_y[i], sign(global.hsp), 1, image_angle, colour, alpha[i])
        }
    }
    for (i = 1; i < number_of_after_images; i++)
    {
        if (alpha[i] != undefined)
            alpha[i] = (alpha[i] - fade_length)
    }
    if (spacing <= 0)
    {
        trail_x[number_of_after_images] = x
        trail_y[number_of_after_images] = y
        alpha[number_of_after_images] = 1
        spacing = argument1
        array_copy(temp_x, 0, trail_x, 1, array_length_1d(trail_x))
        array_copy(trail_x, 0, temp_x, 0, array_length_1d(temp_x))
        array_copy(temp_y, 0, trail_y, 1, array_length_1d(trail_y))
        array_copy(trail_y, 0, temp_y, 0, array_length_1d(temp_y))
        array_copy(temp_alpha, 0, alpha, 1, array_length_1d(alpha))
        array_copy(alpha, 0, temp_alpha, 0, array_length_1d(temp_alpha))
    }
    else
        spacing--
}

