$(document).ready(function($){

  $("#user_phone").mask("(999) 999-9999");

  $("#user_phone").on("blur", function() {
    var last = $(this).val().substr( $(this).val().indexOf("-") + 1 );

    if( last.length == 3 ) {
        var move = $(this).val().substr( $(this).val().indexOf("-") - 1, 1 );
        var lastfour = move + last;

        var first = $(this).val().substr( 0, 9 );

        $(this).val( first + '-' + lastfour );
     }
   });
});

$(document).ready(function () {

  $(".submit_bt").click(function(){

    getMissingFormElelemets("new_user", missing = [])

    if (missing.length != 0 ) {
      for (i=0; i< missing.length; i++){
        var test = missing[i].split("_")[1]
        $("#missing_"+test).html("missing " + test)
      }
      return false
    }

  });
});


function getMissingFormElelemets(formName,missing){

  var elements = document.forms[formName].elements;

  for (i=0; i<elements.length; i++){
    if (elements[i].id != "" && elements[elements[i].id].value == "") {
      missing.push(elements[i].id)
    }
  }
}


$(document).ready(function () {

  $(".ref_form.btn").click(function(){

    var elem = document.forms["new_user"].elements;

    for (i=0; i<elem.length; i++){
      if (elem[i].type == "text") {
        if (elem[i].value == "") {
          var test2 = elem[i].id.split("_")[1]
          $("#missing_"+test2).html("");

         }
         else {
           elem[i].value = ""
         }
      }
    }

  });
});



