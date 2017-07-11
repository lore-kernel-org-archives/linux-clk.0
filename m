Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@caione.org,
	narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux@armlinux.org.uk,
	mark.rutland@arm.com,
	robh+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] add the reset controller to the Meson8b clkc
Date: Wed, 12 Jul 2017 00:49:37 +0200
Message-Id: <20170711224939.26267-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

This registers the four CPU (soft) reset lines (one for each CPU core)
provided by the clock controller's HHI_SYS_CPU_CLK_CNTL0 register.

This is the first preparation step for SMP and CPU hotplug support on
Meson8/Meson8b/Meson8m2.

The reset controller part of the meson8b clock controller has to be
registered early (which I did through CLK_OF_DECLARE_DRIVER), because
the secondary cores are started *very* early in the boot process (and
meson8b_clkc_probe is invoked long after we need the reset controller
to be available for booting the secondary CPU cores).

The user of the reset-controller (= the patches which enable SMP and
CPU hotplug support) will follow in the next days. I decided to split
this because the SMP series will probably consist of 6 patches alone
(and may need to go through two separate trees).


Martin Blumenstingl (2):
  clk: meson: meson8b: register the built-in reset controller
  ARM: dts: meson: mark the clock controller also as reset controller

 .../bindings/clock/amlogic,meson8b-clkc.txt        |   7 +-
 arch/arm/boot/dts/meson8.dtsi                      |   1 +
 arch/arm/boot/dts/meson8b.dtsi                     |   1 +
 drivers/clk/meson/Kconfig                          |   1 +
 drivers/clk/meson/meson8b.c                        | 109 ++++++++++++++++++---
 drivers/clk/meson/meson8b.h                        |   1 +
 6 files changed, 107 insertions(+), 13 deletions(-)

-- 
2.13.2
