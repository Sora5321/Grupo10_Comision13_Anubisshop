function qs(element) {
    return document.querySelector(element)
}

window.addEventListener("load", () => {
    let $email = qs('#email'),
    $emailErrors = qs('#emailErrors'),
    $pass = qs('#pass'),
    $formLogin = qs('#formLogin'),
    $submitLoginErrors = qs('#submitLoginErrors'),
    $passErrors = qs('#passErrors'),
    regExEmail = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i,
    regExPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$/;

   
       $email.addEventListener("blur", () => {
        switch (true) {
            case !$email.value.trim():
                $emailErrors.innerHTML = "El email es requerido";
                $email.classList.add("is-invalid");
                break;
            case !regExEmail.test($email.value):
                $emailErrors.innerHTML = "Email inválido";
                $email.classList.add("is-invalid");
                break;
            default: 
                $email.classList.remove("is-invalid");
                $email.classList.add("is-valid");
                $emailErrors.innerHTML = "";
                break;
        }
    })

    $pass.addEventListener('blur', function(){
        switch (true) {
            case !$pass.value.trim():
                $passErrors.innerHTML = 'El campo contraseña es obligatorio'
                $pass.classList.add('is-invalid')
                break;
           case !regExPass.test($pass.value):
                $passErrors.innerHTML = 'Contraseña incorrecta';
                $pass.classList.add('is-invalid')
                break;     
            default:
                $pass.classList.remove("is-invalid");
                $pass.classList.add('is-valid')
                $passErrors.innerHTML = ""
                break;
        }
    })

    $formLogin.addEventListener("submit", function(event) {

        event.preventDefault()
        let elementsForm = this.elements;
        let errores = false;
    
        for (let index = 0; index < elementsForm.length - 1; index++) {
            if(elementsForm[index].value == ""
                || elementsForm[index].classList.contains("is-invalid")){
                elementsForm[index].classList.add("is-invalid");
                $submitLoginErrors.innerHTML = "Su Email o contraseña son incorrecto"
                errores = true;
            }
        } 
        if(!errores){
            $formLogin.submit()
        }
    })         
   

})