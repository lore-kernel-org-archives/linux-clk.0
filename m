Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 1/4] clk: ti: Check kzalloc() for failures
Date: Wed, 15 Jul 2015 13:08:16 -0700
Message-Id: <1436990899-13105-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
References: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

smatch reports a failure to check kzalloc() here:

drivers/clk/ti/clk.c:232
omap2_clk_provider_init() error: potential null dereference 'io'.
(kzalloc returns null)

Check for an allocation failure and return -ENOMEM.

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ti/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 7e037c45e459..931b44118bdf 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -228,6 +228,8 @@ int __init omap2_clk_provider_init(struct device_node *parent, int index,
 	clocks_node_ptr[index] = clocks;
 
 	io = kzalloc(sizeof(*io), GFP_KERNEL);
+	if (!io)
+		return -ENOMEM;
 
 	io->regmap = syscon;
 	io->mem = mem;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
