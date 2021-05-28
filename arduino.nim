proc NimMain() {.importc.}

template setup*(body) =
  proc setup {.exportcpp.} =
    NimMain()
    body

template loop*(body) =
  proc loop {.exportcpp.} =
    body

type
  Pin* = distinct uint8
  Mode* = distinct uint8
  Value* = distinct uint8
  BitOrder* = distinct uint8

{.push importc, header:"Arduino.h".}

let LED_BUILTIN* {.nodecl.}: Pin
let INPUT* {.nodecl.}: Mode
let OUTPUT* {.nodecl.}: Mode
let INPUT_PULLUP* {.nodecl.}: Mode
let HIGH* {.nodecl.}: Value
let LOW* {.nodecl.}: Value
let LSBFIRST* {.nodecl.}: BitOrder
let MSBFIRST* {.nodecl.}: BitOrder

proc delay*(milliseconds: culong)
proc delayMicroseconds*(microseconds: cuint)
proc millis*: culong
proc micros*: culong
proc pinMode*(pin: Pin, mode: Mode)
proc digitalWrite*(pin: Pin, value: Value)
proc digitalRead*(pin: Pin): Value
proc analogRead*(pin: Pin): cint
proc analogReference*(mode: uint8)
proc analogWrite*(pin: Pin, value: cint)
proc tone*(pin: Pin, frequency: cint, duration: culong = 0)
proc noTone*(pin: Pin)
proc pulseIn*(pin: Pin, value: Mode, timeout: culong = 1000000'u): culong
proc pulseInLong*(pin: Pin, value: Mode, timeout: culong = 1000000'u): culong
proc shiftIn*(data, clock: Pin, order: BitOrder): uint8
proc shiftOut*(data, clock: Pin, order: BitOrder, value: uint8)

{.pop.}
