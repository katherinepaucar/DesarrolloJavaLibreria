const form=document.getElementById("formulario");
const id=document.getElementById("id_libro");


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
  const idValue=id.value.trim();

  
    //Validad ID
  if (idValue.length == 0 || idValue ==0 || !(/^\d{1,5}$/.test(idValue)) || /^\s+$/.test(idValue)){
    error(id,'Introduce un ID válido');
    Isvalid=false;
  }else{
    success(id);
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