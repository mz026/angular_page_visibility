angular.module('angular-page-visibility', [])
  .factory('$pageVisibility', [ '$rootScope', '$document', ($rootScope, $document)->
    pageVisibility = $rootScope.$new()

    getVisibilityKeys = ->
      if typeof($document.attr('hidden')) != 'undefined'
        [ 'hidden', 'visibilitychange' ]
      else if typeof($document.attr('mozHidden')) != 'undefined'
        [ 'mozHidden', 'mozvisibilitychange' ]
      else if typeof($document.attr('msHidden')) != 'undefined'
        [ 'msHidden', 'msvisibilitychange' ]
      else if typeof($document.attr('webkitHidden')) != 'undefined'
        [ 'webkitHidden', 'webkitvisibilitychange' ]

    return pageVisibility unless getVisibilityKeys()

    [hiddenKey, visibilityChagedKey] = getVisibilityKeys()

    $document.on(visibilityChagedKey, ->
      if $document.attr(hiddenKey)
        pageVisibility.$broadcast('pageBlurred')
      else
        pageVisibility.$broadcast('pageFocused')
    )

    pageVisibility
  ])
