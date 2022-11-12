$(function(){
  let viewPwd = false;

    $("#viewPwd").on('click', function(){
      let getPwdType = $("#password");
      if(viewPwd === false) {
        console.log('checked, changed password field to text')
        getPwdType.attr('type', 'text');
        viewPwd = true;
      
      }
      else if(viewPwd === true){
        console.log("Unchecked, changed password field back to password")
        getPwdType.attr('type', 'password');
        viewPwd = false;
      }
    })
})