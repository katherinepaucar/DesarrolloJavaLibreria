const form = document.getElementById("formulario");
const id = document.getElementById("id_libro");
const titulo = document.getElementById("titulo_id");
const autor = document.getElementById("autor_id");
const editorial = document.getElementById("editorial_id");
const isbn = document.getElementById("isbn_id");
const precio = document.getElementById("precio_id");
const publicacion = document.getElementById("publicacion_id");
const descripcion = document.getElementById("descrip");


//Para que no envie el formulario por defecto
form.addEventListener('submit', event => {
	event.preventDefault();
	validarFormulario(); //llamamos a la funcion
	//console.log(validarFormulario());
	if (validarFormulario()) {
		alert("Enviando Datos");
		form.submit();
	}

});

function validarFormulario() {

	var Isvalid = true;
	//Con trim quitamos los espacios en blanco al incio y final
	const idValue = id.value.trim();
	const tituloValue = titulo.value.trim();
	const autorValue = autor.value.trim();
	const editorialValue = editorial.value.trim();
	const isbnValue = isbn.value.trim();
	const precioValue = precio.value.trim();
	const publicacionValue = publicacion.value.trim();
	const descripcionValue = descripcion.value.trim();

	//Validad ID
	if (idValue.length == 0 || idValue == 0 || !(/^\d{1,5}$/.test(idValue)) || /^\s+$/.test(idValue)) {
		error(id, 'Introduce un ID válido');
		Isvalid=false;
	} else {
		success(id);
	}
	//Validad Titulo
	if (tituloValue.length == 0 || /^\s+$/.test(tituloValue)) {
		error(titulo, 'Introduce un Título');
		Isvalid=false;
	} else {
		success(titulo);
	}
	
	//Validad Autor
	if (autorValue.length == 0 || /^\s+$/.test(autorValue)) {
		error(autor, 'Introduce un autor');
		Isvalid=false;
	} else {
		success(autor);
	}
	//Validar editorial
	if (editorialValue.length == 0 || /^\s+$/.test(editorialValue)) {
		error(editorial, 'Introduce una Editorial');
		Isvalid=false;
	} else {
		success(editorial);
	}

	//Validar ISBN

	const expISBN = /^(97(8|9))?\d{9}(\d|X)$/;
	if (isbnValue.length == 0 || !expISBN.test(isbnValue) || /^\s+$/.test(isbnValue)) {
		error(isbn, 'Introduce un ISBN válido');
		Isvalid=false;
	} else {
		success(isbn);
	}
	//Validad Precio
	const expPrecio = /^[0-9]+[.]{1}[0-9]{2}?$/;
	if (precioValue.length == 0 || precioValue == 0 || !(expPrecio.test(precioValue)) || /^\s+$/.test(precioValue)) {
		error(precio, 'Introduce un Precio válido, 2 decimales como máximo');
	} else {
		success(precio);
	}
	//Validar Publicacion
	//console.log(publicacionValue);
	//console.log(typeof(parseInt(publicacionValue)));
	const expPublicacion = /^[0-9]{4}$/;
	if (publicacionValue.length == 0 || publicacionValue == 0 || !(expPublicacion.test(publicacionValue)) || /^\s+$/.test(publicacionValue) || (parseInt(publicacionValue) < 1500 || parseInt(publicacionValue) > 2021 )) {
		error(publicacion, 'Introduce un año de publicación válido');
		Isvalid=false;
	} else {
		success(publicacion);
	}
	//Validar Descripcion
	if (descripcionValue.length == 0 || /^\s+$/.test(descripcionValue)) {
		error(descripcion, 'Introduce una descripción');
		Isvalid=false;
	} else {
		success(descripcion);
	}
	return Isvalid;
}

//Funcion para que muestre el mensaje de error con un estilo
function error(input, message) {
	const formGroup = input.parentElement;
	//añadimos estilo mediante la clase
	formGroup.className = 'form-group error';
	//Seleccionar el elemento small del formulario
	const small = formGroup.querySelector('small');
	//mostramos el mensaje
	small.innerText = message;


}

function success(input) {
	const formGroup = input.parentElement;
	formGroup.className = 'form-group success';

}