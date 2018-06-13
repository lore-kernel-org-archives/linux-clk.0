Return-Path: <tdas@codeaurora.org>
From: Taniya Das <tdas@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <tdas@codeaurora.org>
Subject: [PATCH] clk: qcom: Move frequency table macro to common file
Date: Wed, 13 Jun 2018 15:30:41 +0530
Message-Id: <1528884041-26366-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Frequency table macro is used by multiple clock drivers, move frequency
table macro to common header file.

Change-Id: I78d76f04b6c335c05dd9325025be7db1e99cbeac
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg.h        | 2 ++
 drivers/clk/qcom/gcc-apq8084.c    | 2 --
 drivers/clk/qcom/gcc-ipq4019.c    | 2 --
 drivers/clk/qcom/gcc-ipq8074.c    | 2 --
 drivers/clk/qcom/gcc-msm8916.c    | 2 --
 drivers/clk/qcom/gcc-msm8974.c    | 2 --
 drivers/clk/qcom/gcc-msm8994.c    | 2 --
 drivers/clk/qcom/gcc-msm8996.c    | 2 --
 drivers/clk/qcom/gcc-msm8998.c    | 2 --
 drivers/clk/qcom/gcc-sdm845.c     | 2 --
 drivers/clk/qcom/mmcc-apq8084.c   | 2 --
 drivers/clk/qcom/mmcc-msm8974.c   | 2 --
 drivers/clk/qcom/mmcc-msm8996.c   | 2 --
 drivers/clk/qcom/videocc-sdm845.c | 2 --
 14 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index b209a2f..dbd5a9e 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -7,6 +7,8 @@
 #include <linux/clk-provider.h>
 #include "clk-regmap.h"
 
+#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
+
 struct freq_tbl {
 	unsigned long freq;
 	u8 src;
diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index 486d961..9c99a71 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -106,8 +106,6 @@ enum {
 	"sleep_clk_src",
 };
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 static struct clk_pll gpll0 = {
 	.l_reg = 0x0004,
 	.m_reg = 0x0008,
diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 46cb256..8902ad4 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -179,8 +179,6 @@ struct clk_fepll {
 	"ddrpllapss",
 };
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 static const struct freq_tbl ftbl_gcc_audio_pwm_clk[] = {
 	F(48000000, P_XO, 1, 0, 0),
 	F(200000000, P_FEPLL200, 1, 0, 0),
diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 0462f4a..505c626 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -32,8 +32,6 @@
 #include "clk-regmap-mux.h"
 #include "reset.h"
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 enum {
 	P_XO,
 	P_GPLL0,
diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index d6c7f50..ac2b0aa 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -264,8 +264,6 @@ enum {
 	"sleep_clk",
 };
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 static struct clk_pll gpll0 = {
 	.l_reg = 0x21004,
 	.m_reg = 0x21008,
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 348e30d..08e2900d 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -62,8 +62,6 @@ enum {
 	"gpll4_vote",
 };
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 static struct clk_pll gpll0 = {
 	.l_reg = 0x0004,
 	.m_reg = 0x0008,
diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 1e38efc..53f0f36 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -57,8 +57,6 @@ enum {
 	"gpll4",
 };
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 9f35b3f..9d3756c 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -32,8 +32,6 @@
 #include "reset.h"
 #include "gdsc.h"
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 enum {
 	P_XO,
 	P_GPLL0,
diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 78d87f5..9f0ae40 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -25,8 +25,6 @@
 #include "reset.h"
 #include "gdsc.h"
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 enum {
 	P_AUD_REF_CLK,
 	P_CORE_BI_PLL_TEST_SE,
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index e78e6f5..19b470f 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -25,8 +25,6 @@
 #include "gdsc.h"
 #include "reset.h"
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 enum {
 	P_BI_TCXO,
 	P_AUD_REF_CLK,
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 30777f9..4ce1d7c 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -219,8 +219,6 @@ enum {
 	"sleep_clk_src",
 };
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 static struct clk_pll mmpll0 = {
 	.l_reg = 0x0004,
 	.m_reg = 0x0008,
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 715e7cd..9181851 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -184,8 +184,6 @@ enum {
 	"dsi1pllbyte",
 };
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 static struct clk_pll mmpll0 = {
 	.l_reg = 0x0004,
 	.m_reg = 0x0008,
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 1a25ee4..60f08b3 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -34,8 +34,6 @@
 #include "reset.h"
 #include "gdsc.h"
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 enum {
 	P_XO,
 	P_MMPLL0,
diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 9073b7a..5d6a772 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -18,8 +18,6 @@
 #include "clk-pll.h"
 #include "gdsc.h"
 
-#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-
 enum {
 	P_BI_TCXO,
 	P_CORE_BI_PLL_TEST_SE,
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
