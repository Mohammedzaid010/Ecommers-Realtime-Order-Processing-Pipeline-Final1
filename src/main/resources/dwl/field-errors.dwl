%dw 2.0
output application/json
var lines = ((error.description default '') splitBy '\n') filter (l) -> not isBlank(l)
---
lines map (l) -> if (l contains ':')
  { field: trim(l[0 to (indexOf(l, ':') - 1)]), message: trim(l[(indexOf(l, ':') + 1) to -1]) }
else
  { field: 'payload', message: trim(l) }
