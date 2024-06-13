function CheckUpdate() {
	
    var id = document.getElementById('id').value;
    var name = document.getElementById('name').value;
    var passwd = document.getElementById('passwd').value;
    var mail = document.getElementById('mail').value;
    var address = document.getElementById('address').value;
    var phone = document.getElementById('phone').value;

    if (!validatePhone()) {
        return false;
    }

    console.log("회원가입 완료: " + name);
    document.forms['newMember'].submit();
    return true;
}

function validatePhone() {
    const pattern = /^\d{3}-\d{4}-\d{4}$/;
    var phone = document.getElementById('phone').value;

    if (!pattern.test(phone)) {
        alert("전화번호 형식이 올바르지 않습니다. 올바른 형식: 000-0000-0000");
        return false;
    }

    return true;
}
