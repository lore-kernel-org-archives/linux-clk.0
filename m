Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Andrew Bresticker <abrestic@chromium.org>,
	Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 41/45] clk: pistachio: Include clk.h
Date: Fri, 10 Jul 2015 16:33:39 -0700
Message-Id: <1436571223-10959-42-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/pistachio/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/pistachio/clk.c b/drivers/clk/pistachio/clk.c
index 85faa83e1bd7..698cad4f509e 100644
--- a/drivers/clk/pistachio/clk.c
+++ b/drivers/clk/pistachio/clk.c
@@ -6,6 +6,7 @@
  * version 2, as published by the Free Software Foundation.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

