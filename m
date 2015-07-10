Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 06/45] clk: nomadik: Remove clk.h and clkdev.h includes
Date: Fri, 10 Jul 2015 16:33:04 -0700
Message-Id: <1436571223-10959-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver. This driver also includes clkdev.h even though
it isn't used, so drop it too and add slab.h to make sure
everything still compiles.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-nomadik.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
index c9487179f25f..e4d8a991c58f 100644
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -8,8 +8,7 @@
 #define pr_fmt(fmt) "Nomadik SRC clocks: " fmt
 
 #include <linux/bitops.h>
-#include <linux/clk.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/clk-provider.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
