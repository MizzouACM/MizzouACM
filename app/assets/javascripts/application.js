// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require freetile
//= require bootstrap
//= require bootstrap-lightbox
//= require_tree .
$(function() {
  $('.newFiles .upload').hide()
  $('.newFiles .upload:first').show()
  $('#moreUploads').click(function() {
    $(".newFiles .upload").each(function() {
      if ($(this).css("display") == "none") {
        $(this).show()
        return false
      }
    })
  })
  $(".default-picture input").click(function() {
    console.log('test')
    $(".default-picture input").each(function() {
      this.checked = this.value = false
    })
    this.checked = this.value = true
  })
})