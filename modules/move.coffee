"use strict"

# Export modules:
module.exports = (app, socket, client, players)->
  # Спаун игрока:
  socket.on 'game-spawn', ->
    # Добавляем игрока:
    players[client] =
      id: client
      position:
        x: 0
        y: 0
        z: 0
      rotation:
        w: 0
        x: 0
        y: 0
        z: 0
    # Логируем событие + данные:
    data = id: client
    app.info "Пользователь #{ client } подключился к игре"
    # Отправляем всем:
    socket.broadcast.emit 'game-spawn', data
    # Отправляем клиенту данные о пользователях:
    for id of players
      # Отправляем данные:
      socket.emit 'game-spawn', players[id]

  # Запрашиваем позицию:
  socket.on 'game-get-position', ->
    # Делаем всем запрос:
    socket.broadcast.emit 'game-get-position'

  # Клиент прислал позицию - мы её раздаём всем:
  socket.on 'game-set-position', (data)->
    # Запоминаем позицию:
    players[data.id] =
      id: client
      position: data.position
      rotation: data.rotation
    # Отправляем клиентам данные:
    socket.broadcast.emit 'game-set-position', players[data.id]

  # Клиент передвинулся:
  socket.on 'game-move', (data)->
    # Запоминаем позицию:
    players[data.id] =
      id: client
      position: data.position
      rotation: data.rotation
    # Отправляем клиентам данные:
    socket.broadcast.emit 'game-move', players[data.id]

  # Клиент отключился:
  socket.on 'game-disconnect', ->
    # Удаляем клиента из списка:
    delete players[client]
    # Отправляем всем сообщение об отключении клиента:
    socket.broadcast.emit 'game-disconnect', id: client