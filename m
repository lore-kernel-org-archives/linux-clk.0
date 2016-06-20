Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	s.hauer@pengutronix.de,
	jeremy.kerr@canonical.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2 0/3] Convert clk-fixed into module platform driver
Date: Mon, 20 Jun 2016 15:43:35 +0200
Message-Id: <1466430218-6561-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

When clock providers are added to the device tree after of_clk_init is called
they are not added to the clock provider list. This makes that drivers such
as i2c-xiic.c fail to init, as they may depend on the unadded clock provider.

We first introduce a new function clk.c that will check if a device_node is
already a clock provider or not.

Later we add two patches, one for clk-fixed-factor and another to
clk-fixed-rate that make us of that function and also convert both drivers
to module platform driver, but keeping all the previous functionality intact.

v2: Changes proposed by: Stephen Boyd <sboyd@codeaurora.org>
-Add error check
-CodeStyle on of_device_ide
-Use builtin_platform_driver()

Ricardo Ribalda Delgado (3):
  clk: Add new function of_clk_is_provider()
  clk: fixed-factor: Convert into a module platform driver
  clk: fixed-rate: Convert into a module platform driver

 drivers/clk/clk-fixed-factor.c | 75 +++++++++++++++++++++++++++++++++++++++---
 drivers/clk/clk-fixed-rate.c   | 71 ++++++++++++++++++++++++++++++++++++---
 drivers/clk/clk.c              | 20 +++++++++++
 include/linux/clk-provider.h   |  5 +++
 4 files changed, 162 insertions(+), 9 deletions(-)

-- 
2.8.1
