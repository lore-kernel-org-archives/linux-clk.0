Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/7] lib/vsprintf.c: Include clk.h
Date: Fri, 10 Jul 2015 16:03:29 -0700
Message-Id: <1436569409-27964-8-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This file uses the clk API so it should include clk.h directly
instead of indirectly including it through clk-provider.h.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack so this can go through clk-tree.

 lib/vsprintf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index da39c608a28c..95cd63b43b99 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -17,6 +17,7 @@
  */
 
 #include <stdarg.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/module.h>	/* for KSYM_SYMBOL_LEN */
 #include <linux/types.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

