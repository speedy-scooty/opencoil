# opencoil / electronics



![picture](https://github.com/speedy-scooty/opencoil/blob/b7b5a5852f1626367fa80c27c357b1f2ee417245/electronics/esp-wireless-charging-pcb/pcb-ass.jpg)

*Assembled pcb v1*

As of 2022 there is a PCB version 2 with extra breakout gpio pins, schematic [here](https://github.com/speedy-scooty/opencoil/blob/b7b5a5852f1626367fa80c27c357b1f2ee417245/electronics/esp-wireless-charging-v2/esp-wireless-charging.pdf)

![picture](https://github.com/speedy-scooty/opencoil/blob/b7b5a5852f1626367fa80c27c357b1f2ee417245/electronics/esp-wireless-charging-v2/pinoutsv2.jpg)

*Assembled pcb v2*

### Bill of Materials 

* PCB: Send the gerbers from this repo to your fab of choice.
* ESP12F: Widely available.
* AM1117 3.3v Regulator: Widely available.
* QI compatible wireless charging coil delivering 5v and > [500 mA](https://docs.ai-thinker.com/_media/esp8266/docs/esp-12f_product_specification_en.pdf): For example [this](https://aliexpress.com/item/4001154059743.html), search keywords: "pcba receiver module qi". Alternatively you could repurpose 'adaptor coils' advertised to convert non-QI phones to wireless charging, such as [these](https://www.pearl.de/mtrkw-9811-qi-kompatible-receiver-pads.shtml)*. 

**NOTE**: Be aware that these 'adaptor coils' could contain additional circuitry that condition the output for use with specific mobile phones (the pearl.de ones do). [Here](https://github.com/speedy-scooty/opencoil/tree/main/coil) is a guide how to modify the 'pearl' coils to deliver maximum voltage (5v)constantly, instead of switching to low power, 2.5v output when not enough/too much current is drawn.

