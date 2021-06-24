if(document.getElementById("btn-enviar")){
document.getElementById("btn-enviar").addEventListener("click", function () { 
  if (!confirm("¿Desea enviar el Formulario?"))
   event.preventDefault();
 });
}

if(document.getElementById("btn-limpiar")){
document.getElementById("btn-limpiar").addEventListener("click", function () { 
  if (!confirm("¿Desea limpiar el Formulario?"))
   event.preventDefault();
 });
}

if( document.getElementById("btn-eliminar")){
 document.getElementById("btn-eliminar").addEventListener("click", function () { 
  if (!confirm("¿Desea eliminar el libro?"))
   event.preventDefault();
 });
}


if( document.getElementById("btn-consultar")){
  document.getElementById("btn-consultar").addEventListener("click", function () { 
   if (!confirm("¿Desea consultar el libro?"))
   event.preventDefault();
  });
 }
 
 if( document.getElementById("btn-buscar")){
  document.getElementById("btn-buscar").addEventListener("click", function () { 
   if (!confirm("¿Desea buscar el libro?"))
    event.preventDefault();
  });
 }

 if( document.getElementById("btn-mod")){
  document.getElementById("btn-mod").addEventListener("click", function () { 
   if (!confirm("¿Desea modificar el precio del libro?"))
    event.preventDefault();
  });
 }
