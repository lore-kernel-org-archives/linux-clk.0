Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:37544 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751691AbbGNPMI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 14 Jul 2015 11:12:08 -0400
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 0/6] clk: fractional-divider: do a clean up
Date: Tue, 14 Jul 2015 18:11:57 +0300
Message-Id: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The series provides a clean up for clk-fractional-diveder together with moving
it to use rational best approximation algorithm. I think the patches are
self-explanatory.

The series was tested with 8250_dw UART driver on Intel Braswell.

Patch 6 is an amendment to existing user of the fractional divider outside of
clock framework. Greg, it would be nice to have your Ack on this if no
objections.

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

Andy Shevchenko (6):
  clk: fractional-divider: fix sparse warnings
  clk: fractional-divider: rename prate -> parent_rate
  clk: fractional-divider: keep mwidth and nwidth internally
  clk: rockchip: save width in struct clk_fractional_divider
  clk: fractional-divider: switch to rational best approximation
  serial: 8250_dw: allow lower reference frequencies

 drivers/clk/Kconfig                  |  1 +
 drivers/clk/clk-fractional-divider.c | 90 ++++++++++++++++++++++--------------
 drivers/clk/rockchip/clk.c           |  6 ++-
 drivers/tty/serial/8250/8250_dw.c    |  4 --
 include/linux/clk-provider.h         |  3 +-
 5 files changed, 62 insertions(+), 42 deletions(-)

-- 
2.1.4

