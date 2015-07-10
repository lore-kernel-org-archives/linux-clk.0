Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34075 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753504AbbGJXd4 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jul 2015 19:33:56 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Paul Burton <paul.burton@imgtec.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 40/45] clk: ingenic: Include clk.h
Date: Fri, 10 Jul 2015 16:33:38 -0700
Message-Id: <1436571223-10959-41-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ingenic/cgu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index b936cdd1a13c..7cfb7b2a2ed6 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/delay.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

