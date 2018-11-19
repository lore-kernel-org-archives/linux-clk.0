Return-Path: <SRS0=X/us=N6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32B1C43441
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8DA372086A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="P4wCql7a";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="iWV9u81M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DA372086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732158AbeKTKNZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 05:13:25 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55426 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbeKTKNZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Nov 2018 05:13:25 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4A9D26130F; Mon, 19 Nov 2018 23:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671237;
        bh=WSojjFjwCU/SrSA4Fc3cNylaU5CFnaVeAzuD6In1/rc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P4wCql7aWDpYauVgyNCWuRgf+Gm57OqbsCacE3M28RKP6rn5P986zZ1P5MkxYB4CN
         3G7TfAf+MPRtXKDdKPOvnGweW5xCVXZTMTDrFar27xVTBdu+Z7bGIV1f2Jn5QDqUVs
         dfHzinEEbE/IMZpMyOh8El69kFHiOak6HzqGf00E=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 552BC612F1;
        Mon, 19 Nov 2018 23:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671236;
        bh=WSojjFjwCU/SrSA4Fc3cNylaU5CFnaVeAzuD6In1/rc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iWV9u81M8vK0tzXVNJdYKBWN04HTxJSep1T4+vRXYBH/xun8RNizqirD3eeW6xcsP
         4FuU68EVtxrW+acnl1+4Ob/asxPGVaTpWvjrTeEzWdEFLwU5mlwtoYEhYWXjC27sXx
         H77y0KACjob+k04bWRduP8rL5Q/d1JiKqwWZmN98=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 552BC612F1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.orgi,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm/gpu: Attach to the GPU GX power domain
Date:   Mon, 19 Nov 2018 16:47:06 -0700
Message-Id: <20181119234706.5821-5-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181119234706.5821-1-jcrouse@codeaurora.org>
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

99.999% of the time during normal operation the GMU is responsible
for power and clock control on the GX domain and the CPU remains
blissfully unaware. However, there is one situation where the CPU
needs to get involved:

The power sequencing rules dictate that the GX needs to be turned
off before the CX so that the CX can be turned on before the GX
during power up. During normal operation when the CPU is taking
down the CX domain a stop command is sent to the GMU which turns
off the GX domain and then the CPU handles the CX domain.

But if the GMU happened to be unresponsive while the GX domain was
left then the CPU will need to step in and turn off the GX domain
before resetting the CX and rebooting the GMU. This unfortunately
means that the CPU needs to be marginally aware of the GX domain
even though it is expected to usually keep its hands off.

To support this we create a semi-disabled GX power domain that
does nothing to the hardware on power up but tries to shut it
down normally on power down. In this method the reference counting
is correct and we can step in with the pm_runtime_put() at the right
time during the failure path.

This patch sets up the connection to the GX power domain and does
the magic to "enable" and disable it at the right points.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 41 ++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 ++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 51493f409358..ca71709efc94 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2017-2018 The Linux Foundation. All rights reserved. */
 
 #include <linux/clk.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <soc/qcom/cmd-db.h>
 
@@ -646,6 +647,16 @@ int a6xx_gmu_reset(struct a6xx_gpu *a6xx_gpu)
 	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
 		(val & 1), 100, 1000);
 
+	/*
+	 * Depending on the state of the GMU at this point the GX domain might
+	 * have been left on. Hardware sequencing rules state that the GX has to
+	 * be turned off before the CX domain so this is that one time that
+	 * that calling pm_runtime_put_sync() is expected to do something useful
+	 * (turn off the headswitch)
+	 */
+	if (!IS_ERR(gmu->gxpd))
+		pm_runtime_put_sync(gmu->gxpd);
+
 	/* Disable the resources */
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 	pm_runtime_put_sync(gmu->dev);
@@ -707,6 +718,14 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the highest power frequency */
 	__a6xx_gmu_set_freq(gmu, gmu->nr_gpu_freqs - 1);
 
+	/*
+	 * "enable" the GX power domain which won't actually do anything but it
+	 * will make sure that the refcounting is correct in case we need to
+	 * bring down the GX after a GMU failure
+	 */
+	if (!IS_ERR(gmu->gxpd))
+		pm_runtime_get(gmu->gxpd);
+
 out:
 	/* Make sure to turn off the boot OOB request on error */
 	if (ret)
@@ -778,6 +797,14 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 	/* Tell RPMh to power off the GPU */
 	a6xx_rpmh_stop(gmu);
 
+	/*
+	 * Mark the GPU power domain as off. During the shutdown process the GMU
+	 * should actually turn off the power so this is really just a
+	 * houskeeping step
+	 */
+	if (!IS_ERR(gmu->gxpd))
+		pm_runtime_put_sync(gmu->gxpd);
+
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 
 	pm_runtime_put_sync(gmu->dev);
@@ -1142,9 +1169,15 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	if (IS_ERR_OR_NULL(gmu->mmio))
 		return;
 
-	pm_runtime_disable(gmu->dev);
 	a6xx_gmu_stop(a6xx_gpu);
 
+	pm_runtime_disable(gmu->dev);
+
+	if (!IS_ERR(gmu->gxpd)) {
+		pm_runtime_disable(gmu->gxpd);
+		dev_pm_domain_detach(gmu->gxpd, false);
+	}
+
 	a6xx_gmu_irq_disable(gmu);
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
@@ -1203,6 +1236,12 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0)
 		goto err;
 
+	/*
+	 * Get a link to the GX power domain to reset the GPU in case of GMU
+	 * crash
+	 */
+	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
+
 	/* Get the power levels for the GMU and GPU */
 	a6xx_gmu_pwrlevels_probe(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index a871cae2fc5e..dcc172d55f49 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -55,6 +55,8 @@ struct a6xx_gmu {
 	struct iommu_domain *domain;
 	u64 uncached_iova_base;
 
+	struct device *gxpd;
+
 	int idle_level;
 
 	struct a6xx_gmu_bo *hfi;
-- 
2.18.0

