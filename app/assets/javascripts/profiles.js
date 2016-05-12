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
  var prof_id = $('#profile_id').val();
  var base = "/api/profiles/" + prof_id
  getAjax(base, "/profile_posts")
});

$(document).ready(function() {
  var prof_id = $('#profile_id').val();
  $(".prof_post").click(function(e) {
    e.preventDefault();
    var base = "/api/profiles/" + prof_id
    var inputs = $('#post').serialize();
    postAjax(inputs,base)
    document.getElementById('post').value = ""
  });
});

function postAjax(inputs,path) {
  $.ajax({
      type: "POST",
      url: path + "/post_inputs",
      data: inputs,
      success: function(data,xhr) {
        if (xhr == "success") {
          getAjax(path, "/post_outputs")
        }
      },
      error: function() {
        console.log("error");
      },
  });
}

function getAjax(path,action) {
  $.ajax({
      url: path + action,
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        appPost(data,this.url.split("/")[4])
      },
      error: function(data) {
        console.log("error");
      },
  });
}

function appPost(data,action) {
  if (action == "post_outputs"){
    showPosts(data)
  }
  else {
    $.each(data, function(key, value) {
      showPosts(key,value)
    });
  }
}

function showPosts(key,value) {
  var d_id = "prof-post_"+key
  var tim_id = "prof-post_create"+key
  var del_id = "delete_post_"+key
  var img_id = "image_"+key
  $(".profile-posts").append('<div class="row"> <div class=' + img_id + '</div> <img src=' + value[0] +
    ' alt="img" style="width:25px;height:25px;"></div><div class="col-sm-6"><p class=' + d_id + '> <input type="hidden" name="post-id" value=' +
    key + '>' + value[1] +'</p> </div></div></br> <div class="row"> <div class="col-sm-6"> <p class=' +
    tim_id + '>' + value[2] + '</p> </div> <div class="col-sm-2"> <input type="button" onclick="deletePost('
    + key +');" class="del btn btn-xs btn-danger" value="x" id=' + '"'+ del_id + '"' + '/></div> </div>');
}

function deletePost(id) {
  var base = "/api/posts/" + id
  $.ajax({
    url: base,
    type: 'DELETE',
    success: function(result,xhr) {
      if (xhr == "success") {
        $('.prof-post_' + id).remove();
        $('#delete_post_' + id).remove();
        $('.prof-post_create' + id).remove();
      }
    },
    error: function() {
      console.log("error");
    },
  });
}
