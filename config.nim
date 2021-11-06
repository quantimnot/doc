import config_model
export config_model

import pkg/[capnp, collections]

const defaultConfigBinaryFilename = "config.bin"

proc pack*(self: string): string =
  discard

proc flatten*(self: Config): string =
  discard

proc save*(self: Config, path = defaultConfigBinaryFilename) =
  let packed = capnp.pack self #Pointer self
  writeFile path, packed

proc load*(path = defaultConfigBinaryFilename): Config =
  let packed = readFile path
  capnp.unpack packed, 0, Config#newUnpackerFlat(packed).unpackPointer(0, Config)

