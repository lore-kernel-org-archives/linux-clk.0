Return-Path: <joel.stan@gmail.com>
Return-Path: <joel.stan@gmail.com>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Jeffery <andrew@aj.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Jeremy Kerr <jk@ozlabs.org>,
	Rick Altherr <raltherr@google.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v6 0/5] clk: Add Aspeed clock driver
Date: Tue, 28 Nov 2017 17:49:03 +1030
Message-Id: <20171128071908.12279-1-joel@jms.id.au>
List-ID: <linux-clk.vger.kernel.org>

This driver supports the ast2500, ast2400 (and derivative) BMC SoCs from
Aspeed.

This is v6. See patches for detailed changelogs.

v6: Added reviewed-bys 
v5: Address review from Andrew
v4: Address review from Andrew and Stephen. 
v3: Address review from Andrew and has seen more testing on hardware
v2: split the driver out into a series of patches to make them easier to
review.

All of the important clocks are supported, with most non-essential ones
also implemented where information is available. I am working with
Aspeed to clear up some of the missing information, including the
missing parent-sibling relationships.

We need to know the rate of the apb clock in order to correctly program
the clocksource driver, so the apb and it's parents are created in the
CLK_OF_DECLARE_DRIVER callback.

The rest of the clocks are created at normal driver probe time. I
followed the Gemini driver's lead with using the regmap where I could,
but also having a pointer to the base address for use with the common
clock callbacks.

The driver borrows from the clk_gate common clock infrastructure, but modifies
it in order to support the clock gate and reset pair that most of the clocks
have. This pair must be reset-ungated-released, with appropriate delays,
according to the datasheet.

The first patch introduces the core clock registration parts, and describes
the clocks. The second creates the core clocks, giving the system enough to
boot (but without uart). Next come the non-core clocks, and finally the reset
controller that is used for the few cocks that don't have a gate to go with their
reset pair.

Please review!

Cheers,

Joel

Joel Stanley (5):
  clk: Add clock driver for ASPEED BMC SoCs
  clk: aspeed: Register core clocks
  clk: aspeed: Add platform driver and register PLLs
  clk: aspeed: Register gated clocks
  clk: aspeed: Add reset controller

 drivers/clk/Kconfig                      |  12 +
 drivers/clk/Makefile                     |   1 +
 drivers/clk/clk-aspeed.c                 | 657 +++++++++++++++++++++++++++++++
 include/dt-bindings/clock/aspeed-clock.h |  54 +++
 4 files changed, 724 insertions(+)
 create mode 100644 drivers/clk/clk-aspeed.c
 create mode 100644 include/dt-bindings/clock/aspeed-clock.h

-- 
2.14.1
