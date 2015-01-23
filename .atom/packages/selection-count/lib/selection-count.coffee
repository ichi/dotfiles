SelectionCountView = require './selection-count-view'
# charCounters = []

module.exports =
  selectionCountView: null
  configDefaults:
    showOnTheLeft: false
    displayedText: "characters selected"
    displaySpace: true

  activate: (state) ->
    @selectionCountView = new SelectionCountView()
    @selectionCountView.init()
    # atom.workspaceView.eachEditorView (editorView) ->
      # counter = new SelectionCountView(editorView)
      # counter.init()
      # charCounters.push = counter

  deactivate: ->
    @selectionCountView.destroy()
    # for counter in charCounters
    #   counter.destroy()

  serialize: ->
    selectionCountViewState: @selectionCountView.serialize()
