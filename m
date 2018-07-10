Return-Path: <Yixun.Lan@amlogic.com>
From: Yixun Lan <yixun.lan@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<narmstrong@baylibre.com>
CC: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
	<liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu
	<jian.hu@amlogic.com>, <linux-clk@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/3] clk: meson: add a sub EMMC clock controller support
Date: Tue, 10 Jul 2018 16:36:55 +0000
Message-ID: <20180710163658.6175-1-yixun.lan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: yixun.lan@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

This driver will add a MMC clock controller driver support.
The original idea about adding a clock controller is during the
discussion in the NAND driver mainline effort[1].

I've tested this in the S400 board (AXG platform) by using NAND driver.

Changes since v1 [2]:
 - implement phase clock
 - update compatible name
 - adjust file name
 - divider probe() into small functions, and re-use them

[1] https://lkml.kernel.org/r/20180628090034.0637a062@xps13
[2] https://lkml.kernel.org/r/20180703145716.31860-1-yixun.lan@amlogic.com

Yixun Lan (3):
  clk: meson: add DT documentation for emmc clock controller
  clk: meson: add sub MMC clock dt-bindings IDs
  clk: meson: add sub MMC clock controller driver

 .../bindings/clock/amlogic,mmc-clkc.txt       |  31 ++
 drivers/clk/meson/Kconfig                     |   9 +
 drivers/clk/meson/Makefile                    |   1 +
 drivers/clk/meson/mmc-clkc.c                  | 419 ++++++++++++++++++
 .../clock/amlogic,meson-mmc-clkc.h            |  16 +
 5 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
 create mode 100644 drivers/clk/meson/mmc-clkc.c
 create mode 100644 include/dt-bindings/clock/amlogic,meson-mmc-clkc.h

-- 
2.18.0
