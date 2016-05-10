$(document).ready(function($){

  $("#profile_phone").mask("(999) 999-9999");

  $("#profile_phone").on("blur", function() {
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

    getMissingFormElements("new_profile", missing = [])

    if (missing.length != 0 ) {
      for (i=0; i< missing.length; i++){
        var test = missing[i].split("_")[1]
        $("#missing_"+test).html("missing " + test)
      }
      return false
    }

  });
});


function getMissingFormElements(formName,missing){
  var elements = document.forms[formName].elements;
  for (i=0; i<elements.length; i++){
    var el = elements[i].id
    if (elements[i].id != "" && elements[el].value == "" && el != "profile_avatar") {
      missing.push(elements[i].id)
    }
  }
}


$(document).ready(function () {
  $(".ref_form.btn").click(function(){
    var elem = document.forms["new_profile"].elements;
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
      else if (elem[i].type == "file") {
        document.getElementById('profile_avatar').value = null;
      }
    }
  });
});

$(document).ready(function() {
  $(".prof_post").on("click", function(event) {
    var inputs = $("#ajax_post input").serialize();
    var id = document.getElementById('ajax_post').action.split("/")[5]
    var base = "/api/profiles/" + id
    postAjax(inputs,base)
  });
});

function postAjax(inputs,path) {
  $.ajax({
      type: "POST",
      url: path + "/post_inputs",
      data: inputs,
      success: function(data,xhr) {
        if (xhr == "success") {
          getAjax(path)
        }
      },
      error: function() {
        console.log("error");
      },
  });
}

function getAjax(path) {
  var result="";
  $.ajax({
      url: path + "/post_outputs",
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        appPosts(data)
      },
      error: function() {
        console.log("error");
      },
  });
}

function appPosts(data) {
  debugger;
  for (var i = 0; i < data.length; i++) {
    var d_id = "prof-post_"+data[i].id
    $(".profile-posts").html('<p class=' + d_id + '>' + data[i].post + '</p>');
  }
}




