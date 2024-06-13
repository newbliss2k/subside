function scr_writer_format(){
	
	while current_char_str()="/" or current_char_str()="<" switch current_char_str() {
			case "/": switch current_char_str(1){
				
				case "n":	x=text_x
							y+=new_line_offset
							current_char+=2
							break;
				
				case "c":	break;
				
			} break;
			
			case "<":
				var _keyword=get_keyword()
				if string_ends_with(_keyword,"/") switch _keyword {
					
					case "color/":	c1=c_white
									c2=c_white
									c3=c_white
									c4=c_white; break;
					
				} else switch (string_split(_keyword,"=")[0]) {
					
					case "timer":	timer=real(string_split(_keyword,"=")[1]); break;
					
					case "c4":		c1=real(string_split(_keyword,"=")[1]);
									c2=real(string_split(_keyword,"=")[2]);
									c3=real(string_split(_keyword,"=")[3]);
									c4=real(string_split(_keyword,"=")[4]); break;
									
					case "color":	c1=real(string_split(_keyword,"=")[1]);
									c2=real(string_split(_keyword,"=")[1]);
									c3=real(string_split(_keyword,"=")[1]);
									c4=real(string_split(_keyword,"=")[1]); break;
									
					case "tag2":	break;
					
			} break;
		}
}