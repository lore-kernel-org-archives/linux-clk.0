Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 0/7] clk: sunxi: Add support for the Audio PLL
Date: Thu, 21 May 2015 22:53:59 +0200
Message-Id: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

This serie adds support for the PLL2 aka the Audio PLL on the
Allwinner A10 and the later SoCs.

This is the first stepping stone to get the audio support merged.

This serie is built on top of a generic clk-factor driver to handle
clock that multiply their parent clock rate (mostly PLL's), in order
to provide the driver for the PLL2 base clock, and then adds the
drivers for the clock that derive from the Audio PLL.

Thanks!
Maxime

Changes from v1:
  - Removed a bogus of_iomap in the mod1 clock driver
  - Wrote the clk-factor driver
  - Converted the PLL2 clock to that driver

Emilio López (5):
  clk: sunxi: codec clock support
  clk: sunxi: mod1 clock support
  ARM: sunxi: Add PLL2 support
  ARM: sunxi: Add codec clock support
  ARM: sun7i: Add mod1 clock nodes

Maxime Ripard (2):
  clk: Add a basic factor clock
  clk: sunxi: Add a driver for the PLL2

 arch/arm/boot/dts/sun4i-a10.dtsi           |  18 +++
 arch/arm/boot/dts/sun5i.dtsi               |  18 +++
 arch/arm/boot/dts/sun7i-a20.dtsi           |  73 +++++++++++
 drivers/clk/Makefile                       |   1 +
 drivers/clk/clk-factor.c                   | 176 +++++++++++++++++++++++++++
 drivers/clk/sunxi/Makefile                 |   3 +
 drivers/clk/sunxi/clk-a10-codec.c          |  44 +++++++
 drivers/clk/sunxi/clk-a10-mod1.c           |  84 +++++++++++++
 drivers/clk/sunxi/clk-a10-pll2.c           | 189 +++++++++++++++++++++++++++++
 include/dt-bindings/clock/sun4i-a10-pll2.h |  53 ++++++++
 include/linux/clk-provider.h               |  41 +++++++
 11 files changed, 700 insertions(+)
 create mode 100644 drivers/clk/clk-factor.c
 create mode 100644 drivers/clk/sunxi/clk-a10-codec.c
 create mode 100644 drivers/clk/sunxi/clk-a10-mod1.c
 create mode 100644 drivers/clk/sunxi/clk-a10-pll2.c
 create mode 100644 include/dt-bindings/clock/sun4i-a10-pll2.h

-- 
2.4.1
