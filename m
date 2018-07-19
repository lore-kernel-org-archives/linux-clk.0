Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:18733 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbeGSNFH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jul 2018 09:05:07 -0400
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] clk: tegra: Correct clk_out_mux parents
Date: Thu, 19 Jul 2018 15:22:05 +0300
Message-ID: <1532002925-16809-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The first 3 possible parents of clk_out_[1-3] are defined as clk_m, clk_m/2
and clk_m/4. However They are actually osc, osc/2 and osc/4. In chips prior
to Tegra210 clk_m and osc had the same frequency, so this difference didn't
matter. Since Tegra210 however, clk_m is a divided version of osc. This
results in CCF reporting the rate as only half the actual rate on Tegra210.
To fix this, we add new clocks which have osc, osc/2, osc/4 and the
respective extern clock as their possible parents and use them for
Tegra210. Also 2 new DT clock defines are added to reflect the new
names of clk_m/2 and clk_m/4. The old defines are still kept for backwards
compatibility.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-id.h               |  5 +++++
 drivers/clk/tegra/clk-tegra-fixed.c      | 16 ++++++++++++++++
 drivers/clk/tegra/clk-tegra-pmc.c        | 28 ++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-tegra210.c         | 14 +++++++-------
 include/dt-bindings/clock/tegra210-car.h |  9 +++++++--
 5 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index b616e33..d9a0a87 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -326,6 +326,11 @@ enum clk_id {
 	tegra_clk_pll_a_out0_out_adsp,
 	tegra_clk_adsp,
 	tegra_clk_adsp_neon,
+	tegra_clk_osc_div2,
+	tegra_clk_osc_div4,
+	tegra_clk_clk_out_1_osc_mux,
+	tegra_clk_clk_out_2_osc_mux,
+	tegra_clk_clk_out_3_osc_mux,
 	tegra_clk_max,
 };
 
diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 91c38f1..e15b67b 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -106,4 +106,20 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
 					CLK_SET_RATE_PARENT, 1, 4);
 		*dt_clk = clk;
 	}
+
+	/* clk_m_div2 */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_osc_div2, tegra_clks);
+	if (dt_clk) {
+		clk = clk_register_fixed_factor(NULL, "osc_div2", "osc",
+					CLK_SET_RATE_PARENT, 1, 2);
+		*dt_clk = clk;
+	}
+
+	/* clk_m_div4 */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_osc_div4, tegra_clks);
+	if (dt_clk) {
+		clk = clk_register_fixed_factor(NULL, "osc_div4", "osc",
+					CLK_SET_RATE_PARENT, 1, 4);
+		*dt_clk = clk;
+	}
 }
diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index a35579a..6ac67b8 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -58,6 +58,19 @@ struct pmc_clk_init_data {
 		.gate_shift = _gate_shift,\
 	}
 
+#define PMC_OSC_CLK(_num, _mux_shift, _gate_shift)\
+	{\
+		.mux_name = "clk_out_" #_num "_mux",\
+		.gate_name = "clk_out_" #_num,\
+		.parents = clk_out ##_num ##_osc_parents,\
+		.num_parents = ARRAY_SIZE(clk_out ##_num ##_osc_parents),\
+		.mux_id = tegra_clk_clk_out_ ##_num ##_osc_mux,\
+		.gate_id = tegra_clk_clk_out_ ##_num,\
+		.dev_name = "extern" #_num,\
+		.mux_shift = _mux_shift,\
+		.gate_shift = _gate_shift,\
+	}
+
 static DEFINE_SPINLOCK(clk_out_lock);
 
 static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
@@ -72,10 +85,25 @@ struct pmc_clk_init_data {
 	"clk_m_div4", "extern3",
 };
 
+static const char * const clk_out1_osc_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern1",
+};
+
+static const char * const clk_out2_osc_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern2",
+};
+
+static const char * const clk_out3_osc_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern3",
+};
+
 static struct pmc_clk_init_data pmc_clks[] = {
 	PMC_CLK(1, 6, 2),
 	PMC_CLK(2, 14, 10),
 	PMC_CLK(3, 22, 18),
+	PMC_OSC_CLK(1, 6, 2),
+	PMC_OSC_CLK(2, 14, 10),
+	PMC_OSC_CLK(3, 22, 18),
 };
 
 void __init tegra_pmc_clk_init(void __iomem *pmc_base,
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 5435d01..d92f1d7 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2370,8 +2370,8 @@ struct utmi_clk_param {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA210_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA210_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA210_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA210_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA210_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA210_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA210_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA210_CLK_PLL_REF, .present = true },
 	[tegra_clk_pll_c] = { .dt_id = TEGRA210_CLK_PLL_C, .present = true },
 	[tegra_clk_pll_c_out1] = { .dt_id = TEGRA210_CLK_PLL_C_OUT1, .present = true },
@@ -2451,9 +2451,9 @@ struct utmi_clk_param {
 	[tegra_clk_audio3_mux] = { .dt_id = TEGRA210_CLK_AUDIO3_MUX, .present = true },
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA210_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA210_CLK_SPDIF_MUX, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_3_MUX, .present = true },
+	[tegra_clk_clk_out_1_osc_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_1_MUX, .present = true },
+	[tegra_clk_clk_out_2_osc_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_2_MUX, .present = true },
+	[tegra_clk_clk_out_3_osc_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_maud] = { .dt_id = TEGRA210_CLK_MAUD, .present = true },
 	[tegra_clk_mipibif] = { .dt_id = TEGRA210_CLK_MIPIBIF, .present = true },
 	[tegra_clk_qspi] = { .dt_id = TEGRA210_CLK_QSPI, .present = true },
@@ -2496,8 +2496,8 @@ struct utmi_clk_param {
 	{ .con_id = "clk_m", .dt_id = TEGRA210_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA210_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA210_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA210_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA210_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA210_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA210_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA210_CLK_PLL_C },
 	{ .con_id = "pll_c_out1", .dt_id = TEGRA210_CLK_PLL_C_OUT1 },
 	{ .con_id = "pll_c2", .dt_id = TEGRA210_CLK_PLL_C2 },
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 6b77e72..08ec981 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -260,8 +260,13 @@
 #define TEGRA210_CLK_FUSE_BURN 231
 #define TEGRA210_CLK_CLK_32K 232
 #define TEGRA210_CLK_CLK_M 233
-#define TEGRA210_CLK_CLK_M_DIV2 234
-#define TEGRA210_CLK_CLK_M_DIV4 235
+
+#define TEGRA210_CLK_OSC_DIV2 234
+#define TEGRA210_CLK_OSC_DIV4 235
+/* for backwards compatibility */
+#define TEGRA210_CLK_CLK_M_DIV2 TEGRA210_CLK_OSC_DIV2
+#define TEGRA210_CLK_CLK_M_DIV4 TEGRA210_CLK_OSC_DIV4
+
 #define TEGRA210_CLK_PLL_REF 236
 #define TEGRA210_CLK_PLL_C 237
 #define TEGRA210_CLK_PLL_C_OUT1 238
-- 
1.9.1

