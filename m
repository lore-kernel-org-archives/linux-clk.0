Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Dinh Nguyen <dinguyen@altera.com>
Subject: [PATCH 11/19] clk: socfpga: Silence sparse warning
Date: Wed,  6 May 2015 00:39:48 -0700
Message-Id: <1430897996-11597-12-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/socfpga/clk-gate.c:227:40: warning: Using plain integer as NULL pointer

Cc: Dinh Nguyen <dinguyen@altera.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/socfpga/clk-gate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index dd3a78c64795..0d5dc84372dc 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -224,7 +224,7 @@ static void __init __socfpga_gate_init(struct device_node *node,
 		socfpga_clk->shift = div_reg[1];
 		socfpga_clk->width = div_reg[2];
 	} else {
-		socfpga_clk->div_reg = 0;
+		socfpga_clk->div_reg = NULL;
 	}
 
 	rc = of_property_read_u32_array(node, "clk-phase", clk_phase, 2);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
