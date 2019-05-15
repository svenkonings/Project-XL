contkey=argument2
if contkey=false {exit;}

title=argument0
text=argument1
col1=argument3
col2=argument4
alpha=argument5
finish=argument6

centerx=view_xview+view_wview/2
centery=view_yview+view_hview-string_height(text)
-30

draw_set_color(col1)
draw_set_alpha(alpha)
draw_set_font(fn_message_main)
if string_width(text)>string_width(finish)

{
        draw_rectangle(centerx-string_width(text)
/2-20,centery-string_height(text)/2-30,centerx+string_width(
text)/2+20,centery+string_height(text)/2+30,
false)
        draw_set_color(col2)
        draw_set_alpha(1)
        draw_rectangle(centerx-string_width(text)
/2-20,centery-string_height(text)/2-30,centerx+string_width(
text)/2+20,centery+string_height(text)/2+30,
true)
}
else
{
        draw_rectangle(centerx-string_width(finish)
/2-20,centery-string_height(finish)/2-30,centerx+string_width(
finish)/2+20,centery+string_height(finish)
/2+30,false)
        draw_set_color(col2)
        draw_set_alpha(1)
        draw_rectangle(centerx-string_width(finish)
/2-20,centery-string_height(finish)/2-30,centerx+string_width(
finish)/2+20,centery+string_height(finish)
/2+30,true)
}

draw_set_halign(fa_center)
draw_set_font(fn_message_title)
draw_set_color(col2)
draw_text(centerx,centery-string_height(text)
/2-15,title)
draw_set_halign(fa_left)
draw_set_font(fn_message_main)
draw_text(centerx-string_width(text)/2,
centery-string_height(text)/2,text)
draw_set_halign(fa_center)
draw_set_font(fn_message_end)
draw_text(centerx,centery+string_height(text)
/2+5,finish)
