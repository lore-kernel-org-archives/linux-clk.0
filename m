Return-Path: <anischal@codeaurora.org>
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Nischal <anischal@codeaurora.org>
Subject: [PATCH 1/4] clk: qcom: gdsc: Add support to enable/disable the clocks with GDSC
Date: Wed,  6 Jun 2018 17:11:45 +0530
Message-Id: <1528285308-25477-2-git-send-email-anischal@codeaurora.org>
In-Reply-To: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

For some of the GDSCs, there is a requirement to enable/disable the
few clocks before turning on/off the gdsc power domain. Add support
for the same by specifying a list of clk_hw pointers per gdsc and
enable/disable them along with power domain on/off callbacks.

Signed-off-by: Amit Nischal <anischal@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  5 +++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index a077133..b6adca1 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -12,6 +12,8 @@
  */

 #include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/jiffies.h>
@@ -208,11 +210,41 @@ static inline void gdsc_assert_reset_aon(struct gdsc *sc)
 	regmap_update_bits(sc->regmap, sc->clamp_io_ctrl,
 			   GMEM_RESET_MASK, 0);
 }
+
+static int gdsc_clk_prepare_enable(struct gdsc *sc)
+{
+	int i, ret;
+
+	for (i = 0; i < sc->clk_count; i++) {
+		ret = clk_prepare_enable(sc->clk_hws[i]->clk);
+		if (ret) {
+			for (i--; i >= 0; i--)
+				clk_disable_unprepare(sc->clk_hws[i]->clk);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static void gdsc_clk_disable_unprepare(struct gdsc *sc)
+{
+	int i;
+
+	for (i = 0; i < sc->clk_count; i++)
+		clk_disable_unprepare(sc->clk_hws[i]->clk);
+}
+
 static int gdsc_enable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;

+	if (sc->clk_count) {
+		ret = gdsc_clk_prepare_enable(sc);
+		if (ret)
+			return ret;
+	}
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_deassert_reset(sc);

@@ -260,6 +292,9 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 		udelay(1);
 	}

+	if (sc->clk_count)
+		gdsc_clk_disable_unprepare(sc);
+
 	return 0;
 }

@@ -268,6 +303,12 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;

+	if (sc->clk_count) {
+		ret = gdsc_clk_prepare_enable(sc);
+		if (ret)
+			return ret;
+	}
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);

@@ -299,6 +340,9 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	if (sc->flags & CLAMP_IO)
 		gdsc_assert_clamp_io(sc);

+	if (sc->clk_count)
+		gdsc_clk_disable_unprepare(sc);
+
 	return 0;
 }

diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index bd1f2c7..59957d7 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/pm_domain.h>

+struct clk_hw;
 struct regmap;
 struct reset_controller_dev;

@@ -32,6 +33,8 @@
  * @resets: ids of resets associated with this gdsc
  * @reset_count: number of @resets
  * @rcdev: reset controller
+ * @clk_count: number of associated clocks
+ * @clk_hws: clk_hw pointers for associated clocks with gdsc
  */
 struct gdsc {
 	struct generic_pm_domain	pd;
@@ -60,6 +63,8 @@ struct gdsc {
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
+	unsigned int			clk_count;
+	struct clk_hw			*clk_hws[];
 };

 struct gdsc_desc {
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
