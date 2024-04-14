///@arg ind
///@arg arg_array
function script_execute_alt(s,a){
	var len=array_length(a);
	
	switch(len){
		case 0:
			script_execute(s);
			break;
		case 1:
			script_execute(s,a[0]);
			break;
		case 2:
			script_execute(s,a[0],a[1]);
			break;
		case 3:
			script_execute(s,a[0],a[1],a[2]);
			break;
		case 4:
			script_execute(s,a[0],a[1],a[2],a[3]);
			break;
		case 5:
			script_execute(s,a[0],a[1],a[2],a[3],a[4]);
			break;
		case 6:
			script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5]);
			break;
		case 7:
			script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6]);
			break;
		case 8:
			script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]);
			break;
		case 9:
			script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]);
			break;
		case 10:
			script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9]);
			break;
	}
}