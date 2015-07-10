Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH 44/45] clk: at91: Include clk.h and slab.h
Date: Fri, 10 Jul 2015 16:33:42 -0700
Message-Id: <1436571223-10959-45-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly. Also include slab.h instead of relying on clkdev.h
for it.

Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/at91/clk-slow.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/at91/clk-slow.c b/drivers/clk/at91/clk-slow.c
index 98a84a865fe1..0a7aef39ab5b 100644
--- a/drivers/clk/at91/clk-slow.c
+++ b/drivers/clk/at91/clk-slow.c
@@ -10,8 +10,10 @@
  *
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/clk/at91_pmc.h>
 #include <linux/delay.h>
 #include <linux/of.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

