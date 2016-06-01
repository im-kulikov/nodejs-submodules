"use strict"

# Export modules:
module.exports = (app, socket, client)->
  # Получаем данные от пользователя:
  socket.on 'video-receive-data', (data)->
    # Логируем событие + данные:
    app.info "Получили video-данные от #{ client }"
    # Отправляем всем:
    socket.broadcast.emit 'video-send-data', data