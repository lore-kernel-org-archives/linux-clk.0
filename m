Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:59340 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932378AbbFRLDm (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jun 2015 07:03:42 -0400
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mike Turquette <mturquette@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Wu Songjun <Songjun.Wu@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] clk: at91: fix PERIPHERAL_MAX_SHIFT definition
Date: Thu, 18 Jun 2015 13:03:25 +0200
Message-Id: <1434625405-11888-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Fix the PERIPHERAL_MAX_SHIFT definition (3 instead of 4) and adapt the
round_rate and set_rate logic accordingly.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Reported-by: "Wu, Songjun" <Songjun.Wu@atmel.com>
---
 drivers/clk/at91/clk-peripheral.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index 597fed4..df2c1af 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -29,7 +29,7 @@
 #define PERIPHERAL_RSHIFT_MASK	0x3
 #define PERIPHERAL_RSHIFT(val)	(((val) >> 16) & PERIPHERAL_RSHIFT_MASK)
 
-#define PERIPHERAL_MAX_SHIFT	4
+#define PERIPHERAL_MAX_SHIFT	3
 
 struct clk_peripheral {
 	struct clk_hw hw;
@@ -242,7 +242,7 @@ static long clk_sam9x5_peripheral_round_rate(struct clk_hw *hw,
 		return *parent_rate;
 
 	if (periph->range.max) {
-		for (; shift < PERIPHERAL_MAX_SHIFT; shift++) {
+		for (; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
 			cur_rate = *parent_rate >> shift;
 			if (cur_rate <= periph->range.max)
 				break;
@@ -254,7 +254,7 @@ static long clk_sam9x5_peripheral_round_rate(struct clk_hw *hw,
 
 	best_diff = cur_rate - rate;
 	best_rate = cur_rate;
-	for (; shift < PERIPHERAL_MAX_SHIFT; shift++) {
+	for (; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
 		cur_rate = *parent_rate >> shift;
 		if (cur_rate < rate)
 			cur_diff = rate - cur_rate;
@@ -289,7 +289,7 @@ static int clk_sam9x5_peripheral_set_rate(struct clk_hw *hw,
 	if (periph->range.max && rate > periph->range.max)
 		return -EINVAL;
 
-	for (shift = 0; shift < PERIPHERAL_MAX_SHIFT; shift++) {
+	for (shift = 0; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
 		if (parent_rate >> shift == rate) {
 			periph->auto_div = false;
 			periph->div = shift;
-- 
1.9.1

