"use strict"

# Export modules:
module.exports = (app, socket)->
  # Получаем данные от пользователя:
  socket.on 'video-receive-data', (data)->
    # Логируем событие + данные:
    app.info "Получили video-данные от #{ socket.data['client'] }"
    # Отправляем всем:
    socket.broadcast.emit 'video-send-data', data