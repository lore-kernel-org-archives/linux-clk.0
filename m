Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	jsarha@ti.com
Cc: linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH v4 0/4] clk: add gpio controlled clock multiplexer
Date: Sun, 28 Jun 2015 16:24:52 +0200
Message-Id: <1435501496-25761-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

This patch series adds a common clock driver for basic gpio controlled clock
multiplexers. It does also contain some minor fixes for the gpio-gate-clock.

The first two patches are minor fixes for the gpio-gate-clock. Patch three
refactors the file clk-gpio-gate.c and adds the new gpio-mux-clock driver.
Finally, patch four renames the file clk-gpio-gate.c to clk-gpio.c. 

Based on clk-next.

Changes since v3:
 * Suggested by Stephen Boyd:
   - Split the patch into a patch series, separate gpio-gate-clock fixes and
     file renaming.
   - Include linux/gpio/consumer.h.
   - Remove debug noise.
   - Remove some comments.
   - Fix: Do not call free if alloc fails.

Changes since v2:
 * Suggested by Stephen Boyd:
   - Delete unneeded includes.
   - Fix some style issues.
   - Put gpio-gate-clock and gpio-mux-clock into a new file (clk-gpio.c) and
     refactor the code to minimize code duplication.

Changes since v1:
 * Suggested by Stephen Boyd and Jyri Sarha:
   - Remove the optional enable/disable support. If enable/disable is
     required, the gpio-mux-clock can be used in combination with the
     gpio-gate-clock.

 * Suggested by Stephen Boyd:
   - Remove the (index > 1)-check from clk_gpio_mux_set_parent().
   - Stay silent if gpio_request_one() fails with -EPROBE_DEFER.
   - Make sure num_parents is 2 in clk_register_gpio_mux().
   - Use devm_clk_register() if a device is provided.
   - Remove the flags variable from of_clk_gpio_mux_delayed_register_get().
   - Fix num_parents check in of_clk_gpio_mux_delayed_register_get().
   - Use kcalloc() for parent_names array allocation.
   - Use pr_debug() instead of pr_warn() for the EPROBE_DEFER message.
   - Use kzalloc(sizeof(*data)... ) instead of kzalloc(sizeof(struct 
     clk_gpio_mux_delayed_register_data)... ) in of_gpio_mux_clk_setup().

Many thanks for your time and effort,
Sergej

Sergej Sawazki (4):
  clk: gpio-gate: Include export.h instead of module.h
  clk: gpio-gate: Stay silent on EPROBE_DEFER
  clk: add gpio controlled clock multiplexer
  clk: Rename clk-gpio-gate.c to clk-gpio.c

 .../devicetree/bindings/clock/gpio-mux-clock.txt   |  19 ++
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/clk-gpio-gate.c                        | 207 -------------
 drivers/clk/clk-gpio.c                             | 319 +++++++++++++++++++++
 include/linux/clk-provider.h                       |  17 ++
 5 files changed, 356 insertions(+), 208 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
 delete mode 100644 drivers/clk/clk-gpio-gate.c
 create mode 100644 drivers/clk/clk-gpio.c

-- 
1.9.1
