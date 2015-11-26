Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/6] clk: qcom: gdsc: Add support for gdscs with gds hw controller
Date: Thu, 26 Nov 2015 11:24:53 +0530
Message-Id: <1448517297-32419-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some gdsc power domains can have a gds_hw_controller block inside
to help ensure all slave devices within the power domain are idle
before the gdsc is actually switched off.
This is mainly useful in power domains which host a MMU, in which
case its necessary to make sure there are no outstanding MMU operations
or pending bus transactions before the power domain is turned off.

In gdscs with gds_hw_controller block, its necessary to check the
gds_hw_ctrl status bits instead of the ones in gdscr, to determine
the state of the powerdomain.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 38 ++++++++++++++++++++++----------------
 drivers/clk/qcom/gdsc.h |  2 ++
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index a164c38..fb2e43c 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -42,12 +42,12 @@
 
 #define domain_to_gdsc(domain) container_of(domain, struct gdsc, pd)
 
-static int gdsc_is_enabled(struct gdsc *sc)
+static int gdsc_is_enabled(struct gdsc *sc, unsigned int reg)
 {
 	u32 val;
 	int ret;
 
-	ret = regmap_read(sc->regmap, sc->gdscr, &val);
+	ret = regmap_read(sc->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -58,30 +58,34 @@ static int gdsc_toggle_logic(struct gdsc *sc, bool en)
 {
 	int ret;
 	u32 val = en ? 0 : SW_COLLAPSE_MASK;
-	u32 check = en ? PWR_ON_MASK : 0;
 	unsigned long timeout;
+	unsigned int status_reg = sc->gdscr;
 
 	ret = regmap_update_bits(sc->regmap, sc->gdscr, SW_COLLAPSE_MASK, val);
 	if (ret)
 		return ret;
 
 	timeout = jiffies + usecs_to_jiffies(TIMEOUT_US);
-	do {
-		ret = regmap_read(sc->regmap, sc->gdscr, &val);
-		if (ret)
-			return ret;
 
-		if ((val & PWR_ON_MASK) == check)
+	if (sc->gds_hw_ctrl) {
+		status_reg = sc->gds_hw_ctrl;
+	/*
+	 * The gds hw controller asserts/de-asserts the status bit soon
+	 * after it receives a power on/off request from a master.
+	 * The controller then takes around 8 xo cycles to start its internal
+	 * state machine and update the status bit. During this time, the
+	 * status bit does not reflect the true status of the core.
+	 * Add a delay of 1 us between writing to the SW_COLLAPSE bit and
+	 * polling the status bit
+	 */
+		udelay(1);
+	}
+
+	do {
+		if (gdsc_is_enabled(sc, status_reg) == en)
 			return 0;
 	} while (time_before(jiffies, timeout));
 
-	ret = regmap_read(sc->regmap, sc->gdscr, &val);
-	if (ret)
-		return ret;
-
-	if ((val & PWR_ON_MASK) == check)
-		return 0;
-
 	return -ETIMEDOUT;
 }
 
@@ -165,6 +169,7 @@ static int gdsc_init(struct gdsc *sc)
 {
 	u32 mask, val;
 	int on, ret;
+	unsigned int reg;
 
 	/*
 	 * Disable HW trigger: collapse/restore occur based on registers writes.
@@ -185,7 +190,8 @@ static int gdsc_init(struct gdsc *sc)
 			return ret;
 	}
 
-	on = gdsc_is_enabled(sc);
+	reg = sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
+	on = gdsc_is_enabled(sc, reg);
 	if (on < 0)
 		return on;
 
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 4e9dfc1..66a43be 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -32,6 +32,7 @@ struct reset_controller_dev;
  * @pd: generic power domain
  * @regmap: regmap for MMIO accesses
  * @gdscr: gsdc control register
+ * @gds_hw_ctrl: gds_hw_ctrl register
  * @cxcs: offsets of branch registers to toggle mem/periph bits in
  * @cxc_count: number of @cxcs
  * @pwrsts: Possible powerdomain power states
@@ -44,6 +45,7 @@ struct gdsc {
 	struct generic_pm_domain	*parent;
 	struct regmap			*regmap;
 	unsigned int			gdscr;
+	unsigned int			gds_hw_ctrl;
 	unsigned int			*cxcs;
 	unsigned int			cxc_count;
 	const u8			pwrsts;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
