Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:55604 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751124AbbG0Lt1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Mon, 27 Jul 2015 07:49:27 -0400
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 3/5] clk: rockchip: save width in struct clk_fractional_divider
Date: Mon, 27 Jul 2015 14:48:51 +0300
Message-Id: <1437997733-135331-4-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1437997733-135331-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1437997733-135331-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The ->mwidth and ->nwidth fields will be used by clk-fractional-divider when it
will be switched to rational base approximation algorithm.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/rockchip/clk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 2493881..be6c7fd 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -135,9 +135,11 @@ static struct clk *rockchip_clk_register_frac_branch(const char *name,
 	div->flags = div_flags;
 	div->reg = base + muxdiv_offset;
 	div->mshift = 16;
-	div->mmask = 0xffff0000;
+	div->mwidth = 16;
+	div->mmask = GENMASK(div->mwidth - 1, 0) << div->mshift;
 	div->nshift = 0;
-	div->nmask = 0xffff;
+	div->nwidth = 16;
+	div->nmask = GENMASK(div->nwidth - 1, 0) << div->nshift;
 	div->lock = lock;
 	div_ops = &clk_fractional_divider_ops;
 
-- 
2.4.6

