Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org,
	stanimir.varbanov@linaro.org
Cc: sricharan@codeaurora.org
Subject: [PATCH 1/2] clk: qcom: gdsc: Add support for gdscs with HW control
Date: Fri, 18 Nov 2016 17:39:28 +0530
Message-Id: <1479470969-15976-2-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1479470969-15976-1-git-send-email-sricharan@codeaurora.org>
References: <1479470969-15976-1-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

From: Rajendra Nayak <rnayak@codeaurora.org>

Some GDSCs might support a HW control mode, where in the power
domain (gdsc) is brought in and out of low power state (while
unsued) without any SW assistance, saving power.
Such GDSCs can be configured in a HW control mode when powered on
until they are explicitly requested to be powered off by software.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
[V2] Fixed to take care of the return value of gdsc_hwctrl

 drivers/clk/qcom/gdsc.c | 19 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index f12d7b2..57c7c1b 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -55,6 +55,13 @@ static int gdsc_is_enabled(struct gdsc *sc, unsigned int reg)
 	return !!(val & PWR_ON_MASK);
 }
 
+static int gdsc_hwctrl(struct gdsc *sc, bool en)
+{
+	u32 val = en ? HW_CONTROL_MASK : 0;
+
+	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
+}
+
 static int gdsc_toggle_logic(struct gdsc *sc, bool en)
 {
 	int ret;
@@ -164,16 +171,28 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	 */
 	udelay(1);
 
+	/* Turn on HW trigger mode if supported */
+	if (sc->flags & HW_CTRL)
+		return gdsc_hwctrl(sc, true);
+
 	return 0;
 }
 
 static int gdsc_disable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
+	int ret;
 
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
+	/* Turn off HW trigger mode if supported */
+	if (sc->flags & HW_CTRL) {
+		ret = gdsc_hwctrl(sc, false);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (sc->pwrsts & PWRSTS_OFF)
 		gdsc_clear_mem_on(sc);
 
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 3bf497c..b1f30f8 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -50,6 +50,7 @@ struct gdsc {
 #define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
 	const u8			flags;
 #define VOTABLE		BIT(0)
+#define HW_CTRL		BIT(1)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
