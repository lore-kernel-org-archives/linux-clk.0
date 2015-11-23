Return-Path: <rjui@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>,
	Ray Jui <rjui@broadcom.com>
Subject: [PATCH v2 3/4] clk: iproc: Remove __init from header
Date: Mon, 23 Nov 2015 09:50:26 -0800
Message-ID: <1448301027-27061-4-git-send-email-rjui@broadcom.com>
In-Reply-To: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
References: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

Remove __init macro from all function prototypes in clk-iproc.h

Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 drivers/clk/bcm/clk-iproc.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/bcm/clk-iproc.h b/drivers/clk/bcm/clk-iproc.h
index febae11..2148b4e 100644
--- a/drivers/clk/bcm/clk-iproc.h
+++ b/drivers/clk/bcm/clk-iproc.h
@@ -204,16 +204,16 @@ struct iproc_asiu_div {
 	unsigned int low_width;
 };
 
-void __init iproc_armpll_setup(struct device_node *node);
-void __init iproc_pll_clk_setup(struct device_node *node,
-				const struct iproc_pll_ctrl *pll_ctrl,
-				const struct iproc_pll_vco_param *vco,
-				unsigned int num_vco_entries,
-				const struct iproc_clk_ctrl *clk_ctrl,
-				unsigned int num_clks);
-void __init iproc_asiu_setup(struct device_node *node,
-			     const struct iproc_asiu_div *div,
-			     const struct iproc_asiu_gate *gate,
-			     unsigned int num_clks);
+void iproc_armpll_setup(struct device_node *node);
+void iproc_pll_clk_setup(struct device_node *node,
+			 const struct iproc_pll_ctrl *pll_ctrl,
+			 const struct iproc_pll_vco_param *vco,
+			 unsigned int num_vco_entries,
+			 const struct iproc_clk_ctrl *clk_ctrl,
+			 unsigned int num_clks);
+void iproc_asiu_setup(struct device_node *node,
+		      const struct iproc_asiu_div *div,
+		      const struct iproc_asiu_gate *gate,
+		      unsigned int num_clks);
 
 #endif /* _CLK_IPROC_H */
-- 
1.9.1
