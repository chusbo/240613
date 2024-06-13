function CheckAddBook(){
	
	var number=document.getElementById("number");
	var name=document.getElementById("name");
	var price=document.getElementById("price");
	var stock=document.getElementById("stock");
	var description=document.getElementById("description");
	
	//제품코드 체크
	if(!check(/^JGD[0-9]{4,11}$/, number, "[제품 코드]\nJGD와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 JGD로 시작하세요"))
	return false;	
	
	//제품명 체크
	if(name.value.length < 1 ||name.value.length > 10){
		alert("[제품명]\n 최소 1자에서 최대 10자까지 입력하세요");
		name.focus();
		return false;		
		}
	
	//제품 가격 체크
	if(price.value.length==0||isNaN(price.value)){
		alert("[가격]\n숫자만 입력하세요");
		price.focus();
		return false;
	}
	
	if(price.value<0){
		alert("[가격]\n음수를 입력할 수 없습니다");
		price.focus();
		return false;
	}
	
	//재고 체크
	if (isNaN(stock.value)){
		alert("[재고]\n숫자만 입력하세요");
		stock.focus();
		return false;		
	}
	
	if(description.value.length > 100){
		alert("[상세설명]\n최소 100자 이하 입력하세요");
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
	
	document.newDessert.submit();
}