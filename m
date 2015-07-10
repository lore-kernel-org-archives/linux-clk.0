Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 45/45] clk: Remove clk.h from clk-provider.h
Date: Fri, 10 Jul 2015 16:33:43 -0700
Message-Id: <1436571223-10959-46-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Remove clk.h from clk-provider.h so that we can clearly split clk
providers from clk consumers. This will allow us to quickly
detect when clock providers are using the consumer APIs by
looking at the includes.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 78842f46f152..36fa555ff431 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -11,7 +11,6 @@
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
-#include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/of.h>
 
@@ -33,6 +32,7 @@
 #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
 #define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
 
+struct clk;
 struct clk_hw;
 struct clk_core;
 struct dentry;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
