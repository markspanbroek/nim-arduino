Arduino for Nim
===============

Provides [Nim][1] bindings for most [Arduino functions][2].

Installation
------------

Can only be used in an environment where the `<Arduino.h>` C++ header is
available, for instance [PlatformIO][3] with the [Nim plugin][4].

Use the following snippet in `platformio.ini` to add the Nim bindings for
Arduino to PlatformIO:

```ini
lib_deps =
  https://github.com/markspanbroek/nim-arduino
```

Example
-------

`src/main.nim`:

```nim
import pkg/nim-arduino/arduino

setup:
  pinMode(LED_BUILTIN, OUTPUT)

loop:
  digitalWrite(LED_BUILTIN, HIGH)
  delay(1000)
  digitalWrite(LED_BUILTIN, LOW)
  delay(1000)
```

[1]: https://nim-lang.org
[2]: https://arduino.cc/reference
[3]: https://platformio.org
[4]: https://github.com/markspanbroek/nim-platformio