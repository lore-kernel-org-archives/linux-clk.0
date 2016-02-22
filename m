Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp
Subject: [PATCH] clk: h8300: Properly cast to __iomem pointer
Date: Mon, 22 Feb 2016 12:58:20 -0800
Message-Id: <1456174700-30035-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Sparse complains here because we dropped the __iomem annotation
when casting the aligned address. Add __iomem back so that sparse
stops complaining.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: <uclinux-h8-devel@lists.sourceforge.jp>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/h8300/clk-div.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/h8300/clk-div.c b/drivers/clk/h8300/clk-div.c
index 5ecc0664e33c..4bf44a25d950 100644
--- a/drivers/clk/h8300/clk-div.c
+++ b/drivers/clk/h8300/clk-div.c
@@ -34,7 +34,7 @@ static void __init h8300_div_clk_setup(struct device_node *node)
 	}
 	offset = (unsigned long)divcr & 3;
 	offset = (3 - offset) * 8;
-	divcr = (void *)((unsigned long)divcr & ~3);
+	divcr = (void __iomem *)((unsigned long)divcr & ~3);
 
 	parent_name = of_clk_get_parent_name(node, 0);
 	of_property_read_u32(node, "renesas,width", &width);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
