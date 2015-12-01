Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 3/6] clk: qcom: gdsc: Add support for votable gdscs
Date: Tue,  1 Dec 2015 21:42:13 +0530
Message-Id: <1448986336-16846-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
References: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some gdscs might be controlled via voting registers and might not
really disable when the kernel intends to disable them (due to other
votes keeping them enabled)
Mark these gdscs with a flag for we do not check/wait on a disable
status for these gdscs within the kernel disable callback.

Also at boot, if these GDSCs are found to be ON, we make sure we
vote for them before we inform the genpd framework about their
status. If genpd gets no users, it then disables (removes the vote)
them as part of genpd_poweroff_unused()

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 18 ++++++++++++++++++
 drivers/clk/qcom/gdsc.h | 15 ++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 9f530b7..f12d7b2 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -66,6 +66,17 @@ static int gdsc_toggle_logic(struct gdsc *sc, bool en)
 	if (ret)
 		return ret;
 
+	/* If disabling votable gdscs, don't poll on status */
+	if ((sc->flags & VOTABLE) && !en) {
+		/*
+		 * Add a short delay here to ensure that an enable
+		 * right after it was disabled does not put it in an
+		 * unknown state
+		 */
+		udelay(TIMEOUT_US);
+		return 0;
+	}
+
 	if (sc->gds_hw_ctrl) {
 		status_reg = sc->gds_hw_ctrl;
 		/*
@@ -199,6 +210,13 @@ static int gdsc_init(struct gdsc *sc)
 	if (on < 0)
 		return on;
 
+	/*
+	 * Votable GDSCs can be ON due to Vote from other masters.
+	 * If a Votable GDSC is ON, make sure we have a Vote.
+	 */
+	if ((sc->flags & VOTABLE) && on)
+		gdsc_enable(&sc->pd);
+
 	if (on || (sc->pwrsts & PWRSTS_RET))
 		gdsc_force_mem_on(sc);
 	else
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 66a43be..3bf497c 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -20,13 +20,6 @@
 struct regmap;
 struct reset_controller_dev;
 
-/* Powerdomain allowable state bitfields */
-#define PWRSTS_OFF		BIT(0)
-#define PWRSTS_RET		BIT(1)
-#define PWRSTS_ON		BIT(2)
-#define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
-#define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
-
 /**
  * struct gdsc - Globally Distributed Switch Controller
  * @pd: generic power domain
@@ -49,6 +42,14 @@ struct gdsc {
 	unsigned int			*cxcs;
 	unsigned int			cxc_count;
 	const u8			pwrsts;
+/* Powerdomain allowable state bitfields */
+#define PWRSTS_OFF		BIT(0)
+#define PWRSTS_RET		BIT(1)
+#define PWRSTS_ON		BIT(2)
+#define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
+#define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
+	const u8			flags;
+#define VOTABLE		BIT(0)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
