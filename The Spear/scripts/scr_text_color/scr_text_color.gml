///@param beginning
///@param ending
///@param col1
///@param col2
///@param col3
///@param col4
function scr_text_color(_start,_end,_col1,_col2,_col3,_col4){
	for(var i=_start;i<=_end;i++){
		col_1[i,page_num-1]=_col1;
		col_2[i,page_num-1]=_col2;
		col_3[i,page_num-1]=_col3;
		col_4[i,page_num-1]=_col4;
	}
}