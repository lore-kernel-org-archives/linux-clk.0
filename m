Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	jeremy.kerr@canonical.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 0/3] Convert clk-fixed into module platform driver
Date: Wed,  8 Jun 2016 12:19:58 +0200
Message-Id: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

When clock providers are added to the device tree after of_clk_init is called
they are not added to the clock provider list. This makes that drivers such
as i2c-xiic.c fail to init, as they may depend on the unadded clock provider.

We first introduce a new function clk.c that will check if a device_node is
already a clock provider or not.

Later we add two patches, one for clk-fixed-factor and another to
clk-fixed-rate that make us of that function and also convert both drivers
to module platform driver, but keeping all the previous functionality intact.

Ricardo Ribalda Delgado (3):
  clk: Add new function of_clk_is_provider()
  clk: fixed-factor: Convert into a module platform driver
  clk: fixed-rate: Convert into a module platform driver

 drivers/clk/clk-fixed-factor.c | 66 ++++++++++++++++++++++++++++++++++++++++--
 drivers/clk/clk-fixed-rate.c   | 62 +++++++++++++++++++++++++++++++++++++--
 drivers/clk/clk.c              | 20 +++++++++++++
 include/linux/clk-provider.h   |  5 ++++
 4 files changed, 148 insertions(+), 5 deletions(-)

-- 
2.8.1
