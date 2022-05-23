function login(){
    var email = document.getElementById("email");
    var senha = document.getElementById("senha");

    if(email.value == 'admin@lwu.com' && senha.value == 'admin'){
        localStorage.setItem('acesso', true);

        window.location.href = "../../Front/index.html";

    }else{
        alert('Usuário ou senha incorreto');
    }
}