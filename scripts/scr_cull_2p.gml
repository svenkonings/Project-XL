var left, top, right, bottom, left2p, top2p, right2p, bottom2p;;
left = view_xview[0]-view_wview[0];
top = view_yview[0]-view_hview[0];
right = view_xview[0]+2*view_wview[0];
bottom = view_yview[0]+2*view_hview[0];
left2p = view_xview[1]-view_wview[1];
top2p = view_yview[1]-view_hview[1];
right2p = view_xview[1]+2*view_wview[1];
bottom2p = view_yview[1]+2*view_hview[1];

var update = global.new_room ||
    left != global.left ||
    top != global.top ||
    right != global.right ||
    bottom != global.bottom ||
    left2p != global.left2p ||
    top2p != global.top2p ||
    right2p != global.right2p ||
    bottom2p != global.bottom2p;

with (all) {
    if object_index != obj_controller {
        var buffer = 0;
        if !object_is_ancestor(object_index,obj_wall) {
            buffer = 128;
        }
        var cull = !(
            (
                bbox_left < right - buffer &&
                bbox_top < bottom - buffer &&
                bbox_right > left + buffer &&
                bbox_bottom > top + buffer
            ) || (
                bbox_left < right2p - buffer &&
                bbox_top < bottom2p - buffer &&
                bbox_right > left2p + buffer &&
                bbox_bottom > top2p + buffer
            )
        );
        if (cull) {
            instance_deactivate_object(id);
            ds_list_add(global.deactivated_instances, id, object_index, bbox_left, bbox_top, bbox_right, bbox_bottom);
        }
    }
}

var i = 0;
repeat(ds_list_size(global.deactivated_instances)/6) {
    var _id, _object_index, _bbox_left, _bbox_top, _bbox_right, _bbox_bottom;
    _id = global.deactivated_instances[| i];
    _object_index = global.deactivated_instances[| i+1];
    _bbox_left = global.deactivated_instances[| i+2];
    _bbox_top = global.deactivated_instances[| i+3];
    _bbox_right = global.deactivated_instances[| i+4];
    _bbox_bottom = global.deactivated_instances[| i+5];
    
    var buffer = 0;
    if !object_is_ancestor(_object_index,obj_wall) {
        buffer = 128;
    }
    var uncull = (
        (
            _bbox_left < right - buffer &&
            _bbox_top < bottom - buffer &&
            _bbox_right > left + buffer &&
            _bbox_bottom > top + buffer
        ) || (
            _bbox_left < right2p - buffer &&
            _bbox_top < bottom2p - buffer &&
            _bbox_right > left2p + buffer &&
            _bbox_bottom > top2p + buffer
        )
    );
    if uncull {
        instance_activate_object(_id);
        repeat (6) {
            ds_list_delete(global.deactivated_instances, i);
        }
        i -= 6;
    }
    i += 6;
}

global.new_room = false;
global.left = left;
global.top = top;
global.right = right;
global.bottom = bottom;
global.left2p = left2p;
global.top2p = top2p;
global.right2p = right2p;
global.bottom2p = bottom2p;
