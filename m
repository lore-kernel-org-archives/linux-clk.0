Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	carlo@caione.org,
	khilman@baylibre.com,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] meson8b: add the CPU_DIV16 clock for the ARM TWD
Date: Sat, 21 Jul 2018 19:25:35 +0200
Message-Id: <20180721172537.15639-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

Carlo sent a .dts patch for the ARM TWD (timer watchdog) a long time
ago: [0]
This patch was never applied. While resurrecting it I found out (by
trial and error) that the TWD clock is derived from the CPU clock by
dividing the existing CPU clock by 16.
An additional hint was also given by Neil's clock measurer patch [1]
as the GX SoCs explicitly define a "sys_cpu_div16" clock with ID 18,
however old u-boot seems to call that CTS_LED_PLL_CLK. The rate of
this clock also matches CPU clock divided by 16 on my boards.

It's not clear if there is an additional gate for this clock. If there
is then it's not documented anywhere.


[0] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/391928.html
[1] https://patchwork.kernel.org/patch/10504083/

Martin Blumenstingl (2):
  dt-bindings: clock: meson8b: export the CPU_DIV16 clock
  clk: meson: meson8b: add the CPU_DIV16 clock

 drivers/clk/meson/meson8b.c              | 12 ++++++++++++
 drivers/clk/meson/meson8b.h              |  2 +-
 include/dt-bindings/clock/meson8b-clkc.h |  1 +
 3 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.18.0
