Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 36/45] clk: Include clk.h in clk.c
Date: Fri, 10 Jul 2015 16:33:34 -0700
Message-Id: <1436571223-10959-37-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This file implements the clk API and so it should include clk.h
directly instead of indirectly including it through
clk-provider.h.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ddb4b541016f..89e531a3f384 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -9,6 +9,7 @@
  * Standard functionality for the common clock API.  See Documentation/clk.txt
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/clk-conf.h>
 #include <linux/module.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
