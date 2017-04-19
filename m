Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/5 v2] clk: qcom: Implement RPM clocks for MSM8660/APQ8060
Date: Wed, 19 Apr 2017 11:13:24 +0200
Message-Id: <20170419091326.11226-3-linus.walleij@linaro.org>
In-Reply-To: <20170419091326.11226-1-linus.walleij@linaro.org>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The RPM clocks were missing for MSM8660/APQ8060. For this to be
completed we need to add a special fixed rate RPM clock that is used
for the PLL4 on these SoCs. The rest of the clocks are pretty
similar to the other supported platforms.

The "active" clock pattern is mirrored in all the clocks. I guess
that the PLL4 that clocks the LPASS is actually never used as
"active only" since the low-power audio subsystem should be left
on when the system suspends, so it can be used as a stand-alone
MP3 player type of device.

As we do not have firmware for the LPASS we will probably only use
this clock when the system is up and running (not suspended) for now,
so that will be using the "active" clock.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add the small hunk to the clk_rpm_handoff() function that just
  skip over this for the fixed PLL4 clock. This accidentally
  ended up in another patch.
---
 drivers/clk/qcom/clk-rpm.c | 106 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index df3e5fe8442a..61c67e93bea3 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -56,6 +56,30 @@
 		},							      \
 	}
 
+#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)	      \
+	static struct clk_rpm _platform##_##_name = {			      \
+		.rpm_clk_id = (r_id),					      \
+		.rate = (r),						      \
+		.hw.init = &(struct clk_init_data){			      \
+			.ops = &clk_rpm_fixed_ops,			      \
+			.name = #_name,					      \
+			.parent_names = (const char *[]){ "pxo_board" },      \
+			.num_parents = 1,				      \
+		},							      \
+	};								      \
+	static struct clk_rpm _platform##_##_active = {			      \
+		.rpm_clk_id = (r_id),					      \
+		.peer = &_platform##_##_name,				      \
+		.active_only = true,					      \
+		.rate = (r),						      \
+		.hw.init = &(struct clk_init_data){			      \
+			.ops = &clk_rpm_fixed_ops,			      \
+			.name = #_active,				      \
+			.parent_names = (const char *[]){ "pxo_board" },      \
+			.num_parents = 1,				      \
+		},							      \
+	}
+
 #define DEFINE_CLK_RPM_PXO_BRANCH(_platform, _name, _active, r_id, r)	      \
 	static struct clk_rpm _platform##_##_active;			      \
 	static struct clk_rpm _platform##_##_name = {			      \
@@ -143,6 +167,13 @@ static int clk_rpm_handoff(struct clk_rpm *r)
 	int ret;
 	u32 value = INT_MAX;
 
+	/*
+	 * The vendor tree simply reads the status for this
+	 * RPM clock.
+	 */
+	if (r->rpm_clk_id == QCOM_RPM_PLL_4)
+		return 0;
+
 	ret = qcom_rpm_write(r->rpm, QCOM_RPM_ACTIVE_STATE,
 			     r->rpm_clk_id, &value, 1);
 	if (ret)
@@ -269,6 +300,32 @@ static void clk_rpm_unprepare(struct clk_hw *hw)
 	mutex_unlock(&rpm_clk_lock);
 }
 
+static int clk_rpm_fixed_prepare(struct clk_hw *hw)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+	u32 value = 1;
+	int ret;
+
+	ret = qcom_rpm_write(r->rpm, QCOM_RPM_ACTIVE_STATE,
+			     r->rpm_clk_id, &value, 1);
+	if (!ret)
+		r->enabled = true;
+
+	return ret;
+}
+
+static void clk_rpm_fixed_unprepare(struct clk_hw *hw)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+	u32 value = 0;
+	int ret;
+
+	ret = qcom_rpm_write(r->rpm, QCOM_RPM_ACTIVE_STATE,
+			     r->rpm_clk_id, &value, 1);
+	if (!ret)
+		r->enabled = false;
+}
+
 static int clk_rpm_set_rate(struct clk_hw *hw,
 			    unsigned long rate, unsigned long parent_rate)
 {
@@ -333,6 +390,13 @@ static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
 	return r->rate;
 }
 
