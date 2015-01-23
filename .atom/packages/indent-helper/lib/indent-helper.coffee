_ = require 'underscore-plus'

module.exports =

  activate: ->
    atom.workspaceView.command 'indent-helper:indent', => @indent()

  indent: ->
    editor = atom.workspace.getActiveEditor()
    return unless editor?

    cursors = editor.getCursors()
    return if cursors.length <= 1

    tabStop = @calculateTabStop cursors
    editor.transact =>
      @indentCursor(cursor, tabStop) for cursor in cursors

  calculateTabStop: (cursors) ->
    tabStop = 0
    for cursor in cursors
      cursor.moveLeft(moveToEndOfSelection: true) unless cursor.selection.isEmpty()
      column = cursor.getBufferColumn()
      tabStop = column if column > tabStop
    tabStop

  indentCursor: (cursor, tabStop) ->
    spaces = tabStop - cursor.getBufferColumn()
    cursor.selection.insertText  _.multiplyString(' ', spaces)
