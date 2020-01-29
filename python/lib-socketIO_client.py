import os
from socketIO_client import SocketIO, BaseNamespace

class Namespace(BaseNamespace):
  def on_connect(self, *args):
    self.emit('psubscribe', os.environ["REALTIME_CHANNEL"])
    print('connect')

  def on_disconnect(self, *args):
    print('disconnect')

  def on_reconnect(self, *args):
    print('reconnect')

socketIO = SocketIO(f'https://{os.environ["URL"]}', os.environ["PORT"], Namespace, verify=False)
socketIO.wait()
