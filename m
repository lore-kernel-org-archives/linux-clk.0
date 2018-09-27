Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19101 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbeI0IsF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 04:48:05 -0400
From: Joseph Lo <josephl@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH V2] clk: tegra: Fixes for MBIST work around
Date: Thu, 27 Sep 2018 10:32:03 +0800
Message-ID: <20180927023203.9218-1-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Fix some incorrect data in LVL2 offset and bit mask.

Fixes: e403d0057343 ("clk: tegra: MBIST work around for Tegra210")
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
V2:
Add "Fixes" tag.
---
 drivers/clk/tegra/clk-tegra210.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra=
210.c
index 9eb1cb14fce1..290f7cb6a051 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2603,7 +2603,7 @@ static struct tegra210_domain_mbist_war tegra210_pg_m=
bist_war[] =3D {
 	[TEGRA_POWERGATE_MPE] =3D {
 		.handle_lvl2_ovr =3D tegra210_generic_mbist_war,
 		.lvl2_offset =3D LVL2_CLK_GATE_OVRE,
-		.lvl2_mask =3D BIT(2),
+		.lvl2_mask =3D BIT(29),
 	},
 	[TEGRA_POWERGATE_SOR] =3D {
 		.handle_lvl2_ovr =3D tegra210_generic_mbist_war,
@@ -2654,14 +2654,14 @@ static struct tegra210_domain_mbist_war tegra210_pg=
_mbist_war[] =3D {
 		.num_clks =3D ARRAY_SIZE(nvdec_slcg_clkids),
 		.clk_init_data =3D nvdec_slcg_clkids,
 		.handle_lvl2_ovr =3D tegra210_generic_mbist_war,
-		.lvl2_offset =3D LVL2_CLK_GATE_OVRC,
+		.lvl2_offset =3D LVL2_CLK_GATE_OVRE,
 		.lvl2_mask =3D BIT(9) | BIT(31),
 	},
 	[TEGRA_POWERGATE_NVJPG] =3D {
 		.num_clks =3D ARRAY_SIZE(nvjpg_slcg_clkids),
 		.clk_init_data =3D nvjpg_slcg_clkids,
 		.handle_lvl2_ovr =3D tegra210_generic_mbist_war,
-		.lvl2_offset =3D LVL2_CLK_GATE_OVRC,
+		.lvl2_offset =3D LVL2_CLK_GATE_OVRE,
 		.lvl2_mask =3D BIT(9) | BIT(31),
 	},
 	[TEGRA_POWERGATE_AUD] =3D {
--=20
2.19.0
