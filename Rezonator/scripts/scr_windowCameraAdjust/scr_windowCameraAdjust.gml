var windowWidth = window_get_width();
var windowHeight = window_get_height();

view_hport[0] = windowHeight;
view_wport[0] = windowWidth;

surface_resize(application_surface, windowWidth, windowHeight);

camera_set_view_size(view_camera[0], windowWidth, windowHeight);