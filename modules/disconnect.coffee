"use strict"

# Export modules:
module.exports = (app, socket)->
  # Отключение пользователя:
  socket.on 'disconnect', (data)->
    # Логируем событие + данные:
    app.info "Client ##{ socket.data['client'] } disconnected: #{ JSON.stringify(data) }"
    # Создаём глобальное событие об отключении:
    app.io.emit 'client-disconnected', id: socket.data['client']