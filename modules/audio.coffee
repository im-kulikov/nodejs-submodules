"use strict"

# Export modules:
module.exports = (app, socket)->
  # Получаем данные от пользователя:
  socket.on 'audio-receive-data', (data)->
    # Логируем событие + данные:
    app.info "Получили audio-данные от #{ socket.data['client'] }"
    # Отправляем всем:
    socket.broadcast.emit 'audio-send-data', data