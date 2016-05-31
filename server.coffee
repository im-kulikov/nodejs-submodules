"use strict"

port    = process.env.PORT || 3000
io      = require('socket.io')(port)
shortid = require('shortid')
moment  = require('momentjs')
sleep   = require('sleep')

# Application:
app =
  __log: (level, message)->
    console.log "#{ app.currentTime() }\t[#{ level }]\t => #{ message }"
  error: (message)->
    app.__log('ERROR', message)
  info: (message)->
    app.__log('INFO', message)
  log: (message)->
    app.__log('LOG', message)
  debug: (message)->
    app.__log('DEBUG', message)
  io: io
  sleep: sleep.sleep
  usleep: sleep.usleep
  shortID: shortid.generate
  moment: moment
  currentTime: ->
    moment(new Date()).format('YYYY-MM-DD HH:mm:ss')

# Debug info:
app.info "Server started at port: #{ port }"

# Export modules:
module.exports = app