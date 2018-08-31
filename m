Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 05/11] clk: ti: clkctrl: replace dashes from clkdm name with underscore
Date: Fri, 31 Aug 2018 18:07:01 +0300
Message-ID: <1535728027-24573-6-git-send-email-t-kristo@ti.com>
In-Reply-To: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The change in the DTS data node naming prevents using underscore
within the node names and force usage of dash instead. On the other
hand, clockdomains use underscore instead of dash, so this must be
replaced within the driver code so that the mapping between the two
can be done properly.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 51cb73a..a227f4b 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -445,6 +445,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 	const __be32 *addrp;
 	u32 addr;
 	int ret;
+	char *c;
 
 	if (!(ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) &&
 	    !strcmp(node->name, "clk"))
@@ -532,6 +533,15 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 
 	strcat(provider->clkdm_name, "clkdm");
 
+	/* Replace any dash from the clkdm name with underscore */
+	c = provider->clkdm_name;
+
+	while (*c) {
+		if (*c == '-')
+			*c = '_';
+		c++;
+	}
+
 	INIT_LIST_HEAD(&provider->clocks);
 
 	/* Generate clocks */
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
