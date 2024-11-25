function Draw_Set(colour = c_black, font = fnt_pixel)
{
	draw_set_color(colour);
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

function Draw_Set_Centre(colour = c_black, font = fnt_pixel)
{
	draw_set_color(colour);
	draw_set_font(font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
}

function Draw_Set_Right(colour = c_black, font = fnt_pixel)
{
	draw_set_color(colour);
	draw_set_font(font);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
}


function Draw_Text_At(_xx,_yy,_str, align = "left")
{
	if (align == "centre") || (align == "middle") Draw_Set_Centre()
	else if (align == "right") Draw_Set_Right()
	else Draw_Set()
	
	
	_str = string(_str);	//has to be a string
	
	//black outline
	draw_text(_xx+1,_yy,_str);
	draw_text(_xx-1,_yy,_str);
	draw_text(_xx,_yy+1,_str);
	draw_text(_xx,_yy-1,_str);
	
	//draw text
	draw_set_colour(c_white);
	draw_text(_xx,_yy,_str);
}

function Draw_Text_Colour(_xx,_yy,_str, align = "left", colour = c_white)
{
	if (align == "centre") || (align == "middle") Draw_Set_Centre()
	else if (align == "right") Draw_Set_Right()
	else Draw_Set()
	
	_str = string(_str);	//has to be a string
	
	//draw text
	draw_set_colour(colour);
	draw_text(_xx,_yy,_str);
}