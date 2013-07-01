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
  $(".default-checkbox").css("display", "none")
  $('.newFiles .upload:first').show()
  $('#moreUploads').click(function() {
    $(".newFiles .upload").each(function() {
      if ($(this).css("display") == "none") {
        $(this).show()
        return false
      }
    })
  })
  $(".default-checkbox").each(function() {
    if ($(this).attr('checked') == "checked") {
      $(this).next().addClass('active')
    }
  })
  $(".btn-default-picture").click(function(e) {
    if ($(this).hasClass('active')) {
      $(this).removeClass('active')
    } else {
      var a = $(this).prev()
      a.checked = a.value = true
      $('.default-checkbox').each(function() {
        $(this).prop('checked', false)
      })
      a.prop('checked', true)

      $('.btn-default-picture').removeClass('active')
      //$(this).addClass('active')
    }
  })
  $(".default-picture input").change(function() {
    console.log('test')
    $(".default-picture input").each(function() {
      this.checked = this.value = false
    })
    this.checked = this.value = true
  })
  $('.remove-picture').click(function() {
    $(this).prev().prop('checked', true)
    $(this).parent().parent().hide()
  })
})