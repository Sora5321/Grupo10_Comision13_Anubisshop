function qs(element) {
    return document.querySelector(element)
}

window.addEventListener("load", ()=>{

    let $nameCategory = qs("#nameCategory"),
        $formCategory = qs("#add-category"),

        $spanError = qs ("#errorSubmit")
        $nameCategoryError = qs("#nameCategoryError")

        $nameCategory.addEventListener("blur", ()=>{
        
            switch (true) {
                case !$nameCategory.value.trim(): /* evalua si el campo esta vacio */
                    $nameCategoryError.innerHTML = "El campo es requerido";
                    $nameCategory.classList.add("is-invalid");/* agregarle estilos a esto */
                    break;
                case !regExAlpha.test($nameCategory.value):
                    $nameCategoryError.innerHTML = "Nombre invalido";
                    $nameCategory.classList.add("is-invalid");
                    break;
                default: 
                    $nameCategoryError.innerHTML = ""
                    
            }
    
        })

        $formCategory.addEventListener("submit", function(event) {

            event.preventDefault()
            /* let elementForm = this.elements;
            let errores = false; */
            
            if($nameCategory.value === ""){
                $spanError.innerHTML = "Hay errores en el formulario"
                   
            }else {
                $formCategory.submit()
            }
    
            
        })


})