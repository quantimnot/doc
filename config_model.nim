import capnp, capnp/gensupport, collections/iface

# file: config_model.capnp

type
  Table* = ref object
    entries*: seq[Table_Entry]

  Table_Entry* = ref object
    key*: AnyPointer
    value*: AnyPointer

  HeaderType* = ref object
    rune*: string
    title*: string
    id*: string
    sortPriority*: int8

  FileTypeConfig* = ref object
    remapItems*: Table
    head*: string
    body*: string
    foot*: string
    inlineComment*: string
    commentBegin*: string
    commentEnd*: string

  Config* = ref object
    items*: seq[string]
    ignoreItems*: seq[string]
    itemOrder*: seq[string]
    sourceItems*: seq[string]
    preformattedItems*: seq[string]
    formatItems*: seq[string]
    options*: seq[string]
    headerTypes*: seq[HeaderType]
    ignoreFiles*: seq[string]
    acceptFiles*: seq[string]
    headerSeparateRunes*: seq[string]
    headerIgnoreRunes*: seq[string]
    fileTypes*: Table



makeStructCoders(Table, [], [
  (entries, 0, PointerFlag.none, true)
  ], [])

makeStructCoders(Table_Entry, [], [
  (key, 0, PointerFlag.none, true),
  (value, 1, PointerFlag.none, true)
  ], [])

makeStructCoders(HeaderType, [
  (sortPriority, 0, 0, true)
  ], [
  (rune, 0, PointerFlag.text, true),
  (title, 1, PointerFlag.text, true),
  (id, 2, PointerFlag.text, true)
  ], [])

makeStructCoders(FileTypeConfig, [], [
  (remapItems, 0, PointerFlag.none, true),
  (head, 1, PointerFlag.text, true),
  (body, 2, PointerFlag.text, true),
  (foot, 3, PointerFlag.text, true),
  (inlineComment, 4, PointerFlag.text, true),
  (commentBegin, 5, PointerFlag.text, true),
  (commentEnd, 6, PointerFlag.text, true)
  ], [])

makeStructCoders(Config, [], [
  (items, 0, PointerFlag.text, true),
  (ignoreItems, 1, PointerFlag.text, true),
  (itemOrder, 2, PointerFlag.text, true),
  (sourceItems, 3, PointerFlag.text, true),
  (preformattedItems, 4, PointerFlag.text, true),
  (formatItems, 5, PointerFlag.text, true),
  (options, 6, PointerFlag.text, true),
  (headerTypes, 7, PointerFlag.none, true),
  (ignoreFiles, 8, PointerFlag.text, true),
  (acceptFiles, 9, PointerFlag.text, true),
  (headerSeparateRunes, 10, PointerFlag.text, true),
  (headerIgnoreRunes, 11, PointerFlag.text, true),
  (fileTypes, 12, PointerFlag.none, true)
  ], [])


