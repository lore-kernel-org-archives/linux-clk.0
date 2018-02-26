Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <tony@atomide.com>, <linux-omap@vger.kernel.org>, <jsarha@ti.com>
Subject: [PATCH 1/3] clk: ti: clkctrl: add support for CLK_SET_RATE_PARENT flag
Date: Mon, 26 Feb 2018 17:10:10 +0200
Message-ID: <1519657812-15605-2-git-send-email-t-kristo@ti.com>
In-Reply-To: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Certain clkctrl clocks, notably the display ones, use the
CLK_SET_RATE_PARENT feature extensively. Add support for this flag
to the clkctrl clocks.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reported-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/clk/ti/clkctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index afa0d6b..421b0539 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -537,6 +537,8 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		init.parent_names = &reg_data->parent;
 		init.num_parents = 1;
 		init.flags = 0;
+		if (reg_data->flags & CLKF_SET_RATE_PARENT)
+			init.flags |= CLK_SET_RATE_PARENT;
 		init.name = kasprintf(GFP_KERNEL, "%s:%s:%04x:%d",
 				      node->parent->name, node->name,
 				      reg_data->offset, 0);
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
