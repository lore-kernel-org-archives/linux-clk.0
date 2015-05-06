Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Barry Song <Baohua.Song@csr.com>
Subject: [PATCH 10/19] clk: sirf: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:47 -0700
Message-Id: <1430897996-11597-11-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These are __iomem pointers. Mark them appropriately so we don't
get sparse errors like

drivers/clk/sirf/clk-common.c:60:16: warning: incorrect type in argument 1 (different address spaces)
drivers/clk/sirf/clk-common.c:60:16:    expected void const volatile [noderef] <asn:2>*addr
drivers/clk/sirf/clk-common.c:60:16:    got void *

Cc: Barry Song <Baohua.Song@csr.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sirf/clk-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sirf/clk-common.c b/drivers/clk/sirf/clk-common.c
index e9cf5730effe..9fc285d784d3 100644
--- a/drivers/clk/sirf/clk-common.c
+++ b/drivers/clk/sirf/clk-common.c
@@ -10,8 +10,8 @@
 #define KHZ     1000
 #define MHZ     (KHZ * KHZ)
 
-static void *sirfsoc_clk_vbase;
-static void *sirfsoc_rsc_vbase;
+static void __iomem *sirfsoc_clk_vbase;
+static void __iomem *sirfsoc_rsc_vbase;
 static struct clk_onecell_data clk_data;
 
 /*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
