do ->
  ScreenSize = ->
    @_deps = new (Deps.Dependency)
    @_type = 'desktop'
    return

  ScreenSize::type = ->
    @_deps.depend()
    @_type

  ScreenSize::isType = (type) ->
    type == @type()

  ScreenSize::isTablet = ->
    @isType 'tablet'

  ScreenSize::isPhone = ->
    @isType 'phone'

  ScreenSize::isDesktop = ->
    @isType 'desktop'

  ScreenSize::detectScreenSize = ->
    screenSize = $(window).width()
    options = this
    @_type = do ->
      if screenSize > 991
        return 'desktop'
      else if screenSize > 767
        return 'tablet'
      else
        return 'phone'
    @_deps.changed()
    return

  Meteor.ScreenSize = new ScreenSize
  Meteor.ScreenSize.detectScreenSize()
  return

if typeof UI isnt 'undefined'
  UI.registerHelper 'isTablet', ->
    return Meteor.ScreenSize.isTablet()

  UI.registerHelper 'isPhone', ->
    return Meteor.ScreenSize.isPhone()

  UI.registerHelper 'isDesktop', ->
    return Meteor.ScreenSize.isDesktop()

throttledResize = _.throttle ->
  Meteor.ScreenSize.detectScreenSize()
, 2000

Meteor.startup ->
  $(window).resize ->
    throttledResize()