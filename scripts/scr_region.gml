var left, top, right, bottom;
left = argument0;
top = argument1;
right = argument2;
bottom = argument3;

if global.new_room
{
    scr_instance_deactivate_region(left, top, right, bottom, false);
    scr_instance_activate_region(left, top, right, bottom, true);
    scr_instance_activate_objects(true);
    global.new_room = false;
    global.left = left;
    global.top = top;
    global.right = right;
    global.bottom = bottom;
}
else
{
    var changed = false;
    
    if left > global.left
    {
        scr_instance_deactivate_region(global.left, global.top, min(left, global.right), global.bottom, true);
        changed = true;
    }
    if top > global.top
    {
        scr_instance_deactivate_region(global.left, global.top, global.right, min(top, global.bottom), true);
        changed = true;
    }
    if right < global.right
    {
        scr_instance_deactivate_region(max(right, global.left), global.top, global.right, global.bottom, true);
        changed = true;
    }
    if bottom < global.bottom
    {
        scr_instance_deactivate_region(global.left, max(bottom, global.top), global.right, global.bottom, true);
        changed = true;
    }
    
    if left < global.left
    {
        scr_instance_activate_region(left, top, min(global.left, right), bottom, true);
    }
    if top < global.top
    {
        scr_instance_activate_region(left, top, right, min(global.top, bottom), true);
    }
    if right > global.right
    {
        scr_instance_activate_region(max(global.right, left), top, right, bottom, true);
    }
    if bottom > global.bottom
    {
        scr_instance_activate_region(left, max(global.bottom, top), right, bottom, true);
    }
    
    if changed
    {
        scr_instance_activate_objects(false);
    }
    
    global.left = left;
    global.top = top;
    global.right = right;
    global.bottom = bottom;
}
