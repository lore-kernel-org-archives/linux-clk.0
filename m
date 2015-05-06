Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Jonas Jensen <jonas.jensen@gmail.com>
Subject: [PATCH 18/19] clk: moxart: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:55 -0700
Message-Id: <1430897996-11597-19-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/clk-moxart.c:18:13: warning: symbol 'moxart_of_pll_clk_init' was not declared. Should it be static?
drivers/clk/clk-moxart.c:56:13: warning: symbol 'moxart_of_apb_clk_init' was not declared. Should it be static?

Cc: Jonas Jensen <jonas.jensen@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-moxart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index 30a3b6999e10..5181b89c3cb2 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -15,7 +15,7 @@
 #include <linux/of_address.h>
 #include <linux/clkdev.h>
 
-void __init moxart_of_pll_clk_init(struct device_node *node)
+static void __init moxart_of_pll_clk_init(struct device_node *node)
 {
 	static void __iomem *base;
 	struct clk *clk, *ref_clk;
@@ -53,7 +53,7 @@ void __init moxart_of_pll_clk_init(struct device_node *node)
 CLK_OF_DECLARE(moxart_pll_clock, "moxa,moxart-pll-clock",
 	       moxart_of_pll_clk_init);
 
-void __init moxart_of_apb_clk_init(struct device_node *node)
+static void __init moxart_of_apb_clk_init(struct device_node *node)
 {
 	static void __iomem *base;
 	struct clk *clk, *pll_clk;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

