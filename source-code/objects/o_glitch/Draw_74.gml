// Drawing the application surface
bktglitch_activate();

bktglitch_set_intensity(intensity);
bktglitch_set_line_shift(0.00001);
bktglitch_set_line_speed(0.1*spd);
bktglitch_set_line_resolution(1);
bktglitch_set_line_drift(1);
bktglitch_set_line_vertical_shift(0);
bktglitch_set_noise_level(0.5*noise);
bktglitch_set_jumbleness(0);
bktglitch_set_jumble_speed(0*spd);
bktglitch_set_jumble_resolution(0);
bktglitch_set_jumble_shift(0);
bktglitch_set_channel_shift(0);
bktglitch_set_channel_dispersion(0.001);
bktglitch_set_shakiness(0);
bktglitch_set_rng_seed(1);

draw_set_alpha(1)
draw_surface(application_surface, 0, 0);

bktglitch_set_intensity(1);