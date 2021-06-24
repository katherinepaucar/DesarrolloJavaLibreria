const form=document.getElementById("formulario");
const isbn=document.getElementById("isbn_id");


//Para que no envie el formulario por defecto
form.addEventListener('submit', event=>{
  
    event.preventDefault();
    validarFormulario(); //llamamos a la funcion
    //console.log(validarFormulario());
	if(validarFormulario()){
		
		form.submit();
	}
	
   
});

function  validarFormulario(){
	var Isvalid=true;
  //Con trim quitamos los espacios en blanco al incio y final
  const isbnValue=isbn.value.trim();

    //Validar ISBN
  //Validar ISBN
  const expISBN=/^(97(8|9))?\d{9}(\d|X)$/;
  if (isbnValue.length == 0 || !expISBN.test(isbnValue)|| /^\s+$/.test(isbnValue)){
    error(isbn,'Introduce un ISBN válido');
     Isvalid=false;
  }else{
    success(isbn);
  
   
  }
  return Isvalid;

}

//Funcion para que muestre el mensaje de error con un estilo
function error(input,message){
  const formGroup=input.parentElement;
    //añadimos estilo mediante la clase
  formGroup.className='form-group error';
    //Seleccionar el elemento small del formulario
  const small=formGroup.querySelector('small');
    //mostramos el mensaje
  small.innerText=message;


}

function success(input){
  const formGroup=input.parentElement;
  formGroup.className='form-group success';

}