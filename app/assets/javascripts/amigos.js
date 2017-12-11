$(document).ready(function(){
	$('.boton_solicitud').on("ajax:success", function(event){
    alert(event.detail[0]);     
    $(this).parent().append("<a class='btn boton-ocre' disabled>Pendiente</a>");
    $(this).remove();
  });

  $('.boton_solicitud').on("ajax:error", function(event){
    alert(event.detail[0]);     
  });
});