if scr_needs_enemyblock()
{
    instance_activate_object(obj_enemyblock);
}
if scr_needs_invisible()
{
    instance_activate_object(obj_invisible);
}
if object_get_name(object_index) != "obj_controller"
{
    instance_activate_object(obj_controller);
}
