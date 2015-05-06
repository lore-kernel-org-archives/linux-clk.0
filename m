Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Dinh Nguyen <dinguyen@altera.com>
Subject: [PATCH 15/19] clk: socfpga: Silence sparse warning
Date: Wed,  6 May 2015 00:39:52 -0700
Message-Id: <1430897996-11597-16-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/socfpga/clk-periph.c:79:39: warning: Using plain integer as NULL pointer

Cc: Dinh Nguyen <dinguyen@altera.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/socfpga/clk-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-periph.c b/drivers/clk/socfpga/clk-periph.c
index 46531c34ec9b..83aeaa219d14 100644
--- a/drivers/clk/socfpga/clk-periph.c
+++ b/drivers/clk/socfpga/clk-periph.c
@@ -76,7 +76,7 @@ static __init void __socfpga_periph_init(struct device_node *node,
 		periph_clk->shift = div_reg[1];
 		periph_clk->width = div_reg[2];
 	} else {
-		periph_clk->div_reg = 0;
+		periph_clk->div_reg = NULL;
 	}
 
 	rc = of_property_read_u32(node, "fixed-divider", &fixed_div);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

