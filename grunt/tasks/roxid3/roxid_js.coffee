'use strict'

module.exports.tasks =
  coffee:
    roxid_js:
      src: [ '<%= pathsx.src.js %>/roxid/main.coffee' ]

  coffeelint:
    roxid_js:
      src: [ '<%= pathsx.src.js %>/roxid/*.coffee' ]
