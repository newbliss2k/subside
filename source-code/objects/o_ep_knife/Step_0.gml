image_alpha+=0.05

image_angle+=image_angle_speed
image_angle_speed=lerp(image_angle_speed,0,image_angle_dec)//max(image_angle_speed-image_angle_dec,0)

if image_angle_speed<0.1 speed=min(speed+0.2,max_speed)