// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery.turbolinks
//= require jquery.formatter
//= require materialize-sprockets
//= require turbolinks
//= require_tree .

$( document ).on('turbolinks:load', function() {
    $('.dropdown-button').dropdown({
        inDuration: 300,
        outDuration: 225,
        constrainWidth: false, // Does not change width of dropdown to that of the activator
        hover: false, // Activate on hover
        gutter: 0, // Spacing from edge
        belowOrigin: true, // Displays dropdown below the button
        alignment: 'left', // Displays dropdown with edge aligned to the left of button
        stopPropagation: false // Stops event propagation       
        }
    );
    $('select').material_select();
    $('input#input_text, textarea#textarea1').characterCounter();
    $('.materialize-textarea').trigger('autoresize');
    $('#user_telephone').formatter({
        'pattern': '({{99}}) {{99999}}-{{9999}}'       
    });   
    $('#partner_telephone').formatter({
        'pattern': '({{99}}) {{99999}}-{{9999}}'       
    }); 
    var diaSemana = [ 'Domingo', 'Segunda-Feira', 'Terca-Feira', 'Quarta-Feira', 'Quinta-Feira', 'Sexta-Feira', 'Sabado' ];
    var mesAno = [ 'Janeiro', 'Fevereiro', 'Marco', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro' ];
    var data = new Date();
    var hoje = diaSemana[data.getDay()] + ', ' + mesAno[data.getMonth()] + ' de ' + data.getFullYear();
    $("#dataPesquisa").attr("value", hoje);
    $(".datepicker").pickadate({
      monthsFull: mesAno,
      monthsShort: [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
      weekdaysFull: diaSemana,
      weekdaysShort: [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab' ],
      weekdaysLetter: [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S' ],
      selectMonths: true,
      selectYears: true,
      clear: false,
      format: 'dd/mm/yyyy',
      today: "Hoje",
      close: "Fechar",
      min: new Date(data.getFullYear() - 1, 0, 1),
      max: new Date(data.getFullYear() + 1, 11, 31),
      closeOnSelect: true
    });
  
    $("#dataPesquisa").click(function (event) {
        event.stopPropagation();
        $(".datepicker").first().pickadate("picker").open();
  });
  $('.timepicker').pickatime({
    default: 'now', // Set default time: 'now', '1:30AM', '16:30'    
    twelvehour: false, // Use AM/PM or 24-hour format
    donetext: 'Ok', // text for done-button
    cleartext: 'Limpar', // text for clear-button
    canceltext: 'Fechar', // Text for cancel-button
    autoclose: true // automatic close timepicker       
  });  
});

    
