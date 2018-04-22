'use strict'

module.exports = (grunt, options) ->
  roxid_less = {}
  for theme in options.conf.colorthemes
    roxid_less["roxid_css_#{theme}"] =
      src: "<%= pathsx.src.css %>/theme_template.less"
      options:
        modifyVars:
          theme: theme

  tasks:
    less: roxid_less
