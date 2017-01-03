Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5] add support for Allwinner V3s SoC
Date: Tue,  3 Jan 2017 23:16:24 +0800
Message-Id: <20170103151629.19447-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner produced a single-core Cortex-A7 SoC, V3s, with integrated 64MiB DDR2
DRAM, and in LQFP package. With such a package, it has been easier for hackers
to DIY a board (no BGA needed, and no DRAM wiring needed).

Add support for this SoC, as well as one board with it (Lichee Pi Zero).

Icenowy Zheng (5):
  arm: sunxi: add support for V3s SoC
  clk: sunxi-ng: add support for V3s CCU
  pinctrl: sunxi: add driver for V3s SoC
  ARM: dts: sunxi: add dtsi file for V3s SoC
  ARM: dts: sunxi: add support for Lichee Pi Zero board

 Documentation/arm/sunxi/README                |   4 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts |  73 ++++
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 257 +++++++++++
 arch/arm/mach-sunxi/sunxi.c                   |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |  11 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c          | 590 ++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |  63 +++
 drivers/pinctrl/sunxi/Kconfig                 |   4 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c     | 321 ++++++++++++++
 include/dt-bindings/clock/sun8i-v3s-ccu.h     | 107 +++++
 include/dt-bindings/reset/sun8i-v3s-ccu.h     |  78 ++++
 14 files changed, 1513 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
 create mode 100644 arch/arm/boot/dts/sun8i-v3s.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
 create mode 100644 include/dt-bindings/clock/sun8i-v3s-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-v3s-ccu.h

-- 
2.11.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
