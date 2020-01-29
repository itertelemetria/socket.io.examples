import os
import socketio

sio = socketio.Client(ssl_verify=False)

@sio.event
def connect():
    sio.emit('psubscribe', os.environ["REALTIME_CHANNEL"])
    print('connection established')

@sio.event
def disconnect():
    print('disconnected from server')

sio.connect(f'https://{os.environ["URL"]}:{os.environ["PORT"]}')
sio.wait()