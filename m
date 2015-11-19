Return-Path: <p.zabel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Daniel Kurtz <djkurtz@chromium.org>,
	"Joe.C" <yingjoe.chen@mediatek.com>,
	kernel@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] clk: mediatek: Add hdmi_ref HDMI PHY PLL reference clock output
Date: Thu, 19 Nov 2015 16:59:48 +0100
Message-Id: <1447948788-21105-3-git-send-email-p.zabel@pengutronix.de>
In-Reply-To: <1447948788-21105-1-git-send-email-p.zabel@pengutronix.de>
References: <1447948788-21105-1-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

The configurable hdmi_ref output of the PLL block is derived from
the tvdpll_594m clock signal via a configurable PLL post-divider.
It is used as the PLL reference input to the HDMI PHY module.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/mediatek/clk-mt8173.c      | 5 +++++
 include/dt-bindings/clock/mt8173-clk.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index b305fa2..d7eadda 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -1091,6 +1091,11 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 		clk_data->clks[cku->id] = clk;
 	}
 
+	clk = clk_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
+				   base + 0x40, 16, 3, CLK_DIVIDER_POWER_OF_TWO,
+				   NULL);
+	clk_data->clks[CLK_APMIXED_HDMI_REF] = clk;
+
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 7956ba1..6094bf7 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -176,7 +176,8 @@
 #define CLK_APMIXED_LVDSPLL		13
 #define CLK_APMIXED_MSDCPLL2		14
 #define CLK_APMIXED_REF2USB_TX		15
-#define CLK_APMIXED_NR_CLK		16
+#define CLK_APMIXED_HDMI_REF		16
+#define CLK_APMIXED_NR_CLK		17
 
 /* INFRA_SYS */
 
-- 
2.6.2
