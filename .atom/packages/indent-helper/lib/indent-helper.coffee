#
# Copyright (c) 2014 by Maximilian Schüßler. See LICENSE for details.
#

_ = require 'underscore-plus'

module.exports =

  # Public: Activate the package.
  activate: ->
    atom.commands.add 'atom-text-editor', 'indent-helper:indent', => @indent()

  # Public: Main method.
  #
  # It triggers the indentation of all active cursors.
  indent: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?

    cursors = editor.getCursors()
    return if cursors.length <= 1

    tabStop = @calculateTabStop cursors
    editor.transact =>
      @indentCursor(cursor, tabStop) for cursor in cursors

  # Internal: Calculate the needed tabStop for all cursors.
  #
  # cursors - The cursors as {Array}.
  #
  # Returns the tabStop as {Number}.
  calculateTabStop: (cursors) ->
    tabStop = 0
    for cursor in cursors
      cursor.moveLeft(moveToEndOfSelection: true) unless cursor.selection.isEmpty()
      column = cursor.getBufferColumn()
      tabStop = column if column > tabStop
    tabStop

  # Internal: Indent the cursor to tabStop.
  #
  # cursor  - The cursor to indent as {Object}.
  # tabStop - The tabStop to indent to as {Number}.
  indentCursor: (cursor, tabStop) ->
    spaces = tabStop - cursor.getBufferColumn()
    cursor.selection.insertText  _.multiplyString(' ', spaces)
