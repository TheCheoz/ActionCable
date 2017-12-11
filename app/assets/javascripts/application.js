//= require rails-ujs

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//= require bootstrap-sprockets

//= require select2
//= require select2_locale_es

//= require lightbox-bootstrap

//= require moment
//= require bootstrap-datetimepicker
//= require moment/es.js


//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js

//= require cookies_eu

//= require amigos
//= require cable


// ****************************************************************************************************
// ****************************************************************************************************
//$(document).ready(function () {
// $( document ).on('turbolinks:load', function() {


    // ----------- MULTI SELECT ------------------
    $(".multi-select").select2({
        theme: "bootstrap"
    });

    $(".search-select").select2(); 
    

    // ----------- FUNCIONAMIENTO DEL LIGHTBOX BOOTSTRAP ------------------
    $('.lightbox').click(function (e) {
        e.preventDefault();
        $(this).ekkoLightbox();
    });


    // ----------- FECHA ------------------
    $('.fechapicker input').datepicker({
        format: "dd/mm/yyyy",
        startView: 2,
        todayBtn: true,
        language: "es"
    });


    // ------ CALENDARIO PARA SELECIONAR VARIAS FECHAS A LA VEZ -------
    $('.fechapickermultiple').datepicker({
        format: "dd/mm/yyyy",
        startDate: "today",
        startView: 2,
        maxViewMode: 3,
        todayBtn: true,
        language: "es",
        multidate: true,
        multidateSeparator: ","
    });


    // ------ CALENDARIO PARA SELECCIONAR FECHA Y HORA EN EL MISMO CAMPO -------
    $('.fechahorapicker').datetimepicker({
        locale: 'es',
        viewMode: 'months',
        format: 'L hh:mm a'
    });
    
    $(document).ready(function(){
        if ($('#lista-conversaciones li .container-panel').length > 0) {
            var lista_mensajes = $('#lista-conversaciones li .container-panel').find('.lista-mensajes');
            var height = lista_mensajes[0].scrollHeight;
            lista_mensajes.scrollTop(height);
        }  
    });

// });