+static const struct clk_ops clk_rpm_fixed_ops = {
+	.prepare	= clk_rpm_fixed_prepare,
+	.unprepare	= clk_rpm_fixed_unprepare,
+	.round_rate	= clk_rpm_round_rate,
+	.recalc_rate	= clk_rpm_recalc_rate,
+};
+
 static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
@@ -348,6 +412,46 @@ static const struct clk_ops clk_rpm_branch_ops = {
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
+/* MSM8660/APQ8060 */
+DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
+DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
+DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
+DEFINE_CLK_RPM(msm8660, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
+DEFINE_CLK_RPM(msm8660, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
+DEFINE_CLK_RPM(msm8660, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
+DEFINE_CLK_RPM(msm8660, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
+DEFINE_CLK_RPM(msm8660, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
+DEFINE_CLK_RPM(msm8660, smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
+DEFINE_CLK_RPM(msm8660, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
+
+static struct clk_rpm *msm8660_clks[] = {
+	[RPM_PLL4_CLK] = &msm8660_pll4_clk,
+	[RPM_PLL4_A_CLK] = &msm8660_pll4_a_clk,
+	[RPM_APPS_FABRIC_CLK] = &msm8660_afab_clk,
+	[RPM_APPS_FABRIC_A_CLK] = &msm8660_afab_a_clk,
+	[RPM_SYS_FABRIC_CLK] = &msm8660_sfab_clk,
+	[RPM_SYS_FABRIC_A_CLK] = &msm8660_sfab_a_clk,
+	[RPM_MM_FABRIC_CLK] = &msm8660_mmfab_clk,
+	[RPM_MM_FABRIC_A_CLK] = &msm8660_mmfab_a_clk,
+	[RPM_DAYTONA_FABRIC_CLK] = &msm8660_daytona_clk,
+	[RPM_DAYTONA_FABRIC_A_CLK] = &msm8660_daytona_a_clk,
+	[RPM_SFPB_CLK] = &msm8660_sfpb_clk,
+	[RPM_SFPB_A_CLK] = &msm8660_sfpb_a_clk,
+	[RPM_CFPB_CLK] = &msm8660_cfpb_clk,
+	[RPM_CFPB_A_CLK] = &msm8660_cfpb_a_clk,
+	[RPM_MMFPB_CLK] = &msm8660_mmfpb_clk,
+	[RPM_MMFPB_A_CLK] = &msm8660_mmfpb_a_clk,
+	[RPM_SMI_CLK] = &msm8660_smi_clk,
+	[RPM_SMI_A_CLK] = &msm8660_smi_a_clk,
+	[RPM_EBI1_CLK] = &msm8660_ebi1_clk,
+	[RPM_EBI1_A_CLK] = &msm8660_ebi1_a_clk,
+};
+
+static const struct rpm_clk_desc rpm_clk_msm8660 = {
+	.clks = msm8660_clks,
+	.num_clks = ARRAY_SIZE(msm8660_clks),
+};
+
 /* apq8064 */
 DEFINE_CLK_RPM(apq8064, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
 DEFINE_CLK_RPM(apq8064, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
@@ -386,6 +490,8 @@ static const struct rpm_clk_desc rpm_clk_apq8064 = {
 };
 
 static const struct of_device_id rpm_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-msm8660", .data = &rpm_clk_msm8660 },
+	{ .compatible = "qcom,rpmcc-apq8060", .data = &rpm_clk_msm8660 },
 	{ .compatible = "qcom,rpmcc-apq8064", .data = &rpm_clk_apq8064 },
 	{ }
 };
-- 
2.9.3
