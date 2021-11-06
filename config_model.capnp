#****** doc/config.capnp
# Capnp config object spec.
#******
@0xc15e03567f297dd9;

struct Table(Key, Value) {
  entries @0 :List(Entry);
  struct Entry {
    key @0 :Key;
    value @1 :Value;
  }
}

struct HeaderType {
  rune @0: Text;
  title @1: Text;
  id @2: Text;
  sortPriority @3: Int8; # choose int size based on alignment
}

struct FileTypeConfig {
  remapItems @0: Table(Text, Text);
  head @1: Text;
  body @2: Text;
  foot @3: Text;
  inlineComment @4: Text;
  commentBegin @5: Text;
  commentEnd @6: Text;
}

struct Config {
  items @0: List(Text);
  ignoreItems @1: List(Text);
  itemOrder @2: List(Text);
  sourceItems @3: List(Text);
  preformattedItems @4: List(Text);
  formatItems @5: List(Text);
  options @6: List(Text);
  headerTypes @7: List(HeaderType);
  ignoreFiles @8: List(Text);
  acceptFiles @9: List(Text);
  headerSeparateRunes @10: List(Text);
  headerIgnoreRunes @11: List(Text);
  fileTypes @12: Table(Text, FileTypeConfig);
}
