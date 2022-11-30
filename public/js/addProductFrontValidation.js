function qs(element) {
    return document.querySelector(element)
}

window.addEventListener("load", () => {
    let $form = qs("#addProduct-form")
        $name = document.querySelector("#name"),
        $categoria = qs("#categoria"),/* 
        $image = qs("#image"), */
        $file = qs('#formFile'),
        $fileErrors = qs('#fileErrors'),
        $imgPreview = qs('#img-preview'),

        /* ____________________________ */
        $precio = qs("#precio"),
        $discount = qs("#discount"),
        $promo = qs("#promo"),
        $description = qs("#description"), 
        $nameProductError = qs("#nameProductError"),
        $categoryError = qs("#categoryError"),
        $priceError = qs("#priceError"),
        $discountError = qs("#discountError"),
        $promoError = qs("#promoError"),
        $descriptionError = qs("#descriptionError"),
        regExAlpha = /^[a-zA-Z\sñáéíóúü ]*$/
    

    
    
    $name.addEventListener("blur", ()=>{
        
        switch (true) {
            case !$name.value.trim(): /* evalua si el campo esta vacio */
                $nameProductError.innerHTML = "El campo es requerido";
                $name.classList.add("is-invalid");/* agregarle estilos a esto */
                break;
            case !regExAlpha.test($name.value):
                $nameProductError.innerHTML = "Nombre invalido";
                $inputName.classList.add("is-invalid");
                break;
            default: 
            
                $name.classList.remove("is-invalid")
                $name.classList.add("is-valid")
                $nameProductError.innerHTML = ""
        }

    })

    

    $categoria.addEventListener("blur", ()=>{

        switch (true) {
            case $categoria.value == "Seleccione una categoria":
                 $categoria.classList.add("is-invalid");
                 $categoryError.innerHTML = "Debe seleccionar una categoria"
                break;
        
            default:
                $categoria.classList.remove("is-invalid");
                $categoria.classList.add("is-valid");
                $categoryError.innerHTML = ""
                break;
        }
        
    })

    $precio.addEventListener("blur", ()=>{

        switch (true) {
            
            case $precio.value == "":
                $priceError.innerHTML= "Este campo es requerido"
                break;
        
            case $precio.value < 1:
                $priceError.innerHTML= "Debe ser un valor mayor a 1"
                $price.classList.add("is-invalid")
                break;
        
            default:
                $precio.classList.remove("is-invalid")
                $precio.classList.add("is-valid")
                $priceError.innerHTML = ""
                break;
        }

    })

    $discount.addEventListener("blur", ()=>{
      
        switch (true) {

            case $discount.value == "":
                $discountError.innerHTML= ""
                break;       

            case $discount.value < 1:
                $discountError.innerHTML= "Debe ser un valor mayor a 1"
                $discount.classList.add("is-invalid")
                break;
            case $discount.value >= 100:
                $discountError.innerHTML= "Debe ser un valor menor a 100"
                $discount.classList.add("is-invalid")
                break;        
            default:
                $discount.classList.remove("is-invalid")
                $discount.classList.add("is-valid")

                $discountError.innerHTML = ""
                
                break;
        }
    })

    $promo.addEventListener("blur", ()=>{
    
        switch (true) {
            case $promo.value == "Ninguno":
                $promoError.innerHTML= ""
                
                break;
            case $promo.value == "Oferta" || $promo.value == "Destacado":
                $promoError.innerHTML= ""
        
            default:
                break;
        }
    })

    $description.addEventListener("blur", ()=>{

        switch (true) {
            case !$description.value.trim(): /* evalua si el campo esta vacio */
                $descriptionError.innerHTML = "El campo es requerido";
                $description.classList.add("is-invalid");/* agregarle estilos a esto */
                break;
            
            default: 
            $description.classList.remove("is-invalid")
            $description.classList.add("is-valid")
            $descriptionError.innerHTML = ""
            break;
        }
    })

    $file.addEventListener('change', 
    function fileValidation(){
        let filePath = $file.value, //Capturo el valor del input
            allowefExtensions = /(.jpg|.jpeg|.png|.gif|.web)$/i //Extensiones permitidas
        if(!allowefExtensions.exec(filePath)){ //El método exec() ejecuta una busqueda sobre las coincidencias de una expresión regular en una cadena especifica. Devuelve el resultado como array, o null.
            $fileErrors.innerHTML = 'Carga un archivo de imagen válido, con las extensiones (.jpg - .jpeg - .png - .gif)';
            $file.value = '';

            $imgPreview.innerHTML = '';
            return false;
        }
        else{
            // Image preview
            console.log($file.files);
            if($file.files && $file.files[0]){
                let reader = new FileReader();
                reader.onload = function(e){
                    $imgPreview.innerHTML = '<img src="' + e.target.result +'"/>';
                };
                reader.readAsDataURL($file.files[0]);
                $fileErrors.innerHTML = '';
                $file.classList.remove('is-invalid')
            }
        }
    })


    $form.addEventListener("submit", function(event) {

        event.preventDefault()
        let elementsForm = this.elements;
        let errores = false;
    
        for (let index = 0; index < elementsForm.length - 1; index++) {
            if(elementsForm[index].value == ""
            && elementsForm[index].name !== "promo"
            && elementsForm[index].name !== "discount"
            || elementsForm[index].classList.contains("is-invalid")){
                elementsForm[index].classList.add("is-invalid");
                submitErrors.innerHTML = "Hay errores en el formulario"
                errores = true;
            }
        }

        if(!errores){
            $form.submit()
        }
    })
   

})