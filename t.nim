import capnp, capnp/gensupport, collections/iface

# file: t.capnp

type
  Root* = ref object
    id*: string



makeStructCoders(Root, [], [
  (id, 0, PointerFlag.text, true)
  ], [])


