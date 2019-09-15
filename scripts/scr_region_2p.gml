var left, top, right, bottom, left2p, top2p, right2p, bottom2p;
left = argument0;
top = argument1;
right = argument2;
bottom = argument3;
left2p = argument4;
top2p = argument5;
right2p = argument6;
bottom2p = argument7;

if global.new_room
{
    scr_instance_deactivate_region(left, top, right, bottom, false);
    scr_instance_activate_region(left, top, right, bottom, true);
    scr_instance_activate_region(left2p, top2p, right2p, bottom2p, true);
    scr_instance_activate_objects();
    global.new_room = false;
    global.left = left;
    global.top = top;
    global.right = right;
    global.bottom = bottom;
    global.left2p = left2p;
    global.top2p = top2p;
    global.right2p = right2p;
    global.bottom2p = bottom2p;
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
    if left2p > global.left2p
    {
        if right > global.left2p
        {
            if bottom > global.top2p && top <= global.top2p
            {
            
            }
            else if top < global.bottom2p && bottom >= global.bottom2p
            {
                
            }
        }
        else
        {
            scr_instance_deactivate_region(global.left2p, global.top2p, min(left2p, global.right2p), global.bottom2p, true);
        }
        changed = true;
    }
    if top2p > global.top2p
    {
        scr_instance_deactivate_region(global.left2p, global.top2p, global.right2p, min(top2p, global.bottom2p), true);
        changed = true;
    }
    if right2p < global.right2p
    {
        scr_instance_deactivate_region(max(right2p, global.left2p), global.top2p, global.right2p, global.bottom2p, true);
        changed = true;
    }
    if bottom2p < global.bottom2p
    {
        scr_instance_deactivate_region(global.left2p, max(bottom2p, global.top2p), global.right2p, global.bottom2p, true);
        changed = true;
    }
    
    if left < global.left
    {
        scr_instance_activate_region(left, top, min(global.left, right, global.left2p), bottom, true);
    }
    if top < global.top
    {
        scr_instance_activate_region(left, top, right, min(global.top, bottom, global.top2p), true);
    }
    if right > global.right
    {
        scr_instance_activate_region(max(global.right, left, global.right2p), top, right, bottom, true);
    }
    if bottom > global.bottom
    {
        scr_instance_activate_region(left, max(global.bottom, top, global.bottom2p), right, bottom, true);
    }
    if left2p < global.left2p
    {
        scr_instance_activate_region(left2p, top2p, min(global.left2p, right2p, global.left), bottom2p, true);
    }
    if top2p < global.top2p
    {
        scr_instance_activate_region(left2p, top2p, right2p, min(global.top2p, bottom2p, global.top), true);
    }
    if right2p > global.right2p
    {
        scr_instance_activate_region(max(global.right2p, left2p, global.right), top2p, right2p, bottom2p, true);
    }
    if bottom2p > global.bottom2p
    {
        scr_instance_activate_region(left2p, max(global.bottom2p, top2p, global.bottom), right2p, bottom2p, true);
    }
    
    if changed
    {
        scr_instance_activate_objects();
    }
    
    global.left = left;
    global.top = top;
    global.right = right;
    global.bottom = bottom;
    global.left2p = left2p;
    global.top2p = top2p;
    global.right2p = right2p;
    global.bottom2p = bottom2p;
}
