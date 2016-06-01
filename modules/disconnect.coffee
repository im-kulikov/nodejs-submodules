"use strict"

# Export modules:
module.exports = (app, socket, client)->
  # Отключение пользователя:
  socket.on 'disconnect', (data)->
    # Логируем событие + данные:
    app.info "Client ##{ client } disconnected: #{ JSON.stringify(data) }"
    # Создаём глобальное событие об отключении:
    app.io.emit 'client-disconnected', id: client