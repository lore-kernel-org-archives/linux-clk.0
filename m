Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 4/4] clk: ti: Force pointer to be __iomem
Date: Wed, 15 Jul 2015 13:08:19 -0700
Message-Id: <1436990899-13105-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
References: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add __force here so that sparse doesn't complain about us playing
tricks with __iomem.

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

This whole scheme is really ugly, hopefully it can be cleaned up soon.

 drivers/clk/ti/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 5dcc1bdfc7f4..ace35047783b 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -194,7 +194,7 @@ void __iomem *ti_clk_get_reg_addr(struct device_node *node, int index)
 
 	reg->offset = val;
 
-	return (void __iomem *)tmp;
+	return (__force void __iomem *)tmp;
 }
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

