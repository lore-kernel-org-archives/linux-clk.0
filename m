Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Hou Zhiqiang <B48286@freescale.com>,
	Scott Wood <scottwood@freescale.com>
Subject: [PATCH 34/41] clk: qoriq: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:19 -0800
Message-Id: <1456858826-28541-35-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Hou Zhiqiang <B48286@freescale.com>
Cc: Scott Wood <scottwood@freescale.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-qoriq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 7bc1c4527ae4..d247b75ddf6a 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -876,7 +876,7 @@ static struct clk *sysclk_from_fixed(struct device_node *node, const char *name)
 	if (of_property_read_u32(node, "clock-frequency", &rate))
 		return ERR_PTR(-ENODEV);
 
-	return clk_register_fixed_rate(NULL, name, NULL, CLK_IS_ROOT, rate);
+	return clk_register_fixed_rate(NULL, name, NULL, 0, rate);
 }
 
 static struct clk *sysclk_from_parent(const char *name)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
