Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stanimir.varbanov@linaro.org,
	sricharan@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] clk: qcom: gdsc: Fix handling of hw control enable/disable
Date: Tue, 10 Jan 2017 11:24:39 +0530
Message-Id: <1484027679-18397-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Once a gdsc is brought in and out of HW control, there is a
power down and up cycle which can take upto 1us. Polling on
the gdsc status immediately after the hw control enable/disable
can mislead software/firmware to belive the gdsc is already either on
or off, while its yet to complete the power cycle.
To avoid this add a 1us delay post a enable/disable of HW control
mode.

Also after the HW control mode is disabled, poll on the status to
check gdsc status reflects its 'on' before force disabling it
in software.

Reported-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---

Stan,
If there was a specific issue you saw with venus because of the missing
delay and poll, can you check if this fixes any of that.

 drivers/clk/qcom/gdsc.c | 58 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 288186c..6fbd6df 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -63,11 +63,26 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
 	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
 }
 
+static int gdsc_poll_status(struct gdsc *sc, unsigned int reg, bool val)
+{
+	ktime_t start;
+
+	start = ktime_get();
+	do {
+		if (gdsc_is_enabled(sc, reg) == val)
+			return 0;
+	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
+
+	if (gdsc_is_enabled(sc, reg) == val)
+		return 0;
+
+	return -ETIMEDOUT;
+}
+
 static int gdsc_toggle_logic(struct gdsc *sc, bool en)
 {
 	int ret;
 	u32 val = en ? 0 : SW_COLLAPSE_MASK;
-	ktime_t start;
 	unsigned int status_reg = sc->gdscr;
 
 	ret = regmap_update_bits(sc->regmap, sc->gdscr, SW_COLLAPSE_MASK, val);
@@ -100,16 +115,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, bool en)
 		udelay(1);
 	}
 
-	start = ktime_get();
-	do {
-		if (gdsc_is_enabled(sc, status_reg) == en)
-			return 0;
-	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
-
-	if (gdsc_is_enabled(sc, status_reg) == en)
-		return 0;
-
-	return -ETIMEDOUT;
+	return gdsc_poll_status(sc, status_reg, en);
 }
 
 static inline int gdsc_deassert_reset(struct gdsc *sc)
@@ -188,8 +194,19 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	udelay(1);
 
 	/* Turn on HW trigger mode if supported */
-	if (sc->flags & HW_CTRL)
-		return gdsc_hwctrl(sc, true);
+	if (sc->flags & HW_CTRL) {
+		ret = gdsc_hwctrl(sc, true);
+		/*
+		 * Wait for the GDSC to go through a power down and
+		 * up cycle.  In case a firmware ends up polling status
+		 * bits for the gdsc, it might read an 'on' status before
+		 * the GDSC can finish the power cycle.
+		 * We wait 1us before returning to ensure the firmware
+		 * can't immediately poll the status bits.
+		 */
+		mb();
+		udelay(1);
+	}
 
 	return 0;
 }
@@ -204,9 +221,24 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 
 	/* Turn off HW trigger mode if supported */
 	if (sc->flags & HW_CTRL) {
+		unsigned int reg;
+
 		ret = gdsc_hwctrl(sc, false);
 		if (ret < 0)
 			return ret;
+		/*
+		 * Wait for the GDSC to go through a power down and
+		 * up cycle.  In case we end up polling status
+		 * bits for the gdsc before the power cycle is completed
+		 * it might read an 'on' status wrongly.
+		 */
+		mb();
+		udelay(1);
+
+		reg = sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
+		ret = gdsc_poll_status(sc, reg, 0);
+		if (ret)
+			return ret;
 	}
 
 	if (sc->pwrsts & PWRSTS_OFF)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
