Return-Path: <atx@atx.name>
From: Josef Gajdusek <atx@atx.name>
To: linux-sunxi@googlegroups.com
Cc: Josef Gajdusek <atx@atx.name>,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	gpatchesrdh@mveas.com,
	mturquette@linaro.org,
	hdegoede@redhat.com,
	sboyd@codeaurora.org,
	mturquette@baylibre.com,
	emilio@elopez.com.ar,
	linux@arm.linux.org.uk,
	edubezval@gmail.com,
	rui.zhang@intel.com,
	wens@csie.org,
	maxime.ripard@free-electrons.com,
	galak@codeaurora.org,
	ijc+devicetree@hellion.org.uk,
	mark.rutland@arm.com,
	pawel.moll@arm.com,
	robh+dt@kernel.org
Subject: [PATCH v2 0/5] sunxi: THS support
Date: Mon, 23 Nov 2015 09:02:47 +0100
Message-Id: <cover.1448263428.git.atx@atx.name>
List-ID: <linux-clk.vger.kernel.org>

Hello everyone,

this is v2 of my THS patchset

Changelog:

 * Some stylistic changes
 * devm_reset_control_get_optional -> devm_reset_control_get
 * Added the clk-h3-ths clock driver
   - Note: A23/A33/A83T do not have a separate clock, H3 seems to be the first
	 (and only?) SoC with it
   - Because of this, I moved the clock init code to the H3-specific init
	 function.
 * Use the nvmem cell abstraction instead of accessing the configuration memory directly
 * Use the IRQ line (and fixed incorrect interrupt number in the DTS)
 * Renamed to sun8i_ths

Ad the "magical constants": what I meant is that altough the datasheet explains
what they are, it does not explain how to pick their values. "ADC" and "Sensor"
"acquire time" are also not exactly the most helpful descriptions.
Anyway, I changed the values such as the final sampling rate is about 1Hz.

Josef Gajdusek (5):
  ARM: dts: sun8i: Add SID node
  clk: sunxi: Add driver for the H3 THS clock
  thermal: Add a driver for the Allwinner THS sensor
  dt-bindings: document sun8i_ths
  ARM: dts: sun8i: Add THS node to the H3 .dtsi

 Documentation/devicetree/bindings/clock/sunxi.txt  |   1 +
 .../devicetree/bindings/thermal/sun8i-ths.txt      |  31 ++
 arch/arm/boot/dts/sun8i-h3.dtsi                    |  40 +++
 drivers/clk/sunxi/Makefile                         |   1 +
 drivers/clk/sunxi/clk-h3-ths.c                     |  98 ++++++
 drivers/thermal/Kconfig                            |   7 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/sun8i_ths.c                        | 365 +++++++++++++++++++++
 8 files changed, 544 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-ths.txt
 create mode 100644 drivers/clk/sunxi/clk-h3-ths.c
 create mode 100644 drivers/thermal/sun8i_ths.c

-- 
2.4.10
