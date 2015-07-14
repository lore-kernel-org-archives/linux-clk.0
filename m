Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:37544 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752179AbbGNPMK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 14 Jul 2015 11:12:10 -0400
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 6/6] serial: 8250_dw: allow lower reference frequencies
Date: Tue, 14 Jul 2015 18:12:03 +0300
Message-Id: <1436886723-111895-7-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We have couple of standard but rare used baudrates which are not supported by
1,8432MHz reference frequency. Besides that user can potentially ask for any
baudrate (via BOTHER flag) and we currently don't fully support that. Since
clk-fractional-divider is moved to use rational best approximation for
reference frequency we may amend the driver to support whatever user wants.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index d48b506..c30e4ba 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -246,10 +246,6 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	if (IS_ERR(d->clk) || !old)
 		goto out;
 
-	/* Not requesting clock rates below 1.8432Mhz */
-	if (baud < 115200)
-		baud = 115200;
-
 	clk_disable_unprepare(d->clk);
 	rate = clk_round_rate(d->clk, baud * 16);
 	ret = clk_set_rate(d->clk, rate);
-- 
2.1.4

