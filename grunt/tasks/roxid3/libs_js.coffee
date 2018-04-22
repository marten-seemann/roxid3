'use strict'

module.exports = (grunt, options) ->
  paths = options.paths
  pathsx = options.pathsx

  opts = options.conf.libs_js
  optsx = options.conf.libs_js

  src = []

  tasks:
    concat:
      libs_js:
        src: src
