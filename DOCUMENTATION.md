Documentation:
=============

## Chat Events:

* `chat-leave` - leave chat, send data: `{ id: <client_id>, <other...> }`
* `chat-join` - join chat, send data: `{ id: <client_id>, <other...> }`
* `chat-change-name` - change name, send data: `{ id: <client_id>, <other...> }`
* `chat-start-typing` - user start typing message, send data: `{ id: <client_id>, <other...> }`
* `chat-stop-typing` - user stop typing message, send data: `{ id: <client_id>, <other...> }`
* `chat-message` - user send message, send data: `{ id: <client_id>, <other...> }`

## Audio Events:

* `audio-receive-data` - player send binary data
* `audio-send-data` - server send binary data

## Video Events:

* `video-receive-data` - player send binary data
* `video-send-data` - server send binary data

## Connection Events:

* `connection` - server receive this event
* `client-connected` - server informs the user connects, send data to all: `{ id: <client_id> }` 

## Disconnect Events:

* `disconnect` - server receive this event
* `client-disconnected` - server informs the user disconnected, send data to all: `{ id: <client_id> }` 

## GameMove:

* `game-spawn` - client spawn
```
Receive:
    NULL
Emit to client:
    multiple: player object
    {
        id: <player_id>,
        position: {
            x: <float>,
            y: <float>,
            z: <float>
        },
        rotation: {
            w: <float>,
            x: <float>,
            y: <float>,
            z: <float>
        }
    }
Broadcast to clients:
    single: player object
    {
        id: <player_id>,
        position: {
            x: <float>,
            y: <float>,
            z: <float>
        },
        rotation: {
            w: <float>,
            x: <float>,
            y: <float>,
            z: <float>
        }
    }
```

* `game-get-position` - request clients positions
```
Receive:
    NULL
Emit to clients:
    NULL
```

* `game-set-position` - set client position
```
Receive:
    position object
    {
        position: {
            x: <float>,
            y: <float>,
            z: <float>
        },
        rotation: {
            w: <float>,
            x: <float>,
            y: <float>,
            z: <float>
        }
    }
Broadcast to clients:
    position object
    {
        id: <player_id>
        position: {
            x: <float>,
            y: <float>,
            z: <float>
        },
        rotation: {
            w: <float>,
            x: <float>,
            y: <float>,
            z: <float>
        }
    }
```

* `game-move` - receive client movement
```
Receive:
    position object
    {
        position: {
            x: <float>,
            y: <float>,
            z: <float>
        },
    }
Broadcast to clients:
    position object
    {
        id: <player_id>
        position: {
            x: <float>,
            y: <float>,
            z: <float>
        },
        rotation: {
            w: <float>,
            x: <float>,
            y: <float>,
            z: <float>
        }
    }
```

* `game-disconnect` - client disconnected
```
Receive:
    NULL
Broadcast to clients:
    who disconnected
    {
        id: <player_id>
    }
```
