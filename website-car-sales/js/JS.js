function Tdn(){
    regex = /^\w{1,9}/;
    var tdn = document.getElementById("tendn").value;
    if(regex.test(tdn)== false){
        document.getElementById("changetdn").innerHTML = "Please enter username";
        return false;
    }else{
        document.getElementById("changetdn").innerHTML = "";
        return true;
    }
}
function Ktmk(){
    regex =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    var mk =document.getElementById("mk").value;
    if(regex.test(mk)== false){
        document.getElementById("changemk").innerHTML="Password must be at least 8 characters, at least 1 uppercase letter, 1 lowercase letter, and 1 number.";
        return false;
    } else {
        document.getElementById("changemk").innerHTML = "";
        return true;
    }
}
function Ktnl(){
    var nlmk = document.getElementById("nlmk").value;
    if((document.getElementById("mk").value)!= nlmk){
        document.getElementById("changenlmk").innerHTML = "Enter password confirmation";
        return false;
    }else{
        document.getElementById("changenlmk").innerHTML = "";
        return true;
    }
}

function Kthoten(){
    var regex=/^[A-Z]{1,}/;
    var ht =document.getElementById("hoten").value;
    if(regex.test(ht)== false){
        document.getElementById("changenhoten").innerHTML = "Please enter your fullname";
        return false;
    }else{
        document.getElementById("changenhoten").innerHTML = "";
        return true;
    }
}
function Ktsdt(){
    var regex=/^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
    var sdt =document.getElementById("sdt").value;
    if(regex.test(sdt)== false){
        document.getElementById("changensdt").innerHTML = "Please enter your phone";
        return false;
    }else{
        document.getElementById("changensdt").innerHTML = "";
        return true;
    }
}

function Ktmail(){
    var regex=/^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+\.[a-z]{3}$/;
    var mail =document.getElementById("mail").value;
    if(regex.test(mail)== false){
        document.getElementById("changemail").innerHTML = "Please enter valid email";
        return false;
    }else{
        document.getElementById("changemail").innerHTML = "";
        return true;
    }
}
function mokhoa() {
    if ((Kthoten() == true) && Ktmail() == true && Ktmk() == true && Ktnl() == true && Tdn()== true) {
        document.getElementById("btdk").disabled = false;

    }
}

    