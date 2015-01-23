var EditorView = require('atom').EditorView,
    origHandleEvents = EditorView.prototype.handleEvents;

module.exports = {
  configDefaults: {
    multiplier: '0.3'
  },

  activate: function(state) {
    EditorView.prototype.handleEvents = function() {
      var multiplier = parseFloat(atom.config.get('woah-there-mousewheel.multiplier')) || 0.3;

      if (!this.mini) {
        this.scrollView.on('mousewheel', (function(_this) {
          return function(e) {
            var delta = e.originalEvent.wheelDeltaY;
            if (delta != 0) {
              // The original scroll multiplier is -1 so apply +1-multiplier
              _this.scrollTop(_this.scrollTop() + delta * (1-multiplier));
              return false;
            }
          };
        })(this));
      }

      origHandleEvents.call(this);
    };
  },

  deactivate: function() {
    EditorView.prototype.handleEvents = origHandleEvents;
  }

  // TODO: bind/unbind currently open editorviews
};
