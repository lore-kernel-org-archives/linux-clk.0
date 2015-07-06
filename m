Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] clk: qcom: Constify the parent names arrays
Date: Mon,  6 Jul 2015 16:51:30 +0300
Message-Id: <1436190690-15983-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Make const both the array and the strings, so they can be
moved to .rodata section.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
Patch based on v4.2-rc1

 drivers/clk/qcom/gcc-apq8084.c  |   12 ++++++------
 drivers/clk/qcom/gcc-ipq806x.c  |   10 +++++-----
 drivers/clk/qcom/gcc-msm8660.c  |    8 ++++----
 drivers/clk/qcom/gcc-msm8916.c  |   24 ++++++++++++------------
 drivers/clk/qcom/gcc-msm8960.c  |   12 ++++++------
 drivers/clk/qcom/gcc-msm8974.c  |    4 ++--
 drivers/clk/qcom/lcc-ipq806x.c  |    6 +++---
 drivers/clk/qcom/lcc-msm8960.c  |    8 ++++----
 drivers/clk/qcom/mmcc-apq8084.c |   20 ++++++++++----------
 drivers/clk/qcom/mmcc-msm8960.c |   14 +++++++-------
 drivers/clk/qcom/mmcc-msm8974.c |   16 ++++++++--------
 11 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index 54a756b90a37..05b7a25b80e8 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -48,7 +48,7 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
 	{ P_GPLL0, 1 }
 };
 
-static const char *gcc_xo_gpll0[] = {
+static const char * const gcc_xo_gpll0[] = {
 	"xo",
 	"gpll0_vote",
 };
@@ -59,7 +59,7 @@ static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
 	{ P_GPLL4, 5 }
 };
 
