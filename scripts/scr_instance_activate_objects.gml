if argument0
{
    instance_activate_object(obj_healthbar);
    instance_activate_object(obj_resolutie);
    instance_activate_object(obj_music);
}
if scr_needs_enemyblock()
{
    instance_activate_object(obj_enemyblock);
}
if scr_needs_invisible()
{
    instance_activate_object(obj_invisible);
}
