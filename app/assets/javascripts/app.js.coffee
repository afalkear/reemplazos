Activity = (name, date, responsible, start, end) ->
  @name = ko.observable(name)
  @date = ko.observable(date)
  @responsible = ko.observable(responsible)
  @start = ko.observable(start)
  @end = ko.observable(end)
  return

viewModel =
  hours: ko.observableArray()
  days: ko.observableArray()
  activities: ko.observableArray(activities)

$(document).ready ->
   ko.applyBindings viewModel

# viewModel =
#   flash: ko.observable()
#   shownOnce: ko.observable()
#   currentPage: ko.observable()
#   errors: ko.observableArray()
#   items: ko.observableArray()
#   selectedItem: ko.observable()
#   tempItem:
#     id: ko.observable()
#     title: ko.observable()
#     body: ko.observable()
#     updated_at: ko.observable()
#     created_at: ko.observable()
#
#   setFlash: (flash) ->
#     @flash flash
#     @shownOnce false
#     return
#
#   checkFlash: ->
#     if @shownOnce() == true
#       @flash ''
#     return
#
#   clearTempItem: ->
#     @tempItem.id ''
#     @tempItem.title ''
#     @tempItem.body ''
#     @tempItem.updated_at ''
#     @tempItem.created_at ''
#     return
#
#   prepareTempItem: ->
#     @tempItem.id ko.utils.unwrapObservable(@selectedItem().id)
#     @tempItem.title ko.utils.unwrapObservable(@selectedItem().title)
#     @tempItem.body ko.utils.unwrapObservable(@selectedItem().body)
#     @tempItem.updated_at ko.utils.unwrapObservable(@selectedItem().updated_at)
#     @tempItem.created_at ko.utils.unwrapObservable(@selectedItem().created_at)
#     return
#
#   indexAction: ->
#     @checkFlash()
#     $.getJSON '/posts.json', (data) ->
#       viewModel.items data
#       viewModel.currentPage 'index'
#       viewModel.shownOnce true
#       return
#     return
#
#   showAction: (itemToShow) ->
#     @checkFlash()
#     @errors []
#     @selectedItem itemToShow
#     @currentPage 'show'
#     @shownOnce true
#     return
#
#   newAction: ->
#     @checkFlash()
#     @currentPage 'new'
#     @clearTempItem()
#     @shownOnce true
#     return
#
#   editAction: (itemToEdit) ->
#     @checkFlash()
#     @selectedItem itemToEdit
#     @prepareTempItem()
#     @currentPage 'edit'
#     @shownOnce true
#     return
#
#   createAction: (itemToCreate) ->
#     json_data = ko.toJS(itemToCreate)
#     $.ajax
#       type: 'POST'
#       url: '/posts.json'
#       data: post: json_data
#       dataType: 'json'
#       success: (createdItem) ->
#         viewModel.errors []
#         viewModel.setFlash 'Post successfully created.'
#         viewModel.clearTempItem()
#         viewModel.showAction createdItem
#         return
#       error: (msg) ->
#         viewModel.errors JSON.parse(msg.responseText)
#         return
#     return
#
#   updateAction: (itemToUpdate) ->
#     json_data = ko.toJS(itemToUpdate)
#     delete json_data.id
#     delete json_data.created_at
#     delete json_data.updated_at
#     $.ajax
#       type: 'PUT'
#       url: '/posts/' + itemToUpdate.id() + '.json'
#       data: post: json_data
#       dataType: 'json'
#       success: (updatedItem) ->
#         viewModel.errors []
#         viewModel.setFlash 'Post successfully updated.'
#         viewModel.showAction updatedItem
#         return
#       error: (msg) ->
#         viewModel.errors JSON.parse(msg.responseText)
#         return
#     return
#
#   destroyAction: (itemToDestroy) ->
#     if confirm('Are you sure?')
#       $.ajax
#         type: 'DELETE'
#         url: '/posts/' + itemToDestroy.id + '.json'
#         dataType: 'json'
#         success: ->
#           viewModel.errors []
#           viewModel.setFlash 'Post successfully deleted.'
#           viewModel.indexAction()
#           return
#         error: (msg) ->
#           viewModel.errors JSON.parse(msg.responseText)
#           return
#     return
#
# #Set up bindings and call index action.
# $(document).ready ->
#   ko.applyBindings viewModel
#   viewModel.indexAction()
#   viewModel.clearTempItem()
#   return
