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

$(document).on 'turbolinks:load', ->
    $("#grid_input").on "click", ->
        window.location = "/home/grid_input/"
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
$(document).on 'change', '#ctg_select', ->
  $.ajax
    type: 'get'
    url: '/change_ctg'
    data: ctg_id: $(this).val()
    success: (result) ->
        console.log(result)
        $('#sub_ctg_select').html("")
        $.each result.ctg_array, ->
            console.log(this)
            option = $('<option>').text(this[0]).val(this[1])
            $('#sub_ctg_select').append(option)
            val = $("#sub_ctg_select").val()
            $("#postdatum_category_id").val(Number(val))

# サブカテゴリ変更時の処理
$(document).on 'turbolinks:load', ->
    $("#sub_ctg_select").on "change", ->
        val = $("#sub_ctg_select").val()
        debugger
        $("#postdatum_category_id").val(Number(val))

# 画面初期描画時のサブカテゴリIDセット処理(やっつけ。HTMLでvalueを指定しとくとなぜかjsからの更新が反映されない)
$(document).on 'ready page:load', ->
        val = $("#sub_ctg_select").val()
        $("#postdatum_category_id").val(Number(val))

# 月のチェンジファンクション
# $(document).on 'turbolinks:load', ->
#     $(".change-month").on "click", ->
#         if ($(this).attr("id") == "prev_month")
#             debugger
#             this_y = $(".this-year").get(0).innerText
#             this_m = $(".this-month").get(0).innerText
#             alert(this_y+this_m)
#         else if ($(this).attr("id") == "next_month")
#             next_m = ""

# 月のチェンジファンクション
# $(document).on 'click', '.change-month', ->
#   $.ajax
#     type: 'get'
#     url: '/change_month'
#     data: {
#         vector: $(this).attr("id"), 
#         year: $(".this-year").get(0).innerText, 
#         month: $(".this-month").get(0).innerText
#         }
#     success: (result) ->
#         debugger
#         # a = result.detail[0].response
#         console.log(result)
#         $("#postdata_list").html('<%=j render partial: "../views/home/_history_insert", collections: @allpostdata %>');
#         $("#postdata_list").html('<%= render template:"home/_history_insert" %>');

  