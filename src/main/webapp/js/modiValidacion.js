const form=document.getElementById("formulario");
const isbn=document.getElementById("isbn_id");
const precio=document.getElementById("precio_id");


//Para que no envie el formulario por defecto
form.addEventListener('submit', event=>{
  
    event.preventDefault();
    validarFormulario(); //llamamos a la funcion
   //console.log(validarFormulario());
	if(validarFormulario()){
		alert("Enviando Datos");
		form.submit();
	}
   
});

function  validarFormulario(){
	var Isvalid=true;
  //Con trim quitamos los espacios en blanco al incio y final
  const isbnValue=isbn.value.trim();
  const precioValue=precio.value.trim();
    
  //Validar ISBN
  const expISBN=/^(97(8|9))?\d{9}(\d|X)$/;
  if (isbnValue.length == 0 || !expISBN.test(isbnValue)|| /^\s+$/.test(isbnValue)){
    error(isbn,'Introduce un ISBN válido');
	Isvalid=false;
	
  }else{
    success(isbn);
	
  }
    //Validad Precio
const expPrecio=/^[0-9]+[.]{1}[0-9]{2}?$/;
  if (precioValue.length == 0 || precioValue ==0 || !(expPrecio.test(precioValue)) || /^\s+$/.test(precioValue)){
    error(precio,'Introduce un Precio válido, 2 decimales como máximo');
	Isvalid=false;
	
  }else{
    success(precio);
	
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