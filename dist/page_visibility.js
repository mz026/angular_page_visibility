(function() {
  angular.module('angular-page-visibility', []).factory('$pageVisibility', [
    '$rootScope', '$document', function($rootScope, $document) {
      var getVisibilityKeys, hiddenKey, pageVisibility, visibilityChagedKey, _ref;
      pageVisibility = $rootScope.$new();
      getVisibilityKeys = function() {
        if (typeof ($document.attr('hidden')) !== 'undefined') {
          return ['hidden', 'visibilitychange'];
        } else if (typeof ($document.attr('mozHidden')) !== 'undefined') {
          return ['mozHidden', 'mozvisibilitychange'];
        } else if (typeof ($document.attr('msHidden')) !== 'undefined') {
          return ['msHidden', 'msvisibilitychange'];
        } else if (typeof ($document.attr('webkitHidden')) !== 'undefined') {
          return ['webkitHidden', 'webkitvisibilitychange'];
        }
      };
      _ref = getVisibilityKeys(), hiddenKey = _ref[0], visibilityChagedKey = _ref[1];
      $document.on(visibilityChagedKey, function() {
        if ($document.attr(hiddenKey)) {
          return pageVisibility.$broadcast('pageBlurred');
        } else {
          return pageVisibility.$broadcast('pageFocused');
        }
      });
      return pageVisibility;
    }
  ]);

}).call(this);

//# sourceMappingURL=page_visibility.js.map
