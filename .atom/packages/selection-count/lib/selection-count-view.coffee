{View, EditorView} = require 'atom'

module.exports =
class SelectionCountView extends View
  @content: ->
    @div class: 'selection-count inline-block'

  initialize: ->

  updateCount: =>
    return unless editor = atom.workspace.getActiveEditor()
    if editor.getSelection().isEmpty()
      @text("").show()
    else
      count = editor.getSelection().getText().length
      atom.config.observe 'selection-count.displayedText', =>
        sidetext = atom.config.get 'selection-count.displayedText'
        atom.config.observe 'selection-count.displaySpace', =>
          if atom.config.get 'selection-count.displaySpace'
            @text("#{count} #{sidetext}").show()
          else
            @text("#{count}#{sidetext}").show()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: =>
    @unsubscribe
    @detach()

  init: ->
    atom.packages.once('activated', @attach)

  attach: =>
    statusbar = atom.workspaceView.statusBar
    atom.config.observe 'selection-count.showOnTheLeft', =>
      if atom.config.get 'selection-count.showOnTheLeft'
        statusbar.appendLeft this
      else
        statusbar.prependRight this

    atom.workspaceView.eachEditorView (editor) =>
      @subscribe editor, "selection:changed", @updateCount

    @subscribe atom.workspaceView, "pane-container:active-pane-item-changed", @updateCount
    atom.workspaceView.on 'pane:item-removed', @destroy

    @updateCount()
