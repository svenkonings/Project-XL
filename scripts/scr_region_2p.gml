var left, top, right, bottom, left2p, top2p, right2p, bottom2p;
left = argument0;
top = argument1;
right = argument2;
bottom = argument3;
left2p = argument4;
top2p = argument5;
right2p = argument6;
bottom2p = argument7;

var changed;
if global.new_room
{
    changed = true;
}
else
{
changed = left != global.left ||
          top != global.top ||
          right != global.right ||
          bottom != global.bottom ||
          left2p != global.left2p ||
          top2p != global.top2p ||
          right2p != global.right2p ||
          bottom2p != global.bottom2p;
}

if changed
{
    scr_instance_deactivate_region(left, top, right, bottom, false);
    scr_instance_activate_region(left, top, right, bottom, true);
    scr_instance_activate_region(left2p, top2p, right2p, bottom2p, true);
    scr_instance_activate_objects();
    global.left = left;
    global.top = top;
    global.right = right;
    global.bottom = bottom;
    global.left2p = left2p;
    global.top2p = top2p;
    global.right2p = right2p;
    global.bottom2p = bottom2p;
}
