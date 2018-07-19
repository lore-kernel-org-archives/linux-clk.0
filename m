Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6408 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbeGSPIy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jul 2018 11:08:54 -0400
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
CC: Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] clk: tegra: Fixes for MBIST work around
Date: Thu, 19 Jul 2018 17:25:23 +0300
Message-ID: <1532010323-28534-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Joseph Lo <josephl@nvidia.com>

Fix some incorrect data in LVL2 offset and bit mask.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index d92f1d7..e71a9ce 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2603,7 +2603,7 @@ struct utmi_clk_param {
 	[TEGRA_POWERGATE_MPE] = {
 		.handle_lvl2_ovr = tegra210_generic_mbist_war,
 		.lvl2_offset = LVL2_CLK_GATE_OVRE,
-		.lvl2_mask = BIT(2),
+		.lvl2_mask = BIT(29),
 	},
 	[TEGRA_POWERGATE_SOR] = {
 		.handle_lvl2_ovr = tegra210_generic_mbist_war,
@@ -2654,14 +2654,14 @@ struct utmi_clk_param {
 		.num_clks = ARRAY_SIZE(nvdec_slcg_clkids),
 		.clk_init_data = nvdec_slcg_clkids,
 		.handle_lvl2_ovr = tegra210_generic_mbist_war,
-		.lvl2_offset = LVL2_CLK_GATE_OVRC,
+		.lvl2_offset = LVL2_CLK_GATE_OVRE,
 		.lvl2_mask = BIT(9) | BIT(31),
 	},
 	[TEGRA_POWERGATE_NVJPG] = {
 		.num_clks = ARRAY_SIZE(nvjpg_slcg_clkids),
 		.clk_init_data = nvjpg_slcg_clkids,
 		.handle_lvl2_ovr = tegra210_generic_mbist_war,
-		.lvl2_offset = LVL2_CLK_GATE_OVRC,
+		.lvl2_offset = LVL2_CLK_GATE_OVRE,
 		.lvl2_mask = BIT(9) | BIT(31),
 	},
 	[TEGRA_POWERGATE_AUD] = {
-- 
1.9.1

