function getStringLength(str) {
    var endvalue = 0;
    var sourcestr = new String(str);
    var tempstr;
    for (var strposition = 0; strposition < sourcestr.length; strposition++) {
        tempstr = sourcestr.charAt(strposition);
        if (tempstr.charCodeAt(0) > 255 || tempstr.charCodeAt(0) < 0) {
            endvalue = endvalue + 2;
        } else {
            endvalue = endvalue + 1;
        }
    }
    return (endvalue);
}

function trim(str) {
    if (str == null) return "";
    if (str.length == 0) return "";
    var i = 0, j = str.length - 1, c;
    for (; i < str.length; i++) {
        c = str.charAt(i);
        if (c != ' ') break;
    }
    for (; j > -1; j--) {
        c = str.charAt(j);
        if (c != ' ') break;
    }
    if (i > j) return "";
    return str.substring(i, j + 1);
}

function validateDate(date, format, alt) {
    var time = trim(date.value);
    if (time == "") return;
    var reg = format;
    var reg = reg.replace(/yyyy/, "[0-9]{4}");
    var reg = reg.replace(/yy/, "[0-9]{2}");
    var reg = reg.replace(/MM/, "((0[1-9])|1[0-2])");
    var reg = reg.replace(/M/, "(([1-9])|1[0-2])");
    var reg = reg.replace(/dd/, "((0[1-9])|([1-2][0-9])|30|31)");
    var reg = reg.replace(/d/, "([1-9]|[1-2][0-9]|30|31))");
    var reg = reg.replace(/HH/, "(([0-1][0-9])|20|21|22|23)");
    var reg = reg.replace(/H/, "([0-9]|1[0-9]|20|21|22|23)");
    var reg = reg.replace(/mm/, "([0-5][0-9])");
    var reg = reg.replace(/m/, "([0-9]|([1-5][0-9]))");
    var reg = reg.replace(/ss/, "([0-5][0-9])");
    var reg = reg.replace(/s/, "([0-9]|([1-5][0-9]))");
    reg = new RegExp("^" + reg + "$");
    if (reg.test(time) == false) {//验证格式是否合法
        alert(alt);
        date.focus();
        return false;
    }
    return true;
}

function validateDateGroup(year, month, day, alt) {
    var array = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var y = parseInt(year.value);
    var m = parseInt(month.value);
    var d = parseInt(day.value);
    var maxday = array[m - 1];
    if (m == 2) {
        if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0) {
            maxday = 29;
        }
    }
    if (d > maxday) {
        alert(alt);
        return false;
    }
    return true;
}

function validateCheckbox(obj, alt) {
    var rs = false;
    if (obj != null) {
        if (obj.length == null) {
            return obj.checked;
        }
        for (i = 0; i < obj.length; i++) {
            if (obj[i].checked == true) {
                return true;
            }
        }
    }
    alert(alt);
    return rs;
}

function validateRadio(obj, alt) {
    var rs = false;
    if (obj != null) {
        if (obj.length == null) {
            return obj.checked;
        }
        for (i = 0; i < obj.length; i++) {
            if (obj[i].checked == true) {
                return true;
            }
        }
    }
    alert(alt);
    return rs;
}

function validateSelect(obj, alt) {
    var rs = false;
    if (obj != null) {
        for (i = 0; i < obj.options.length; i++) {
            if (obj.options[i].selected == true) {
                return true;
            }
        }
    }
    alert(alt);
    return rs;
}

function validateEmail(email, alt, separator) {
    var mail = trim(email.value);
    if (mail == "") return;
    var em;
    var myReg = /^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/;
    if (separator == null) {
        if (myReg.test(email.value) == false) {
            alert(alt);
            email.focus();
            return false;
        }
    }
    else {
        em = email.value.split(separator);
        for (i = 0; i < em.length; i++) {
            em[i] = em[i].trim();
            if (em[i].length > 0 && myReg.test(em[i]) == false) {
                alert(alt);
                email.focus();
                return false;
            }
        }
    }
    return true;
}

/*判断是否为空*/
function if_null(value) {
    if (value == null || typeof(value) == "undefined" || value.length == 0) {//是否空值
        return true;
    } else {
        return false;
    }
}

/*检查手机号码*/
function checkMobile(phoneNub) {
    if (phoneNub > "") {
        var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
        if (phoneNub.match(reg) == null) {
            return false;
        }
    }
    return true;
}

/*字段值为null时返回“”空字符串*/
function deal_text_null(object) {
    if (object == null) {
        return "";
    } else {
        return object;
    }
}

function validateIdentityCard(number) {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if (reg.test(number) === false) {
        return false;
    }
    return true;

}

function validateForm(theForm) {// 若验证通过则返回true
    var disableList = new Array();
    var field = theForm.elements; // 将表单中的所有元素放入数组
    for (var i = 0; i < field.length; i++) {
        var vali = theForm.validate;
        if (vali != null) {
            if (vali.value == "0") {
                var fun = vali.functionName;
                if (fun != null) {
                    return eval(fun + "()");
                }
                else {
                    return true;
                }
            }
        }
        var empty = false;
        var value = trim(field[i].value);
        if (value.length == 0) {//是否空值
            empty = true;
        }
        var emptyInfo = field[i].emptyInfo;//空值验证
        if (emptyInfo != null && empty == true) {
            alert(emptyInfo);
            field[i].focus();
            return false;
        }
        var lengthInfo = field[i].lengthInfo;//最大长度验证
        if (lengthInfo != null && getStringLength(value) > field[i].maxLength) {
            alert(lengthInfo);
            field[i].focus();
            return false;
        }

        var validatorType = field[i].validatorType;
        if (validatorType != null) {//其它javascript
            var rs = true;
            if (validatorType == "javascript") {
                eval("rs=" + field[i].functionName + "()");
                if (rs == false) {
                    return false;
                }
                else {
                    continue;
                }
            }
            else if (validatorType == "disable") {//提交表单前disable的按钮
                disableList.length++;
                disableList[disableList.length - 1] = field[i];
                continue;
            }
            else if (validatorType == "Date") {
                rs = validateDate(theForm.elements(field[i].fieldName), field[i].format, field[i].errorInfo);
            }
            else if (validatorType == "DateGroup") {
                rs = validateDateGroup(theForm.elements(field[i].year), theForm.elements(field[i].month), theForm.elements(field[i].day), field[i].errorInfo);
            }
            else if (validatorType == "Checkbox") {
                rs = validateCheckbox(theForm.elements(field[i].fieldName), field[i].errorInfo);
            }
            else if (validatorType == "Radio") {
                rs = validateRadio(theForm.elements(field[i].fieldName), field[i].errorInfo);
            }
            else if (validatorType == "Select") {
                rs = validateSelect(theForm.elements(field[i].fieldName), field[i].errorInfo);
            }
            else if (validatorType == "Email") {
                rs = validateEmail(theForm.elements(field[i].fieldName), field[i].errorInfo);
            }
            else {
                alert("验证类型不被支持, fieldName: " + field[i].name);
                return false;
            }
            if (rs == false) {
                return false;
            }
        }
        else {//一般验证
            if (empty == false) {
                var v = field[i].validator; // 获取其validator属性
                if (!v) continue; // 如果该属性不存在,忽略当前元素
                var reg = new RegExp(v);
                if (reg.test(field[i].value) == false) {
                    alert(field[i].errorInfo);
                    field[i].focus();
                    return false;
                }
            }
        }
    }
    for (i = 0; i < disableList.length; i++) {
        disableList[i].disabled = true;
    }
    return true;
}
