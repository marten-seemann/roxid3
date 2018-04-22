$ ->
  inserted = false
  duration = 300

  $el = $("#navigation")
  $el_top = $("#navigation-top")
  offset = $el.offset().top + $el.height()

  # set wallpaper, if this is not a smartphone
  wallpaper = $("body").data "wallpaper"
  if wallpaper and !Modernizr.mq('only screen and (max-width: 767px)')
    $("body").css "background-image", "url(#{wallpaper})"

  $(window).on 'resize scroll', ->
    return unless $.zDetectDeviceByResolution() is "desktop"
    if window.pageYOffset > offset
      $el_top.fadeIn duration
      unless inserted
        $el.find(".nav").first().clone().appendTo $el_top.find(".navbar-brand").parent()
        $el.find(".z-tablet-navbar-trigger").first().clone().appendTo $el_top.find(".navbar-brand").parent()
        inserted = true
    else
      $el_top.fadeOut duration
