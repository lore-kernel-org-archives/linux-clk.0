Return-Path: <Aisheng.Dong@freescale.com>
From: Dong Aisheng <aisheng.dong@freescale.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@baylibre.com>, <shawn.guo@linaro.org>, <b29396@freescale.com>,
	<linux-arm-kernel@lists.infradead.org>, <Ranjani.Vaidyanathan@freescale.com>,
	<b20596@freescale.com>, <r64343@freescale.com>, <b20788@freescale.com>
Subject: [PATCH 2/4] clk: imx: add clk api for supporting clk_OPS_PARENT_ON clocks
Date: Tue, 28 Jul 2015 21:33:09 +0800
Message-ID: <1438090391-30329-3-git-send-email-aisheng.dong@freescale.com>
In-Reply-To: <1438090391-30329-1-git-send-email-aisheng.dong@freescale.com>
References: <1438090391-30329-1-git-send-email-aisheng.dong@freescale.com>
Return-Path: aisheng.dong@freescale.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Some IMX SoC like i.MX7D requires using clk_OPS_PARENT_ON flags,
adding the corresponding clock APIs variants for easy use.

Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
---
 drivers/clk/imx/clk.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index cda8756..e579fc0 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -89,6 +89,14 @@ static inline struct clk *imx_clk_divider_flags(const char *name,
 			reg, shift, width, 0, &imx_ccm_lock);
 }
 
+static inline struct clk *imx_clk_divider2(const char *name, const char *parent,
+		void __iomem *reg, u8 shift, u8 width)
+{
+	return clk_register_divider(NULL, name, parent,
+			CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ON,
+			reg, shift, width, 0, &imx_ccm_lock);
+}
+
 static inline struct clk *imx_clk_gate(const char *name, const char *parent,
 		void __iomem *reg, u8 shift)
 {
@@ -118,6 +126,22 @@ static inline struct clk *imx_clk_gate2_shared(const char *name,
 			shift, 0, &imx_ccm_lock, share_count);
 }
 
+static inline struct clk *imx_clk_gate3(const char *name, const char *parent,
+		void __iomem *reg, u8 shift)
+{
+	return clk_register_gate(NULL, name, parent,
+			CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ON,
+			reg, shift, 0, &imx_ccm_lock);
+}
+
+static inline struct clk *imx_clk_gate4(const char *name, const char *parent,
+		void __iomem *reg, u8 shift)
+{
+	return clk_register_gate2(NULL, name, parent,
+			CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ON,
+			reg, shift, 0, &imx_ccm_lock, NULL);
+}
+
 static inline struct clk *imx_clk_mux(const char *name, void __iomem *reg,
 		u8 shift, u8 width, const char **parents, int num_parents)
 {
@@ -126,6 +150,14 @@ static inline struct clk *imx_clk_mux(const char *name, void __iomem *reg,
 			width, 0, &imx_ccm_lock);
 }
 
+static inline struct clk *imx_clk_mux2(const char *name, void __iomem *reg,
+		u8 shift, u8 width, const char **parents, int num_parents)
+{
+	return clk_register_mux(NULL, name, parents, num_parents,
+			CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ON,
+			reg, shift, width, 0, &imx_ccm_lock);
+}
+
 static inline struct clk *imx_clk_mux_flags(const char *name,
 		void __iomem *reg, u8 shift, u8 width, const char **parents,
 		int num_parents, unsigned long flags)
-- 
1.9.1
