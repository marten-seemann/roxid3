'use strict'

module.exports.tasks =
  watch:
    roxid_js:
      files: [
        '<%= pathsx.src.js %>/roxid/**/*.coffee'
      ]

    libs_js:
      files: [
        '<%= pathsx.src.js %>/libs/**/*.js'
        '<%= pathsx.src.js %>/oxscripts/**/*.js'
      ]

    libs_css:
      files: [
        '<%= pathsx.src.css %>/libs/code/**/*.css'
        '<%= pathsx.src.css %>/libs/assets/**/*.css'
      ]

    libs_productpage_js:
      files: [ '<%= pathsx.src.js %>/libs_productpage/**/*.js' ]

    bootstrap_css:
      files: [
        '<%= pathsx.src.css %>/bootstrap/**/*.less'
        '<%= pathsx.src.css %>/colorthemes/**/*.less'
      ]

    roxid_css:
      files: [
        '<%= pathsx.src.css %>/*.less'
        '<%= pathsx.src.css %>/colorthemes/**/*.less'
      ]

    livereload:
      options:
        livereload: 9371
      files: [
        '<%= pathsx.tpl %>/**/*.tpl'
      ]
