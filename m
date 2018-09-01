Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	sboyd@kernel.org
Cc: mturquette@baylibre.com,
	carlo@caione.org,
	khilman@baylibre.com,
	linux-clk@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] meson8b: register the clock controller early
Date: Sat,  1 Sep 2018 18:21:44 +0200
Message-Id: <20180901162146.5656-1-martin.blumenstingl@googlemail.com>
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

NOTE: Neil suggested in v1 to switch to one of core_initcall,
postcore_initcall, subsys_initcall but I couldn't find any driver
that I could use as "reference" which registers it's clock controller
before the device model (platform_device) is ready. this is why I'm
still using CLK_OF_DECLARE - but I'm open to suggestions.

The second patch simplifies the reset controller (built into the clock
controller driver) because the regmap is already available early and
thus can be used by the reset controller driver as well.


Changes since v1 at [0]:
- switch from CLK_OF_DECLARE_DRIVER to CLK_OF_DECLARE because with
  this series there is only one initialization function for the clock
  controller driver (unlike before: where the reset controller was
  registered early and the clock controller was registered as platform
  device)
- rebased on top of clk-meson, commit:
  684b97b13b175a ("clk: meson-axg: pcie: drop the mpll3 clock parent")


[0] https://patchwork.kernel.org/cover/10538971/


Martin Blumenstingl (2):
  clk: meson: meson8b: register the clock controller early
  clk: meson: meson8b: use the regmap in the internal reset controller

 drivers/clk/meson/meson8b.c | 110 +++++++++++++-----------------------
 1 file changed, 40 insertions(+), 70 deletions(-)

-- 
2.18.0