-static const char *gcc_xo_gpll0_gpll4[] = {
+static const char * const gcc_xo_gpll0_gpll4[] = {
 	"xo",
 	"gpll0_vote",
 	"gpll4_vote",
@@ -70,7 +70,7 @@ static const struct parent_map gcc_xo_sata_asic0_map[] = {
 	{ P_SATA_ASIC0_CLK, 2 }
 };
 
-static const char *gcc_xo_sata_asic0[] = {
+static const char * const gcc_xo_sata_asic0[] = {
 	"xo",
 	"sata_asic0_clk",
 };
@@ -80,7 +80,7 @@ static const struct parent_map gcc_xo_sata_rx_map[] = {
 	{ P_SATA_RX_CLK, 2}
 };
 
-static const char *gcc_xo_sata_rx[] = {
+static const char * const gcc_xo_sata_rx[] = {
 	"xo",
 	"sata_rx_clk",
 };
@@ -90,7 +90,7 @@ static const struct parent_map gcc_xo_pcie_map[] = {
 	{ P_PCIE_0_1_PIPE_CLK, 2 }
 };
 
-static const char *gcc_xo_pcie[] = {
+static const char * const gcc_xo_pcie[] = {
 	"xo",
 	"pcie_pipe",
 };
@@ -100,7 +100,7 @@ static const struct parent_map gcc_xo_pcie_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 }
 };
 
-static const char *gcc_xo_pcie_sleep[] = {
+static const char * const gcc_xo_pcie_sleep[] = {
 	"xo",
 	"sleep_clk_src",
 };
diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index 563969942a1d..40e480220cd3 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -188,7 +188,7 @@ static const struct parent_map gcc_pxo_pll8_map[] = {
 	{ P_PLL8, 3 }
 };
 
-static const char *gcc_pxo_pll8[] = {
+static const char * const gcc_pxo_pll8[] = {
 	"pxo",
 	"pll8_vote",
 };
@@ -199,7 +199,7 @@ static const struct parent_map gcc_pxo_pll8_cxo_map[] = {
 	{ P_CXO, 5 }
 };
 
-static const char *gcc_pxo_pll8_cxo[] = {
+static const char * const gcc_pxo_pll8_cxo[] = {
 	"pxo",
 	"pll8_vote",
 	"cxo",
@@ -215,7 +215,7 @@ static const struct parent_map gcc_pxo_pll3_sata_map[] = {
 	{ P_PLL3, 6 }
 };
 
-static const char *gcc_pxo_pll3[] = {
+static const char * const gcc_pxo_pll3[] = {
 	"pxo",
 	"pll3",
 };
@@ -226,7 +226,7 @@ static const struct parent_map gcc_pxo_pll8_pll0[] = {
 	{ P_PLL0, 2 }
 };
 
-static const char *gcc_pxo_pll8_pll0_map[] = {
+static const char * const gcc_pxo_pll8_pll0_map[] = {
 	"pxo",
 	"pll8_vote",
 	"pll0_vote",
@@ -240,7 +240,7 @@ static const struct parent_map gcc_pxo_pll8_pll14_pll18_pll0_map[] = {
 	{ P_PLL18, 1 }
 };
 
-static const char *gcc_pxo_pll8_pll14_pll18_pll0[] = {
+static const char * const gcc_pxo_pll8_pll14_pll18_pll0[] = {
 	"pxo",
 	"pll8_vote",
 	"pll0_vote",
diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index fc6b12da5b30..b02826ed770a 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -70,7 +70,7 @@ static const struct parent_map gcc_pxo_pll8_map[] = {
 	{ P_PLL8, 3 }
 };
 
-static const char *gcc_pxo_pll8[] = {
+static const char * const gcc_pxo_pll8[] = {
 	"pxo",
 	"pll8_vote",
 };
@@ -81,7 +81,7 @@ static const struct parent_map gcc_pxo_pll8_cxo_map[] = {
 	{ P_CXO, 5 }
 };
 
-static const char *gcc_pxo_pll8_cxo[] = {
+static const char * const gcc_pxo_pll8_cxo[] = {
 	"pxo",
 	"pll8_vote",
 	"cxo",
@@ -1917,7 +1917,7 @@ static struct clk_rcg usb_fs1_xcvr_fs_src = {
 	}
 };
 
-static const char *usb_fs1_xcvr_fs_src_p[] = { "usb_fs1_xcvr_fs_src" };
+static const char * const usb_fs1_xcvr_fs_src_p[] = { "usb_fs1_xcvr_fs_src" };
 
 static struct clk_branch usb_fs1_xcvr_fs_clk = {
 	.halt_reg = 0x2fcc,
@@ -1984,7 +1984,7 @@ static struct clk_rcg usb_fs2_xcvr_fs_src = {
 	}
 };
 
-static const char *usb_fs2_xcvr_fs_src_p[] = { "usb_fs2_xcvr_fs_src" };
+static const char * const usb_fs2_xcvr_fs_src_p[] = { "usb_fs2_xcvr_fs_src" };
 
 static struct clk_branch usb_fs2_xcvr_fs_clk = {
 	.halt_reg = 0x2fcc,
diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index c66f7bc2ae87..3bf4fb3deef6 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -51,7 +51,7 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
 	{ P_GPLL0, 1 },
 };
 
-static const char *gcc_xo_gpll0[] = {
+static const char * const gcc_xo_gpll0[] = {
 	"xo",
 	"gpll0_vote",
 };
@@ -62,7 +62,7 @@ static const struct parent_map gcc_xo_gpll0_bimc_map[] = {
 	{ P_BIMC, 2 },
 };
 
-static const char *gcc_xo_gpll0_bimc[] = {
+static const char * const gcc_xo_gpll0_bimc[] = {
 	"xo",
 	"gpll0_vote",
 	"bimc_pll_vote",
@@ -75,7 +75,7 @@ static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2a_map[] = {
 	{ P_GPLL2_AUX, 2 },
 };
 
-static const char *gcc_xo_gpll0a_gpll1_gpll2a[] = {
+static const char * const gcc_xo_gpll0a_gpll1_gpll2a[] = {
 	"xo",
 	"gpll0_vote",
 	"gpll1_vote",
@@ -88,7 +88,7 @@ static const struct parent_map gcc_xo_gpll0_gpll2_map[] = {
 	{ P_GPLL2, 2 },
 };
 
-static const char *gcc_xo_gpll0_gpll2[] = {
+static const char * const gcc_xo_gpll0_gpll2[] = {
 	"xo",
 	"gpll0_vote",
 	"gpll2_vote",
@@ -99,7 +99,7 @@ static const struct parent_map gcc_xo_gpll0a_map[] = {
 	{ P_GPLL0_AUX, 2 },
 };
 
-static const char *gcc_xo_gpll0a[] = {
+static const char * const gcc_xo_gpll0a[] = {
 	"xo",
 	"gpll0_vote",
 };
@@ -111,7 +111,7 @@ static const struct parent_map gcc_xo_gpll0_gpll1a_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 },
 };
 
-static const char *gcc_xo_gpll0_gpll1a_sleep[] = {
+static const char * const gcc_xo_gpll0_gpll1a_sleep[] = {
 	"xo",
 	"gpll0_vote",
 	"gpll1_vote",
@@ -124,7 +124,7 @@ static const struct parent_map gcc_xo_gpll0_gpll1a_map[] = {
 	{ P_GPLL1_AUX, 2 },
 };
 
-static const char *gcc_xo_gpll0_gpll1a[] = {
+static const char * const gcc_xo_gpll0_gpll1a[] = {
 	"xo",
 	"gpll0_vote",
 	"gpll1_vote",
@@ -135,7 +135,7 @@ static const struct parent_map gcc_xo_dsibyte_map[] = {
 	{ P_DSI0_PHYPLL_BYTE, 2 },
 };
 
-static const char *gcc_xo_dsibyte[] = {
+static const char * const gcc_xo_dsibyte[] = {
 	"xo",
 	"dsi0pllbyte",
 };
@@ -146,7 +146,7 @@ static const struct parent_map gcc_xo_gpll0a_dsibyte_map[] = {
 	{ P_DSI0_PHYPLL_BYTE, 1 },
 };
 
-static const char *gcc_xo_gpll0a_dsibyte[] = {
+static const char * const gcc_xo_gpll0a_dsibyte[] = {
 	"xo",
 	"gpll0_vote",
 	"dsi0pllbyte",
@@ -158,7 +158,7 @@ static const struct parent_map gcc_xo_gpll0_dsiphy_map[] = {
 	{ P_DSI0_PHYPLL_DSI, 2 },
 };
 
-static const char *gcc_xo_gpll0_dsiphy[] = {
+static const char * const gcc_xo_gpll0_dsiphy[] = {
 	"xo",
 	"gpll0_vote",
 	"dsi0pll",
@@ -170,7 +170,7 @@ static const struct parent_map gcc_xo_gpll0a_dsiphy_map[] = {
 	{ P_DSI0_PHYPLL_DSI, 1 },
 };
 
-static const char *gcc_xo_gpll0a_dsiphy[] = {
+static const char * const gcc_xo_gpll0a_dsiphy[] = {
 	"xo",
 	"gpll0_vote",
 	"dsi0pll",
@@ -183,7 +183,7 @@ static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2_map[] = {
 	{ P_GPLL2, 2 },
 };
 
-static const char *gcc_xo_gpll0a_gpll1_gpll2[] = {
+static const char * const gcc_xo_gpll0a_gpll1_gpll2[] = {
 	"xo",
 	"gpll0_vote",
 	"gpll1_vote",
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index eb6a4f9fa107..aa294b1bad34 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -125,7 +125,7 @@ static const struct parent_map gcc_pxo_pll8_map[] = {
 	{ P_PLL8, 3 }
 };
 
-static const char *gcc_pxo_pll8[] = {
+static const char * const gcc_pxo_pll8[] = {
 	"pxo",
 	"pll8_vote",
 };
@@ -136,7 +136,7 @@ static const struct parent_map gcc_pxo_pll8_cxo_map[] = {
 	{ P_CXO, 5 }
 };
 
-static const char *gcc_pxo_pll8_cxo[] = {
+static const char * const gcc_pxo_pll8_cxo[] = {
 	"pxo",
 	"pll8_vote",
 	"cxo",
@@ -148,7 +148,7 @@ static const struct parent_map gcc_pxo_pll8_pll3_map[] = {
 	{ P_PLL3, 6 }
 };
 
-static const char *gcc_pxo_pll8_pll3[] = {
+static const char * const gcc_pxo_pll8_pll3[] = {
 	"pxo",
 	"pll8_vote",
 	"pll3",
@@ -2085,7 +2085,7 @@ static struct clk_rcg usb_hsic_xcvr_fs_src = {
 	}
 };
 
-static const char *usb_hsic_xcvr_fs_src_p[] = { "usb_hsic_xcvr_fs_src" };
+static const char * const usb_hsic_xcvr_fs_src_p[] = { "usb_hsic_xcvr_fs_src" };
 
 static struct clk_branch usb_hsic_xcvr_fs_clk = {
 	.halt_reg = 0x2fc8,
@@ -2181,7 +2181,7 @@ static struct clk_rcg usb_fs1_xcvr_fs_src = {
 	}
 };
 
-static const char *usb_fs1_xcvr_fs_src_p[] = { "usb_fs1_xcvr_fs_src" };
+static const char * const usb_fs1_xcvr_fs_src_p[] = { "usb_fs1_xcvr_fs_src" };
 
 static struct clk_branch usb_fs1_xcvr_fs_clk = {
 	.halt_reg = 0x2fcc,
@@ -2248,7 +2248,7 @@ static struct clk_rcg usb_fs2_xcvr_fs_src = {
 	}
 };
 
-static const char *usb_fs2_xcvr_fs_src_p[] = { "usb_fs2_xcvr_fs_src" };
+static const char * const usb_fs2_xcvr_fs_src_p[] = { "usb_fs2_xcvr_fs_src" };
 
 static struct clk_branch usb_fs2_xcvr_fs_clk = {
 	.halt_reg = 0x2fcc,
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index c39d09874e74..2c289702119f 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -44,7 +44,7 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
 	{ P_GPLL0, 1 }
 };
 
-static const char *gcc_xo_gpll0[] = {
+static const char * const gcc_xo_gpll0[] = {
 	"xo",
 	"gpll0_vote",
 };
@@ -55,7 +55,7 @@ static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
 	{ P_GPLL4, 5 }
 };
 
-static const char *gcc_xo_gpll0_gpll4[] = {
+static const char * const gcc_xo_gpll0_gpll4[] = {
 	"xo",
 	"gpll0_vote",
 	"gpll4_vote",
diff --git a/drivers/clk/qcom/lcc-ipq806x.c b/drivers/clk/qcom/lcc-ipq806x.c
index 47f0ac16d149..93ad42b14366 100644
--- a/drivers/clk/qcom/lcc-ipq806x.c
+++ b/drivers/clk/qcom/lcc-ipq806x.c
@@ -71,7 +71,7 @@ static const struct parent_map lcc_pxo_pll4_map[] = {
 	{ P_PLL4, 2 }
 };
 
-static const char *lcc_pxo_pll4[] = {
+static const char * const lcc_pxo_pll4[] = {
 	"pxo",
 	"pll4_vote",
 };
@@ -146,7 +146,7 @@ static struct clk_rcg mi2s_osr_src = {
 	},
 };
 
-static const char *lcc_mi2s_parents[] = {
+static const char * const lcc_mi2s_parents[] = {
 	"mi2s_osr_src",
 };
 
@@ -340,7 +340,7 @@ static struct clk_rcg spdif_src = {
 	},
 };
 
-static const char *lcc_spdif_parents[] = {
+static const char * const lcc_spdif_parents[] = {
 	"spdif_src",
 };
 
diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index d0df9d5fc3af..ecb96c284675 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -57,7 +57,7 @@ static const struct parent_map lcc_pxo_pll4_map[] = {
 	{ P_PLL4, 2 }
 };
 
-static const char *lcc_pxo_pll4[] = {
+static const char * const lcc_pxo_pll4[] = {
 	"pxo",
 	"pll4_vote",
 };
@@ -127,7 +127,7 @@ static struct clk_rcg mi2s_osr_src = {
 	},
 };
 
-static const char *lcc_mi2s_parents[] = {
+static const char * const lcc_mi2s_parents[] = {
 	"mi2s_osr_src",
 };
 
@@ -233,7 +233,7 @@ static struct clk_rcg prefix##_osr_src = {			\
 	},							\
 };								\
 								\
-static const char *lcc_##prefix##_parents[] = {			\
+static const char * const lcc_##prefix##_parents[] = {		\
 	#prefix "_osr_src",					\
 };								\
 								\
@@ -445,7 +445,7 @@ static struct clk_rcg slimbus_src = {
 	},
 };
 
-static const char *lcc_slimbus_parents[] = {
+static const char * const lcc_slimbus_parents[] = {
 	"slimbus_src",
 };
 
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 1b17df2cb0af..f0ee6bde11af 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -53,7 +53,7 @@ static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
 	{ P_GPLL0, 5 }
 };
 
-static const char *mmcc_xo_mmpll0_mmpll1_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_mmpll1_gpll0[] = {
 	"xo",
 	"mmpll0_vote",
 	"mmpll1_vote",
@@ -69,7 +69,7 @@ static const struct parent_map mmcc_xo_mmpll0_dsi_hdmi_gpll0_map[] = {
 	{ P_DSI1PLL, 3 }
 };
 
-static const char *mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
 	"xo",
 	"mmpll0_vote",
 	"hdmipll",
@@ -86,7 +86,7 @@ static const struct parent_map mmcc_xo_mmpll0_1_2_gpll0_map[] = {
 	{ P_MMPLL2, 3 }
 };
 
-static const char *mmcc_xo_mmpll0_1_2_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_1_2_gpll0[] = {
 	"xo",
 	"mmpll0_vote",
 	"mmpll1_vote",
@@ -102,7 +102,7 @@ static const struct parent_map mmcc_xo_mmpll0_1_3_gpll0_map[] = {
 	{ P_MMPLL3, 3 }
 };
 
-static const char *mmcc_xo_mmpll0_1_3_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_1_3_gpll0[] = {
 	"xo",
 	"mmpll0_vote",
 	"mmpll1_vote",
@@ -119,7 +119,7 @@ static const struct parent_map mmcc_xo_dsi_hdmi_edp_map[] = {
 	{ P_DSI1PLL, 2 }
 };
 
-static const char *mmcc_xo_dsi_hdmi_edp[] = {
+static const char * const mmcc_xo_dsi_hdmi_edp[] = {
 	"xo",
 	"edp_link_clk",
 	"hdmipll",
@@ -137,7 +137,7 @@ static const struct parent_map mmcc_xo_dsi_hdmi_edp_gpll0_map[] = {
 	{ P_DSI1PLL, 2 }
 };
 
-static const char *mmcc_xo_dsi_hdmi_edp_gpll0[] = {
+static const char * const mmcc_xo_dsi_hdmi_edp_gpll0[] = {
 	"xo",
 	"edp_link_clk",
 	"hdmipll",
@@ -155,7 +155,7 @@ static const struct parent_map mmcc_xo_dsibyte_hdmi_edp_gpll0_map[] = {
 	{ P_DSI1PLL_BYTE, 2 }
 };
 
-static const char *mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
+static const char * const mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
 	"xo",
 	"edp_link_clk",
 	"hdmipll",
@@ -172,7 +172,7 @@ static const struct parent_map mmcc_xo_mmpll0_1_4_gpll0_map[] = {
 	{ P_MMPLL4, 3 }
 };
 
-static const char *mmcc_xo_mmpll0_1_4_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_1_4_gpll0[] = {
 	"xo",
 	"mmpll0",
 	"mmpll1",
@@ -189,7 +189,7 @@ static const struct parent_map mmcc_xo_mmpll0_1_4_gpll1_0_map[] = {
 	{ P_GPLL1, 4 }
 };
 
-static const char *mmcc_xo_mmpll0_1_4_gpll1_0[] = {
+static const char * const mmcc_xo_mmpll0_1_4_gpll1_0[] = {
 	"xo",
 	"mmpll0",
 	"mmpll1",
@@ -208,7 +208,7 @@ static const struct parent_map mmcc_xo_mmpll0_1_4_gpll1_0_sleep_map[] = {
 	{ P_MMSLEEP, 6 }
 };
 
-static const char *mmcc_xo_mmpll0_1_4_gpll1_0_sleep[] = {
+static const char * const mmcc_xo_mmpll0_1_4_gpll1_0_sleep[] = {
 	"xo",
 	"mmpll0",
 	"mmpll1",
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 9711bca9cc06..54aadbcda61a 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -50,7 +50,7 @@ static const struct parent_map mmcc_pxo_pll8_pll2_map[] = {
 	{ P_PLL2, 1 }
 };
 
-static const char *mmcc_pxo_pll8_pll2[] = {
+static const char * const mmcc_pxo_pll8_pll2[] = {
 	"pxo",
 	"pll8_vote",
 	"pll2",
@@ -63,7 +63,7 @@ static const struct parent_map mmcc_pxo_pll8_pll2_pll3_map[] = {
 	{ P_PLL3, 3 }
 };
 
-static const char *mmcc_pxo_pll8_pll2_pll15[] = {
+static const char * const mmcc_pxo_pll8_pll2_pll15[] = {
 	"pxo",
 	"pll8_vote",
 	"pll2",
@@ -77,7 +77,7 @@ static const struct parent_map mmcc_pxo_pll8_pll2_pll15_map[] = {
 	{ P_PLL15, 3 }
 };
 
-static const char *mmcc_pxo_pll8_pll2_pll3[] = {
+static const char * const mmcc_pxo_pll8_pll2_pll3[] = {
 	"pxo",
 	"pll8_vote",
 	"pll2",
@@ -579,7 +579,7 @@ static const struct clk_ops clk_ops_pix_rdi = {
 	.determine_rate = __clk_mux_determine_rate,
 };
 
-static const char *pix_rdi_parents[] = {
+static const char * const pix_rdi_parents[] = {
 	"csi0_clk",
 	"csi1_clk",
 	"csi2_clk",
@@ -709,7 +709,7 @@ static struct clk_rcg csiphytimer_src = {
 	},
 };
 
-static const char *csixphy_timer_src[] = { "csiphytimer_src" };
+static const char * const csixphy_timer_src[] = { "csiphytimer_src" };
 
 static struct clk_branch csiphy0_timer_clk = {
 	.halt_reg = 0x01e8,
@@ -1385,7 +1385,7 @@ static const struct parent_map mmcc_pxo_hdmi_map[] = {
 	{ P_HDMI_PLL, 3 }
 };
 
-static const char *mmcc_pxo_hdmi[] = {
+static const char * const mmcc_pxo_hdmi[] = {
 	"pxo",
 	"hdmi_pll",
 };
@@ -1428,7 +1428,7 @@ static struct clk_rcg tv_src = {
 	},
 };
 
-static const char *tv_src_name[] = { "tv_src" };
+static const char * const tv_src_name[] = { "tv_src" };
 
 static struct clk_branch tv_enc_clk = {
 	.halt_reg = 0x01d4,
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 07f4cc159ad3..0987bf443e1f 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -56,7 +56,7 @@ static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
 	{ P_GPLL0, 5 }
 };
 
-static const char *mmcc_xo_mmpll0_mmpll1_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_mmpll1_gpll0[] = {
 	"xo",
 	"mmpll0_vote",
 	"mmpll1_vote",
@@ -72,7 +72,7 @@ static const struct parent_map mmcc_xo_mmpll0_dsi_hdmi_gpll0_map[] = {
 	{ P_DSI1PLL, 3 }
 };
 
-static const char *mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
 	"xo",
 	"mmpll0_vote",
 	"hdmipll",
@@ -89,7 +89,7 @@ static const struct parent_map mmcc_xo_mmpll0_1_2_gpll0_map[] = {
 	{ P_MMPLL2, 3 }
 };
 
-static const char *mmcc_xo_mmpll0_1_2_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_1_2_gpll0[] = {
 	"xo",
 	"mmpll0_vote",
 	"mmpll1_vote",
@@ -105,7 +105,7 @@ static const struct parent_map mmcc_xo_mmpll0_1_3_gpll0_map[] = {
 	{ P_MMPLL3, 3 }
 };
 
-static const char *mmcc_xo_mmpll0_1_3_gpll0[] = {
+static const char * const mmcc_xo_mmpll0_1_3_gpll0[] = {
 	"xo",
 	"mmpll0_vote",
 	"mmpll1_vote",
@@ -121,7 +121,7 @@ static const struct parent_map mmcc_xo_mmpll0_1_gpll1_0_map[] = {
 	{ P_GPLL1, 4 }
 };
 
-static const char *mmcc_xo_mmpll0_1_gpll1_0[] = {
+static const char * const mmcc_xo_mmpll0_1_gpll1_0[] = {
 	"xo",
 	"mmpll0_vote",
 	"mmpll1_vote",
@@ -138,7 +138,7 @@ static const struct parent_map mmcc_xo_dsi_hdmi_edp_map[] = {
 	{ P_DSI1PLL, 2 }
 };
 
-static const char *mmcc_xo_dsi_hdmi_edp[] = {
+static const char * const mmcc_xo_dsi_hdmi_edp[] = {
 	"xo",
 	"edp_link_clk",
 	"hdmipll",
@@ -156,7 +156,7 @@ static const struct parent_map mmcc_xo_dsi_hdmi_edp_gpll0_map[] = {
 	{ P_DSI1PLL, 2 }
 };
 
-static const char *mmcc_xo_dsi_hdmi_edp_gpll0[] = {
+static const char * const mmcc_xo_dsi_hdmi_edp_gpll0[] = {
 	"xo",
 	"edp_link_clk",
 	"hdmipll",
@@ -174,7 +174,7 @@ static const struct parent_map mmcc_xo_dsibyte_hdmi_edp_gpll0_map[] = {
 	{ P_DSI1PLL_BYTE, 2 }
 };
 
-static const char *mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
+static const char * const mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
 	"xo",
 	"edp_link_clk",
 	"hdmipll",
