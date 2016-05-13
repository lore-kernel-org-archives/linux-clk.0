Return-Path: <Purna.Mandal@microchip.com>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>,
	<linux-clk@vger.kernel.org>, Purna Chandra Mandal
	<purna.mandal@microchip.com>, <devicetree@vger.kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala
	<galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob
 Herring <robh+dt@kernel.org>, Joshua Henderson
	<joshua.henderson@microchip.com>, Pawel Moll <pawel.moll@arm.com>, Sandeep
 Sheriker <sandeepsheriker.mallikarjun@microchip.com>, Mark Rutland
	<mark.rutland@arm.com>
Subject: [PATCH v11 0/3] PIC32MZDA Clock Driver
Date: Fri, 13 May 2016 13:22:38 +0530
Message-ID: <1463125961-10706-1-git-send-email-purna.mandal@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: purna.mandal@microchip.com
List-ID: <linux-clk.vger.kernel.org>

Clock bindings got acked and then essentially unacked, while the clock
driver never made it upstream. In the meantime, the initial DTS file
made it upstream. This latest patch series includes a patch to go back
and correct the DTS files to reflect the new clock bindings in this
patch series.

Note: Please pull this complete series through the MIPS tree.

Purna Chandra Mandal (3):
  dt/bindings/clk: Add PIC32 clock binding documentation.
  clk: microchip: Add Microchip PIC32 clock driver.
  MIPS: dts: pic32: Update dts to reflect new PIC32MZDA clk binding

 .../devicetree/bindings/clock/microchip,pic32.txt  |   39 +
 arch/mips/boot/dts/pic32/pic32mzda-clk.dtsi        |  236 -----
 arch/mips/boot/dts/pic32/pic32mzda.dtsi            |   63 +-
 arch/mips/boot/dts/pic32/pic32mzda_sk.dts          |    5 +-
 drivers/clk/Kconfig                                |    3 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/microchip/Makefile                     |    2 +
 drivers/clk/microchip/clk-core.c                   | 1031 ++++++++++++++++++++
 drivers/clk/microchip/clk-core.h                   |   84 ++
 drivers/clk/microchip/clk-pic32mzda.c              |  275 ++++++
 include/dt-bindings/clock/microchip,pic32-clock.h  |   42 +
 11 files changed, 1522 insertions(+), 259 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32.txt
 delete mode 100644 arch/mips/boot/dts/pic32/pic32mzda-clk.dtsi
 create mode 100644 drivers/clk/microchip/Makefile
 create mode 100644 drivers/clk/microchip/clk-core.c
 create mode 100644 drivers/clk/microchip/clk-core.h
 create mode 100644 drivers/clk/microchip/clk-pic32mzda.c
 create mode 100644 include/dt-bindings/clock/microchip,pic32-clock.h

-- 
1.8.3.1
