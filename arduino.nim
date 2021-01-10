template setup*(body) =
  proc setup {.exportc.} =
    body

template loop*(body) =
  proc loop {.exportc.} =
    body

type
  Pin* = distinct uint8
  Mode* = distinct uint8
  Value* = distinct uint8

{.push importc, header:"Arduino.h".}

let LED_BUILTIN* {.nodecl.}: Pin
let INPUT* {.nodecl.}: Mode
let OUTPUT* {.nodecl.}: Mode
let HIGH* {.nodecl.}: Value
let LOW* {.nodecl.}: Value

proc delay*(milliseconds: int)
proc pinMode*(pin: Pin, mode: Mode)
proc digitalWrite*(pin: Pin, value: Value)

{.pop.}
