Return-Path: <phil.edworthy@renesas.com>
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Horman <horms@verge.net.au>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v5 0/2] clk: Add functions to get optional clocks
Date: Fri, 31 Aug 2018 15:07:21 +0100
Message-Id: <1535724443-21150-1-git-send-email-phil.edworthy@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Quite a few drivers get an optional clock, e.g. a bus clock required to 
access peripheral's registers that is always enabled on some devices.

Phil Edworthy (2):
  clk: Add of_clk_get_by_name_optional() function
  clk: Add functions to get optional clocks

 drivers/clk/clk-devres.c | 18 ++++++++++--
 drivers/clk/clkdev.c     | 74 ++++++++++++++++++++++++++++++++++++++----------
 include/linux/clk.h      | 35 +++++++++++++++++++++++
 3 files changed, 110 insertions(+), 17 deletions(-)

-- 
2.7.4
