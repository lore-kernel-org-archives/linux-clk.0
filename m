Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stanimir.varbanov@linaro.org,
	vivek.gautam@codeaurora.org,
	architt@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/3] clk: qcom: gdsc: Add support for ALWAYS_ON gdscs
Date: Thu, 12 Oct 2017 12:28:47 +0530
Message-Id: <1507791529-24353-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
References: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some GDSCs might have software control to turn them off, but we might
want to keep them enabled always, in some cases because of lack of
support in kernel to handle a graceful turning off/on of such GDSCs.
Most common instances would be the GDCSs which power up the noc/bus
fabrics, which need bus drivers to handle them and atleast support for
which is missing on all qcom SoCs.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 8 ++++++++
 drivers/clk/qcom/gdsc.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index a4f3580..15f4bb5 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -291,6 +291,14 @@ static int gdsc_init(struct gdsc *sc)
 	if ((sc->flags & VOTABLE) && on)
 		gdsc_enable(&sc->pd);
 
+	/* If ALWAYS_ON GDSCs are not ON, turn them ON */
+	if (sc->flags & ALWAYS_ON) {
+		if (!on)
+			gdsc_enable(&sc->pd);
+		on = true;
+		sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
+	}
+
 	if (on || (sc->pwrsts & PWRSTS_RET))
 		gdsc_force_mem_on(sc);
 	else
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 3964834..7fd78ce 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -53,6 +53,7 @@ struct gdsc {
 #define VOTABLE		BIT(0)
 #define CLAMP_IO	BIT(1)
 #define HW_CTRL		BIT(2)
+#define ALWAYS_ON	BIT(3)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
