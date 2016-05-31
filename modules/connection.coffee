"use strict"

# Export modules:
module.exports = (app, socket)->
  # Создаём ID клиента:
  socket.data['client'] = app.shortID()
  # Логируем подключение:
  app.info "Client connected: #{ socket.data['client'] }"
  # Сообщаем об этом остальным:
  socket.broadcast.emit 'client-connected', id: socket.data['client']