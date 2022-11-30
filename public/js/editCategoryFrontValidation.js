function qs(element) {
    return document.querySelector(element)
}

window.addEventListener("load", ()=> {

let $nameCategory = qs ("#name_category"),
    $formEditCategory = qs("#edit-category"),
    

    $errorSpan = qs("#error_submit")
    $nameCategory_Error = qs("#nameCategory_Error")





    $nameCategory.addEventListener("blur", ()=>{
        
        switch (true) {
            case !$nameCategory.value.trim(): /* evalua si el campo esta vacio */
                $nameCategory_Error.innerHTML = "El campo es requerido";
                $nameCategory.classList.add("is-invalid");/* agregarle estilos a esto */
                break;
            case !regExAlpha.test($nameCategory.value):
                $nameCategory_Error.innerHTML = "Nombre invalido";
                $inputName.classList.add("is-invalid");
                break;
            default: 
                $nameCategory_Error.innerHTML = ""
                
        }

    })

    $formEditCategory.addEventListener("submit", function(event) {

        event.preventDefault()
        /* let elementForm = this.elements;
        let errores = false; */
        
        if($nameCategory.value == ""){
            $errorSpan.innerHTML = "Hay errores en el formulario"
               
        }else {
            alert("Editaste la categoria!")
            $formEditCategory.submit()
        }

        
    })


    








})