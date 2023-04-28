#[
  A directory for constant magic-ish integers indicating stuff

  This code is licensed under the MIT license
]#

const
  IPC_SERVER_DEFAULT_PORT* = 8089
  IPC_CLIENT_HANDSHAKE* = -65536
  IPC_SERVER_DYING* = -65535
  IPC_SERVER_CLOSING* = -65534
  IPC_SERVER_REQUEST_TERMINATION* = -65533
  IPC_SERVER_HANDSHAKE_ACCEPTED* = -65532