#****** doc
## PURPOSE
##   Generate documentation from any file types that support comments.
## DESIGN
##   - read
##
#******
import pkg/prelude
import ./config

var conf = config.Config(
  items: @["purpose", "complexity", "assumptions"]
)
save conf
echo repr load()
