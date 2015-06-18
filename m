Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:58673 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753904AbbFRKc1 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jun 2015 06:32:27 -0400
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sasha Levin <sasha.levin@oracle.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Mike Turquette <mturquette@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	=?UTF-8?q?Ji=C5=99=C3=AD=20Prchal?= <jiri.prchal@aksignal.cz>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	<stable@vger.kernel.org>
Subject: [PATCH] clk: at91: fix determine_rate prototype (again)
Date: Thu, 18 Jun 2015 12:32:23 +0200
Message-Id: <1434623543-10517-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Commit ae74ea64ccdb8b99ee2618b58020263d5b1d9b22 ("clk: at91: usb:
propagate rate modification to the parent clk") was a backport of a bug
fix applied in 4.0, but in the meantime the ->determine_rate() prototype
has changed, thus introduction a prototype mismatch bug in pre-4.0
kernels. This prototype mismatch was supposed to be fixed by commit
76723e7ed589998384a080e29204df4659c67cf2, which fix the bug on 3.19 kernels,
but the ->determine_rate() has also changed between 3.18 and 3.19.
Hopefully this patch will definitely fix the prototype mismatch for 3.18.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Reported-by: Jiří Prchal <jiri.prchal@aksignal.cz>
Tested-by: Jiří Prchal <jiri.prchal@aksignal.cz>
Fixes: 76723e7ed589998384a080e29204df4659c67cf2 ("clk: at91: usb: fix
determine_rate prototype")
Cc: <stable@vger.kernel.org> # 3.18
---
 drivers/clk/at91/clk-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
index 0283a57..d0d335d 100644
--- a/drivers/clk/at91/clk-usb.c
+++ b/drivers/clk/at91/clk-usb.c
@@ -59,7 +59,7 @@ static unsigned long at91sam9x5_clk_usb_recalc_rate(struct clk_hw *hw,
 static long at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
 					      unsigned long rate,
 					      unsigned long *best_parent_rate,
-					      struct clk_hw **best_parent_hw)
+					      struct clk **best_parent_clk)
 {
 	struct clk *parent = NULL;
 	long best_rate = -EINVAL;
@@ -91,7 +91,7 @@ static long at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
 				best_rate = tmp_rate;
 				best_diff = tmp_diff;
 				*best_parent_rate = tmp_parent_rate;
-				*best_parent_hw = __clk_get_hw(parent);
+				*best_parent_clk = parent;
 			}
 
 			if (!best_diff || tmp_rate < rate)
-- 
1.9.1

