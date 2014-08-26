describe 'Page Visibility', ->
  $document = null
  beforeEach module 'angular-page-visibility'
  beforeEach module ($provide)->
    $document =
      attrs: {}
      events: {}
      _setAttr: (key, val)->
        @attrs[key] = val
      attr: (key)->
        @attrs[key]
      on: (eventName, cb)->
        @events[eventName] = cb
      _trigger: (eventName)->
        @events[eventName] && @events[eventName]()

    $provide.value('$document', $document)
    null

  describe 'when document visibility is controlled by `hidden`', ->
    it '$broadcast-s `pageFocused` when page turn visible', ->
      inject (_$document_)->
        $document._setAttr('hidden', false)

      inject ($pageVisibility)->
        onFocused = sinon.spy()
        $pageVisibility.$on('pageFocused', onFocused)

        $document._trigger('visibilitychange')

        expect(onFocused.called).toBe(true)

    it '$broadcast-s `pageBlurred` when page turns invisible', ->
      inject (_$document_)->
        $document._setAttr('hidden', true)

      inject ($pageVisibility)->
        onBlurred = sinon.spy()
        $pageVisibility.$on('pageBlurred', onBlurred)

        $document._trigger('visibilitychange')

        expect(onBlurred.called).toBe(true)
    
  describe 'when document visibility is controlled by `mozHidden`', ->
    it '$broadcast-s `pageFocused` when page turn visible', ->
      inject (_$document_)->
        $document._setAttr('mozHidden', false)

      inject ($pageVisibility)->
        onFocused = sinon.spy()
        $pageVisibility.$on('pageFocused', onFocused)

        $document._trigger('mozvisibilitychange')

        expect(onFocused.called).toBe(true)

    it '$broadcast-s `pageBlurred` when page turns invisible', ->
      inject (_$document_)->
        $document._setAttr('mozHidden', true)

      inject ($pageVisibility)->
        onBlurred = sinon.spy()
        $pageVisibility.$on('pageBlurred', onBlurred)

        $document._trigger('mozvisibilitychange')

        expect(onBlurred.called).toBe(true)
