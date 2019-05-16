if instance_exists(obj_harry) && obj_harry.x >= 14400
{
    instance_activate_all();
    instance_deactivate_region(0,0,13568,room_height, true, true);
    instance_activate_object(obj_healthbar);
    instance_activate_object(obj_resolutie);
    instance_activate_object(obj_music);
}
else if room != rm_menu && room != rm_level_select && room != rm_players && room != rm_difficultymenu && room != rm_WO_intro
{
    instance_deactivate_region(view_xview[0]-view_wview[0], 0, 3*view_wview[0], room_height, false, true);
    instance_activate_region(view_xview[0]-view_wview[0], 0, 3*view_wview[0], room_height, true);
    instance_activate_object(obj_healthbar);
    instance_activate_object(obj_enemyblock);
    instance_activate_object(obj_invisible);
    instance_activate_object(obj_resolutie);
    instance_activate_object(obj_music);
    if global.two_p=true
    {instance_activate_region(view_xview[1]-view_wview[1], 0, 3*view_wview[1], room_height, true)}
}
