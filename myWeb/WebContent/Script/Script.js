/**
 * 
 */
//글쓰기 유효성 검사
function boardCheck(f) {		
	var name = f.name.value;	
	var title = f.title.value;		
	var content = f.content.value; 
	var passwd = f.passwd.value;
	
	name = name.trim();
	title = title.trim();
	content = content.trim();	
	passwd = passwd.trim();
	
	if(name.length<2 || name.length>=10) {
		alert("작성자 이름은 2~10자 이내로 입력하세요");
		f.name.focus();
		return false;
	}
	
	if(title.length<2 || title.length>=10) {
		alert("제목은 3~10자 이내로 입력하세요");
		f.title.focus();
		return false;
	}
	
	if(content.length==0) {
		alert("내용을 입력하세요!");
		f.content.focus();		
		return false;
	}
	
	if(passwd.length!=4) {
		alert("비밀번호 4자리를 입력하세요");
		f.passwd.focus();
		return false;
	}
	

	/*서치*/
	function search(f) {
		var word	= f.word.value;		
		
		word	= word.trim();		
		
		if(word.length==0) {	
			alert("내용을 입력해 주세요");
			f.word.focus();
			return false;
		}
		
		return true;
	}//search() end
	
	
	
	
} //boardCheck() end