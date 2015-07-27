Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 0/5] clk: fractional-divider: do a clean up
Date: Mon, 27 Jul 2015 14:48:48 +0300
Message-Id: <1437997733-135331-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The series provides a clean up for clk-fractional-diveder together with moving
it to use rational best approximation algorithm. I think the patches are
self-explanatory.

The series was tested with 8250_dw UART driver on Intel Braswell.

Patch 5 is an amendment to existing user of the fractional divider outside of
clock framework.

Changelog v5:
 - drop patch 1 (there is another fix already in upstream)
 - add tags (Ack, Review)

Changelog v4:
 - remove dependency to clk_div_mask() and use GENMASK() instead
 - apply changes to rockchip
 - amend 8250_dw driver to use proposed changes

Changelog v3:
 - add patch 2/3 to simplify further usage
 - don't use mult_frac() due to potential overflow on 32 bit kernels
 - guarantee in ->round_rate() that m and n will not overflow

Changelog v2:
 - move to rational_best_approximation() and mult_frac()
 - add patch 2/2

Andy Shevchenko (5):
  clk: fractional-divider: rename prate -> parent_rate
  clk: fractional-divider: keep mwidth and nwidth internally
  clk: rockchip: save width in struct clk_fractional_divider
  clk: fractional-divider: switch to rational best approximation
  serial: 8250_dw: allow lower reference frequencies

 drivers/clk/Kconfig                  |  1 +
 drivers/clk/clk-fractional-divider.c | 53 ++++++++++++++++++++++--------------
 drivers/clk/rockchip/clk.c           |  6 ++--
 drivers/tty/serial/8250/8250_dw.c    |  4 ---
 include/linux/clk-provider.h         |  3 +-
 5 files changed, 40 insertions(+), 27 deletions(-)

-- 
2.4.6

