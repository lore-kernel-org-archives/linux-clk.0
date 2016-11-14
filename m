Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42596 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941072AbcKNGCY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Nov 2016 01:02:24 -0500
From: Ritesh Harjani <riteshh@codeaurora.org>
To: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, shawn.lin@rock-chips.com,
        sboyd@codeaurora.org, andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org, alex.lemberg@sandisk.com,
        mateusz.nowak@intel.com, Yuliy.Izrailov@sandisk.com,
        asutoshd@codeaurora.org, kdorfman@codeaurora.org,
        david.griego@linaro.org, stummala@codeaurora.org,
        venkatg@codeaurora.org, rnayak@codeaurora.org,
        pramod.gurav@linaro.org, Ritesh Harjani <riteshh@codeaurora.org>
Subject: [PATCH v7 09/14] mmc: sdhci-msm: Add clock changes for DDR mode.
Date: Mon, 14 Nov 2016 11:30:43 +0530
Message-Id: <1479103248-9491-10-git-send-email-riteshh@codeaurora.org>
In-Reply-To: <1479103248-9491-1-git-send-email-riteshh@codeaurora.org>
References: <1479103248-9491-1-git-send-email-riteshh@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

SDHC MSM controller need 2x clock for MCLK at GCC.
Hence make required changes to have 2x clock for
DDR timing modes.

Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-msm.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b96a4a7..41a4ea7 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -637,6 +637,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_ios curr_ios = host->mmc->ios;
 	int rc;
 
 	if (!clock) {
@@ -645,11 +646,23 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 	}
 
 	spin_unlock_irq(&host->lock);
+	/*
+	 * The SDHC requires internal clock frequency to be double the
+	 * actual clock that will be set for DDR mode. The controller
+	 * uses the faster clock(100/400MHz) for some of its parts and
+	 * send the actual required clock (50/200MHz) to the card.
+	 */
+	if ((curr_ios.timing == MMC_TIMING_UHS_DDR50) ||
+	    (curr_ios.timing == MMC_TIMING_MMC_DDR52) ||
+	    (curr_ios.timing == MMC_TIMING_MMC_HS400))
+		clock *= 2;
+
 	if (clock != msm_host->clk_rate) {
 		rc = clk_set_rate(msm_host->clk, clock);
 		if (rc) {
-			pr_err("%s: Failed to set clock at rate %u\n",
-			       mmc_hostname(host->mmc), clock);
+			pr_err("%s: Failed to set clock at rate %u at timing %d\n",
+			       mmc_hostname(host->mmc), clock,
+			       curr_ios.timing);
 			spin_lock_irq(&host->lock);
 			goto out;
 		}
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
a Linux Foundation Collaborative Project.

