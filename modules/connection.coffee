"use strict"

# Export modules:
module.exports = (app, socket, client)->
  # Логируем подключение:
  app.info "Client connected: #{ client }"
  # Сообщаем об этом остальным:
  socket.broadcast.emit 'client-connected', id: client