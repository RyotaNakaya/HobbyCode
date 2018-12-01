# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).on 'turbolinks:load', ->
#     $("#jumpRecord").on "click", ->
#         window.location.href = "/record/index"

$(document).on 'turbolinks:load', ->
    $(".del-data").on "click", ->
        if (confirm("このデータを削除しますか？"))
            document.location = "/home/delete/" + $(this).context.attributes.val.value
            return false;

$(document).on 'turbolinks:load', ->
    $(".edit-data").on "click", ->
        window.location = "/home/edit/" + $(this).context.attributes.val.value
        return false;

$(document).on 'turbolinks:load', ->
    $(".update-cancel").on "click", ->
        window.location = "/home/history/"
        return false;



# カレンダーの描画
$(document).on 'turbolinks:load', ->
  $('#calendar').fullCalendar {
      height: 500
  }
  return
$(document).on 'turbolinks:before-cache', ->
  $('#calendar').empty()
  return

# カテゴリ変更時のajax処理
$(document).on 'change', '#ctg_grp_select', ->
  $.ajax
    type: 'get'
    url: '/change_ctg'
    data: ctg_id: $(this).val()
    success: (result) ->
        console.log(result)
        $('#postdatum_category').html("")
        $.each result.ctg_array, ->
            console.log(this)
            option = $('<option>').text(this[0]).val(this[1])
            $('#postdatum_category').append(option)

$(document).on 'turbolinks:load', ->
    $("#postdatum_category").on "change", ->
        val = $("#postdatum_category").val()
        debugger
        $("#postdatum_category_id").val(val)

  