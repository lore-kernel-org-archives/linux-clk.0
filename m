Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	carlo@caione.org,
	khilman@baylibre.com,
	linux-clk@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] meson8b: register the clock controller early
Date: Sat, 21 Jul 2018 21:13:58 +0200
Message-Id: <20180721191400.15558-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

Some parts of the SoC are initialized early in the boot process, such
as the SRAM and the TWD timer. This means that the corresponding
drivers need to access the clock controller early as well.

Before this series the clock controller was registered as platform
driver, which is too late for the TWD timer (just as an example).
The reset controller (built into the clock controller driver) was
already registered early, basically for the same reason (the reset
lines are used to start the secondary CPUs, which is done very early
in the boot process).

Register the clock controller early enough so we're able to use the
TWD timer (as we need to pass a clock which is provided by this
clock controller) in a second step.

The second patch simplifies the reset controller (built into the clock
controller driver) because the regmap is already available early and
thus can be used by the reset controller driver as well.


Martin Blumenstingl (2):
  clk: meson: meson8b: register the clock controller early
  clk: meson: meson8b: use the regmap in the internal reset controller

 drivers/clk/meson/meson8b.c | 107 ++++++++++++++----------------------
 1 file changed, 40 insertions(+), 67 deletions(-)

-- 
2.18.0
