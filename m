Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	project-aspen-dev@linaro.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/5] clk: hi3798cv200: add support for HISTB_USB2_OTG_UTMI_CLK
Date: Wed, 24 Jan 2018 19:48:25 +0800
Message-Id: <1516794507-5607-4-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
References: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The clock HISTB_USB2_OTG_UTMI_CLK is defined by device tree bindings in
include/dt-bindings/clock/histb-clock.h, but hasn't been supported by
hi3798cv200 clock driver.  Let's add the support for it.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/hisilicon/crg-hi3798cv200.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index d7d1ba0153ec..6017ade0cd92 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -161,6 +161,8 @@
 		CLK_SET_RATE_PARENT, 0xb8, 1, 0 },
 	{ HISTB_USB2_UTMI_CLK, "clk_u2_utmi", "60m",
 		CLK_SET_RATE_PARENT, 0xb8, 5, 0 },
+	{ HISTB_USB2_OTG_UTMI_CLK, "clk_u2_otg_utmi", "60m",
+		CLK_SET_RATE_PARENT, 0xb8, 3, 0 },
 	{ HISTB_USB2_PHY1_REF_CLK, "clk_u2_phy1_ref", "24m",
 		CLK_SET_RATE_PARENT, 0xbc, 0, 0 },
 	{ HISTB_USB2_PHY2_REF_CLK, "clk_u2_phy2_ref", "24m",
-- 
1.9.1
