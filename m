Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/2] clk: qcom: gdsc: Add support for gdscs with RETENTION power state
Date: Tue, 16 Aug 2016 12:56:30 +0530
Message-Id: <1471332390-6590-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some gdscs can support an intermediate RETENTION state apart from
the ON and OFF states. The RETENTION state can further be configured
to either retain all memory, or just some part of it (periperal or
core).
This patch adds support so gdscs can support the additional RET state
which the client drivers can then choose based on acceptable
latency.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 81 ++++++++++++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/gdsc.h | 22 +++++++++-----
 2 files changed, 85 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index f12d7b2..e0859df 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -38,6 +38,7 @@
 
 #define RETAIN_MEM		BIT(14)
 #define RETAIN_PERIPH		BIT(13)
+#define OFF_PERIPH		BIT(12)
 
 #define TIMEOUT_US		100
 
@@ -122,24 +123,56 @@ static inline int gdsc_assert_reset(struct gdsc *sc)
 	return 0;
 }
 
-static inline void gdsc_force_mem_on(struct gdsc *sc)
+static inline void gdsc_force_mem_core_on(struct gdsc *sc)
 {
 	int i;
-	u32 mask = RETAIN_MEM | RETAIN_PERIPH;
+	u32 mask = RETAIN_MEM;
 
 	for (i = 0; i < sc->cxc_count; i++)
 		regmap_update_bits(sc->regmap, sc->cxcs[i], mask, mask);
 }
 
-static inline void gdsc_clear_mem_on(struct gdsc *sc)
+static inline void gdsc_force_mem_periph_on(struct gdsc *sc)
 {
 	int i;
-	u32 mask = RETAIN_MEM | RETAIN_PERIPH;
+	u32 mask = RETAIN_PERIPH | OFF_PERIPH;
+	u32 val = RETAIN_PERIPH;
+
+	for (i = 0; i < sc->cxc_count; i++)
+		regmap_update_bits(sc->regmap, sc->cxcs[i], mask, val);
+}
+
+static inline void gdsc_force_mem_on(struct gdsc *sc)
+{
+	gdsc_force_mem_core_on(sc);
+	gdsc_force_mem_periph_on(sc);
+}
+
+static inline void gdsc_clear_mem_core_on(struct gdsc *sc)
+{
+	int i;
+	u32 mask = RETAIN_MEM;
 
 	for (i = 0; i < sc->cxc_count; i++)
 		regmap_update_bits(sc->regmap, sc->cxcs[i], mask, 0);
 }
 
+static inline void gdsc_clear_mem_periph_on(struct gdsc *sc)
+{
+	int i;
+	u32 mask = RETAIN_PERIPH | OFF_PERIPH;
+	u32 val = OFF_PERIPH;
+
+	for (i = 0; i < sc->cxc_count; i++)
+		regmap_update_bits(sc->regmap, sc->cxcs[i], mask, val);
+}
+
+static inline void gdsc_clear_mem_on(struct gdsc *sc)
+{
+	gdsc_clear_mem_core_on(sc);
+	gdsc_clear_mem_periph_on(sc);
+}
+
 static int gdsc_enable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
@@ -152,8 +185,7 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	if (ret)
 		return ret;
 
-	if (sc->pwrsts & PWRSTS_OFF)
-		gdsc_force_mem_on(sc);
+	gdsc_force_mem_on(sc);
 
 	/*
 	 * If clocks to this power domain were already on, they will take an
@@ -170,12 +202,35 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 static int gdsc_disable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
+	u8 pwrst;
 
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
-	if (sc->pwrsts & PWRSTS_OFF)
+	if (domain->state_count > 1)
+		pwrst = 1 << domain->state_idx;
+	else if (sc->pwrsts & PWRSTS_OFF)
+		pwrst = PWRSTS_OFF;
+	else
+		pwrst = PWRSTS_RET;
+
+	switch (pwrst) {
+	case PWRSTS_OFF:
 		gdsc_clear_mem_on(sc);
+		break;
+	case PWRSTS_RET:
+		if (sc->pwrsts_ret == PWRSTS_RET_ALL)
+			gdsc_force_mem_on(sc);
+		else if (sc->pwrsts_ret == PWRSTS_RET_MEM)
+			gdsc_force_mem_core_on(sc);
+		else if (sc->pwrsts_ret == PWRSTS_RET_PERIPH)
+			gdsc_force_mem_periph_on(sc);
+		else
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	};
 
 	return gdsc_toggle_logic(sc, false);
 }
@@ -198,6 +253,9 @@ static int gdsc_init(struct gdsc *sc)
 	if (ret)
 		return ret;
 
+	if (!sc->pwrsts)
+		return -EINVAL;
+
 	/* Force gdsc ON if only ON state is supported */
 	if (sc->pwrsts == PWRSTS_ON) {
 		ret = gdsc_toggle_logic(sc, true);
@@ -217,14 +275,15 @@ static int gdsc_init(struct gdsc *sc)
 	if ((sc->flags & VOTABLE) && on)
 		gdsc_enable(&sc->pd);
 
-	if (on || (sc->pwrsts & PWRSTS_RET))
+	if (on)
 		gdsc_force_mem_on(sc);
-	else
-		gdsc_clear_mem_on(sc);
 
 	sc->pd.power_off = gdsc_disable;
 	sc->pd.power_on = gdsc_enable;
-	pm_genpd_init(&sc->pd, NULL, !on);
+	if (sc->pd.state_count)
+		pm_genpd_init(&sc->pd, &simple_qos_governor, !on);
+	else
+		pm_genpd_init(&sc->pd, NULL, !on);
 
 	return 0;
 }
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 3bf497c..0032c96 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -41,15 +41,23 @@ struct gdsc {
 	unsigned int			gds_hw_ctrl;
 	unsigned int			*cxcs;
 	unsigned int			cxc_count;
+/* supported options for pwrsts */
+#define PWRSTS_RET			BIT(0)
+#define PWRSTS_OFF			BIT(1)
+#define PWRSTS_ON			BIT(2)
+#define PWRSTS_MAX			3
+#define PWRSTS_OFF_ON			(PWRSTS_OFF | PWRSTS_ON)
+#define PWRSTS_RET_ON			(PWRSTS_RET | PWRSTS_ON)
+#define PWRSTS_OFF_RET_ON		(PWRSTS_OFF | PWRSTS_RET | PWRSTS_ON)
 	const u8			pwrsts;
-/* Powerdomain allowable state bitfields */
-#define PWRSTS_OFF		BIT(0)
-#define PWRSTS_RET		BIT(1)
-#define PWRSTS_ON		BIT(2)
-#define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
-#define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
+/* supported options for pwrsts_ret */
+#define PWRSTS_RET_ALL			0 /* default retains all */
+#define PWRSTS_RET_MEM			BIT(0)
+#define PWRSTS_RET_PERIPH		BIT(1)
+	const u8			pwrsts_ret;
+/* supported flags */
+#define VOTABLE				BIT(0)
 	const u8			flags;
-#define VOTABLE		BIT(0)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
