Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Simon Arlott <simon@fire.lp0.eu>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] clk: qcom: Specify LE device endianness
Date: Mon,  9 Nov 2015 14:30:54 -0800
Message-Id: <1447108254-19864-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

All these clock controllers are little endian devices, but so far
we've been relying on the regmap mmio bus handling this for us
without explicitly stating that fact. After commit 4a98da2164cf
(regmap-mmio: Use native endianness for read/write, 2015-10-29),
the regmap mmio bus will read/write with the __raw_*() IO
accessors, instead of using the readl/writel() APIs that do
proper byte swapping for little endian devices.

So if we're running on a big endian processor and haven't
specified the endianness explicitly in the regmap config or in
DT, we're going to switch from doing little endian byte swapping
to big endian accesses without byte swapping, leading to some
confusing results. On my apq8074 dragonboard, this causes the
device to fail to boot as we access the clock controller with
big endian IO accesses even though the device is little endian.

Specify the endianness explicitly so that the regmap core
properly byte swaps the accesses for us.

Reported-by: Kevin Hilman <khilman@linaro.org>
Cc: Simon Arlott <simon@fire.lp0.eu>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

FYI, the regmap patch also converts the I/O accessors to use
"relaxed" accessors that don't have any barrier semantics. So we've
opened up the possibility of reads and writes overlapping each other
whereas before that would be handled by the barriers buried in
readl/writel, etc. I haven't yet fully examined the qcom clk driver
for this problem, but I'm fairly certain we'll need to add some
barriers in the driver to handle this. Alternatively we could add
explicit barriers.

 drivers/clk/qcom/gcc-apq8084.c  | 1 +
 drivers/clk/qcom/gcc-ipq806x.c  | 1 +
 drivers/clk/qcom/gcc-msm8660.c  | 1 +
 drivers/clk/qcom/gcc-msm8916.c  | 1 +
 drivers/clk/qcom/gcc-msm8960.c  | 2 ++
 drivers/clk/qcom/gcc-msm8974.c  | 1 +
 drivers/clk/qcom/lcc-ipq806x.c  | 1 +
 drivers/clk/qcom/lcc-msm8960.c  | 1 +
 drivers/clk/qcom/mmcc-apq8084.c | 1 +
 drivers/clk/qcom/mmcc-msm8960.c | 2 ++
 drivers/clk/qcom/mmcc-msm8974.c | 1 +
 11 files changed, 13 insertions(+)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index 1567c3a79534..c296f61cf216 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -3587,6 +3587,7 @@ static const struct regmap_config gcc_apq8084_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x1fc0,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_apq8084_desc = {
diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index c43d865cfc59..65c7a02a57ed 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -3002,6 +3002,7 @@ static const struct regmap_config gcc_ipq806x_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x3e40,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_ipq806x_desc = {
diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index f110bb5a1df3..7220163af68e 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -2702,6 +2702,7 @@ static const struct regmap_config gcc_msm8660_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x363c,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_msm8660_desc = {
diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index d0a0313d6bef..998f773d9ad9 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -3336,6 +3336,7 @@ static const struct regmap_config gcc_msm8916_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x80000,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_msm8916_desc = {
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 66c18bc97857..620db1b61cd5 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3468,6 +3468,7 @@ static const struct regmap_config gcc_msm8960_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x3660,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct regmap_config gcc_apq8064_regmap_config = {
@@ -3476,6 +3477,7 @@ static const struct regmap_config gcc_apq8064_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x3880,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_msm8960_desc = {
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 28abb8f8f293..126a94401596 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -2680,6 +2680,7 @@ static const struct regmap_config gcc_msm8974_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x1fc0,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc gcc_msm8974_desc = {
diff --git a/drivers/clk/qcom/lcc-ipq806x.c b/drivers/clk/qcom/lcc-ipq806x.c
index db3998e5e2d8..62e79fadd5f7 100644
--- a/drivers/clk/qcom/lcc-ipq806x.c
+++ b/drivers/clk/qcom/lcc-ipq806x.c
@@ -419,6 +419,7 @@ static const struct regmap_config lcc_ipq806x_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0xfc,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc lcc_ipq806x_desc = {
diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index 4fcf9d1d233c..bf95bb0ea1b8 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -524,6 +524,7 @@ static const struct regmap_config lcc_msm8960_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0xfc,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc lcc_msm8960_desc = {
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 30777f9f1a43..1e703fda8a0f 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -3368,6 +3368,7 @@ static const struct regmap_config mmcc_apq8084_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x5104,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc mmcc_apq8084_desc = {
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 00e36192a1de..d73a048d3b9d 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -3029,6 +3029,7 @@ static const struct regmap_config mmcc_msm8960_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x334,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct regmap_config mmcc_apq8064_regmap_config = {
@@ -3037,6 +3038,7 @@ static const struct regmap_config mmcc_apq8064_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x350,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc mmcc_msm8960_desc = {
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 9d790bcadf25..bbe28ed93669 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2594,6 +2594,7 @@ static const struct regmap_config mmcc_msm8974_regmap_config = {
 	.val_bits	= 32,
 	.max_register	= 0x5104,
 	.fast_io	= true,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
 static const struct qcom_cc_desc mmcc_msm8974_desc = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
