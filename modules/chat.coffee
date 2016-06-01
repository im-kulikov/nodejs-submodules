"use strict"

# Export modules:
module.exports = (app, socket, client)->

  # Получаем данные от пользователя:
  socket.on 'chat-leave', (data)->
    # Логируем событие + данные:
    app.info "Пользователь #{ client } отключился: #{ JSON.stringify(data) }"
    # Добавляем ID:
    data.id = client
    # Отправляем всем:
    socket.broadcast.emit 'chat-leave', data

  # Получаем данные от пользователя:
  socket.on 'chat-joined', (data)->
    # Логируем событие + данные:
    app.info "Пользователь #{ client } подключился: #{ JSON.stringify(data) }"
    # Добавляем ID:
    data.id = client
    # Отправляем всем:
    socket.broadcast.emit 'chat-joined', data

  # Получаем данные от пользователя:
  socket.on 'chat-change-name', (data)->
    # Логируем событие + данные:
    app.info "Пользователь #{ client } сменил имя: #{ JSON.stringify(data) }"
    # Добавляем ID:
    data.id = client
    # Отправляем всем:
    socket.broadcast.emit 'chat-change-name', data
  
  # Получаем данные от пользователя:
  socket.on 'chat-start-typing', (data)->
    # Логируем событие + данные:
    app.info "Пользователь #{ client } начал печатать сообщение: #{ JSON.stringify(data) }"
    # Добавляем ID:
    data.id = client
    # Отправляем всем:
    socket.broadcast.emit 'chat-start-typing', data

  # Получаем данные от пользователя:
  socket.on 'chat-stop-typing', (data)->
    # Логируем событие + данные:
    app.info "Пользователь #{ client } закончил печатать сообщение: #{ JSON.stringify(data) }"
    # Добавляем ID:
    data.id = client
    # Отправляем всем:
    socket.broadcast.emit 'chat-stop-typing', data
  
  # Получаем сообщение от пользователя:
  socket.on 'chat-message', (data)->
    # Логируем событие + данные:
    app.info "Получили сообщение от #{ client }: #{ JSON.stringify(data) }"
    # Добавляем ID:
    data.id = client
    # Отправляем всем:
    socket.emit 'chat-message', data
    socket.broadcast.emit 'chat-message', data