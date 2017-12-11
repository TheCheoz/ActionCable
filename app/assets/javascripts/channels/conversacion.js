// $( document ).on('turbolinks:load', function() {
		App.conversation = App.cable.subscriptions.create("ConversacionChannel", {
	  connected: function() {},
	  disconnected: function() {},
	  received: function(data) {
	    var conversacion = $('#lista-conversaciones').find("[data-conversacion-id='" + data['conversacion_id'] + "']");
	    if (data['ventana'] !== undefined) {
	      var conversacion_visible = conversacion.is(':visible');

	      if (conversacion_visible) {
	        var mensages_visible = (conversacion).find('.panel-body').is(':visible');
	        conversacion.find('.lista-mensajes').find('ul').append(data['mensaje']);
	      }
	    }
	    else {
	      conversacion.find('ul').append(data['mensaje']);
	    }

	    if (data['usuario'] && data['contenido']) {
	    	if (!$("#usuario-" + data['usuario']).parents('.item-usuario-chat').hasClass('usuario-activo')) {
		    	$("#usuario-" + data['usuario']).parents('.item-usuario-chat').addClass('bk-rojo');
		    }
	    	$("#usuario-" + data['usuario']).text(mensaje_corto(data['contenido']));
	    }

	    var lista_mensajes = conversacion.find('.lista-mensajes');
	    var height = lista_mensajes[0].scrollHeight;
	    lista_mensajes.scrollTop(height);
	  },
	  speak: function(mensaje) {
	    return this.perform('speak', {
	      mensaje: mensaje
	    });
	  }
	});
	$(document).on('submit', '.new_message', function(e) {
	  e.preventDefault();
	  var valores = $(this).serializeArray();
	  var mensaje = $(this).find('textarea').val();
	  if (mensaje.length > 0) {
	  	App.conversation.speak(valores);
	  	$(this).trigger('reset');
	  	var usuario_id = $(this).attr('data-receptor');
	  	$("#usuario-" + usuario_id).text(mensaje_corto(mensaje));
	  }
	});

	function mensaje_corto(mensaje){
		var refrescar_small;

		if (mensaje.length > 15)
	  	refrescar_small = mensaje.substring(0, 30) + '...';
  	else
  		refrescar_small = mensaje;

  	return refrescar_small;
	}
// });

	  	
