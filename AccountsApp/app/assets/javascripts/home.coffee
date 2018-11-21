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

# window.delData = (id) ->
#     if (confirm("このデータを削除しますか？"))
#         document.location = "/home/delete/" + id;
#         return false;
