if (global.collectible >= (0.75 * global.maxRank))
{
    audio_play_sound(sfx_rank_good, 1, false)
    sprite_index = good_rank
}
else
{
    audio_play_sound(sfx_rank_bad, 1, false)
    sprite_index = bad_rank
}
