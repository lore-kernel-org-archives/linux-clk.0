Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10973 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbeIODNe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Sep 2018 23:13:34 -0400
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 05/14] memory: tegra: mc: Introduce helpers
Date: Sat, 15 Sep 2018 00:48:06 +0300
Message-ID: <1536961695-27809-6-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536961695-27809-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536961695-27809-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Introduce a few helper functions to lookup a timing for a given rate and
modify MC register field. These will be useful when adding support for
updating the latency allowance (LA) registers when scaling the EMC clock.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/memory/tegra/mc.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index a4803ac..af4bf29 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -73,6 +73,17 @@
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+static void mc_modifyl(struct tegra_mc *mc, u32 reg, u32 value, u8 shift,
+		       u8 mask)
+{
+	u32 val;
+
+	val = readl(mc->regs + reg);
+	val &= ~(mask << shift);
+	val |= (value & mask) << shift;
+	writel(val, mc->regs + reg);
+}
+
 static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 {
 	unsigned long long tick;
@@ -91,18 +102,14 @@ static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 	/* write latency allowance defaults */
 	for (i = 0; i < mc->soc->num_clients; i++) {
 		const struct tegra_mc_la *la = &mc->soc->clients[i].la;
-		u32 value;
-
-		value = readl(mc->regs + la->reg);
-		value &= ~(la->mask << la->shift);
-		value |= (la->def & la->mask) << la->shift;
-		writel(value, mc->regs + la->reg);
+		mc_modifyl(mc, la->reg, la->def, la->shift, la->mask);
 	}
 
 	return 0;
 }
 
-void tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate)
+static struct tegra_mc_timing *find_mc_timing(struct tegra_mc *mc,
+					      unsigned long rate)
 {
 	unsigned int i;
 	struct tegra_mc_timing *timing = NULL;
@@ -114,6 +121,15 @@ void tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate)
 		}
 	}
 
+	return timing;
+}
+
+void tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate)
+{
+	unsigned int i;
+	struct tegra_mc_timing *timing = NULL;
+
+	timing = find_mc_timing(mc, rate);
 	if (!timing) {
 		dev_err(mc->dev, "no memory timing registered for rate %lu\n",
 			rate);
-- 
1.9.1
