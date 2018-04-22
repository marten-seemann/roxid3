'use strict'

module.exports = (grunt, options) ->

  bootstrap_less = {}
  for theme in options.conf.colorthemes
    bootstrap_less["bootstrap_css_#{theme}"] =
      options:
        modifyVars:
          theme: theme
      src: "<%= pathsx.src.css %>/bootstrap/bootstrap_template.less"

  tasks:
    less: bootstrap_less
