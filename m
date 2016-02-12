Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@linaro.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] Revert "clk: qcom: Specify LE device endianness"
Date: Fri, 12 Feb 2016 09:27:40 -0800
Message-Id: <1455298060-15199-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This reverts commit 329cabcecf94d8d7821e729dda284ba9dec44c87.

The commit that caused us to specify LE device endianness here,
29bb45f25ff3 (regmap-mmio: Use native endianness for read/write,
2015-10-29), has been reverted in mainline so now when we specify
LE it actively breaks big endian kernels because the byte
swapping in regmap-mmio is incorrect. Let's revert this change
because it will 1) fix the big endian kernels and 2) be redundant
to specify LE because that will become the default soon.

Cc: Kevin Hilman <khilman@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/gcc-apq8084.c  | 1 -
 drivers/clk/qcom/gcc-ipq806x.c  | 1 -
 drivers/clk/qcom/gcc-msm8660.c  | 1 -
 drivers/clk/qcom/gcc-msm8916.c  | 1 -
 drivers/clk/qcom/gcc-msm8960.c  | 2 --
 drivers/clk/qcom/gcc-msm8974.c  | 1 -
 drivers/clk/qcom/lcc-ipq806x.c  | 1 -
 drivers/clk/qcom/lcc-msm8960.c  | 1 -
 drivers/clk/qcom/mmcc-apq8084.c | 1 -
 drivers/clk/qcom/mmcc-msm8960.c | 2 --
 drivers/clk/qcom/mmcc-msm8974.c | 1 -
 11 files changed, 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index cf73e539e9f6..070037a29ea5 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -3587,7 +3587,6 @@ static const struct regmap_config gcc_apq8084_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x1fc0,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_apq8084_desc = {
diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index b692ae881d6a..dd5402bac620 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -3005,7 +3005,6 @@ static const struct regmap_config gcc_ipq806x_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x3e40,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_ipq806x_desc = {
diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index f6a2b14dfec4..ad413036f7c7 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -2702,7 +2702,6 @@ static const struct regmap_config gcc_msm8660_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x363c,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_msm8660_desc = {
diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index e3bf09d7d0ef..8cc9b2868b41 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -3336,7 +3336,6 @@ static const struct regmap_config gcc_msm8916_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x80000,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_msm8916_desc = {
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index f31111e32d44..983dd7dc89a7 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3468,7 +3468,6 @@ static const struct regmap_config gcc_msm8960_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x3660,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct regmap_config gcc_apq8064_regmap_config = {
@@ -3477,7 +3476,6 @@ static const struct regmap_config gcc_apq8064_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x3880,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_msm8960_desc = {
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index df164d618e34..335952db309b 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -2680,7 +2680,6 @@ static const struct regmap_config gcc_msm8974_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x1fc0,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_msm8974_desc = {
diff --git a/drivers/clk/qcom/lcc-ipq806x.c b/drivers/clk/qcom/lcc-ipq806x.c
index 62e79fadd5f7..db3998e5e2d8 100644
--- a/drivers/clk/qcom/lcc-ipq806x.c
+++ b/drivers/clk/qcom/lcc-ipq806x.c
@@ -419,7 +419,6 @@ static const struct regmap_config lcc_ipq806x_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0xfc,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc lcc_ipq806x_desc = {
diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index bf95bb0ea1b8..4fcf9d1d233c 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -524,7 +524,6 @@ static const struct regmap_config lcc_msm8960_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0xfc,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc lcc_msm8960_desc = {
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 1e703fda8a0f..30777f9f1a43 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -3368,7 +3368,6 @@ static const struct regmap_config mmcc_apq8084_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x5104,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc mmcc_apq8084_desc = {
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index d73a048d3b9d..00e36192a1de 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -3029,7 +3029,6 @@ static const struct regmap_config mmcc_msm8960_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x334,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct regmap_config mmcc_apq8064_regmap_config = {
@@ -3038,7 +3037,6 @@ static const struct regmap_config mmcc_apq8064_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x350,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc mmcc_msm8960_desc = {
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index bbe28ed93669..9d790bcadf25 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2594,7 +2594,6 @@ static const struct regmap_config mmcc_msm8974_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x5104,
 	.fast_io	= true,
-	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc mmcc_msm8974_desc = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
