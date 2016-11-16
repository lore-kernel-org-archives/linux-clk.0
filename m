Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:48836 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932711AbcKPQDC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2016 11:03:02 -0500
From: Ritesh Harjani <riteshh@codeaurora.org>
To: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, sboyd@codeaurora.org,
        andy.gross@linaro.org
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, david.brown@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        david.griego@linaro.org, stummala@codeaurora.org,
        venkatg@codeaurora.org, rnayak@codeaurora.org,
        pramod.gurav@linaro.org, jeremymc@redhat.com,
        Ritesh Harjani <riteshh@codeaurora.org>
Subject: [PATCH v8 10/16] mmc: sdhci-msm: Implement set_clock callback for sdhci-msm
Date: Wed, 16 Nov 2016 21:30:46 +0530
Message-Id: <1479312052-22396-11-git-send-email-riteshh@codeaurora.org>
In-Reply-To: <1479312052-22396-1-git-send-email-riteshh@codeaurora.org>
References: <1479312052-22396-1-git-send-email-riteshh@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

sdhci-msm controller may have different clk-rates for each
bus speed mode. Thus implement set_clock callback for
sdhci-msm driver.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-msm.c | 66 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 45ead68..6d02fc2 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -84,6 +84,7 @@ struct sdhci_msm_host {
 	struct clk *pclk;	/* SDHC peripheral bus clock */
 	struct clk *bus_clk;	/* SDHC bus voter clock */
 	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
+	unsigned long clk_rate;
 	struct mmc_host *mmc;
 	bool use_14lpp_dll_reset;
 };
@@ -571,6 +572,69 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
 	return SDHCI_MSM_MIN_CLOCK;
 }
 
+/**
+ * __sdhci_msm_set_clock - sdhci_msm clock control.
+ *
+ * Description:
+ * MSM controller does not use internal divider and
+ * instead directly control the GCC clock as per
+ * HW recommendation.
+ **/
+void __sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
+{
+	u16 clk;
+	/*
+	 * Keep actual_clock as zero -
+	 * - since there is no divider used so no need of having actual_clock.
+	 * - MSM controller uses SDCLK for data timeout calculation. If
+	 *   actual_clock is zero, host->clock is taken for calculation.
+	 */
+	host->mmc->actual_clock = 0;
+
+	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
+
+	if (clock == 0)
+		return;
+
+	/*
+	 * MSM controller do not use clock divider.
+	 * Thus read SDHCI_CLOCK_CONTROL and only enable
+	 * clock with no divider value programmed.
+	 */
+	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
+	sdhci_enable_clock(host, clk);
+}
+
+/* sdhci_msm_set_clock - Called with (host->lock) spinlock held. */
+static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	int rc;
+
+	if (!clock) {
+		msm_host->clk_rate = clock;
+		goto out;
+	}
+
+	spin_unlock_irq(&host->lock);
+
+	rc = clk_set_rate(msm_host->clk, clock);
+	if (rc) {
+		pr_err("%s: Failed to set clock at rate %u\n",
+		       mmc_hostname(host->mmc), clock);
+		goto out_lock;
+	}
+	msm_host->clk_rate = clock;
+	pr_debug("%s: Setting clock at rate %lu\n",
+		 mmc_hostname(host->mmc), clk_get_rate(msm_host->clk));
+
+out_lock:
+	spin_lock_irq(&host->lock);
+out:
+	__sdhci_msm_set_clock(host, clock);
+}
+
 static const struct of_device_id sdhci_msm_dt_match[] = {
 	{ .compatible = "qcom,sdhci-msm-v4" },
 	{},
@@ -581,7 +645,7 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
 static const struct sdhci_ops sdhci_msm_ops = {
 	.platform_execute_tuning = sdhci_msm_execute_tuning,
 	.reset = sdhci_reset,
-	.set_clock = sdhci_set_clock,
+	.set_clock = sdhci_msm_set_clock,
 	.get_min_clock = sdhci_msm_get_min_clock,
 	.get_max_clock = sdhci_msm_get_max_clock,
 	.set_bus_width = sdhci_set_bus_width,
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
a Linux Foundation Collaborative Project.

