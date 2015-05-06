Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 19/19] clk: u300: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:56 -0700
Message-Id: <1430897996-11597-20-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/clk-u300.c:1175:13: warning: symbol 'u300_clk_init' was not declared. Should it be static?

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-u300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-u300.c b/drivers/clk/clk-u300.c
index 406bfc1375b2..18bf5e576b93 100644
--- a/drivers/clk/clk-u300.c
+++ b/drivers/clk/clk-u300.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/spinlock.h>
 #include <linux/of.h>
+#include <linux/platform_data/clk-u300.h>
 
 /* APP side SYSCON registers */
 /* CLK Control Register 16bit (R/W) */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

