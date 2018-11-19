Return-Path: <SRS0=X/us=N6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B17C43441
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B0FD2080C
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="XX2qAb6N";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="D7/DyzZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B0FD2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732146AbeKTKNV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 05:13:21 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55002 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbeKTKNV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Nov 2018 05:13:21 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 289C360B0D; Mon, 19 Nov 2018 23:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671233;
        bh=BXc30Oiq33agLJdtDiAxc9XUnBIPBPQDmrvakRMft6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XX2qAb6NqByev74MbXuiaaQhE2WY0L2YVOe+PrvCpzxuUWMvupH60mE5ee1JCMfVj
         DQBJoaXeE0IOjwWglAdYv5zWZR1AF1eQT7DlRvN5dghK+6uWVNOGEVEkOJ6QrlMpSA
         erSwXWOXecJyCgovG122zDKPmwXibtFgPgS6qpbw=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95DBF60767;
        Mon, 19 Nov 2018 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671232;
        bh=BXc30Oiq33agLJdtDiAxc9XUnBIPBPQDmrvakRMft6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D7/DyzZw7Usvkv9kK/O8DT81kgv/YA9LZp5F8B9UqnW6MceJ6C/gDyf3CIgvrXtWC
         Haj1tC5/CgOI++4fwWxHYhc8MjliP41wEGrFeQRfylNgc2elwiPzJLvtDhi1dTqgrX
         fO9IV3t6Ii9fMwDM35zQYlZL/9qzZNU7bEBL2jKY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95DBF60767
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.orgi,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm/a6xx: Remove unwanted regulator code
Date:   Mon, 19 Nov 2018 16:47:03 -0700
Message-Id: <20181119234706.5821-2-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181119234706.5821-1-jcrouse@codeaurora.org>
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GMU code currently has some misguided code to try to work around
a hardware quirk that requires the power domains on the GPU be
collapsed in a certain order. Upcoming patches will do this the
right way so get rid of the unused and unwanted regulator
code.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 546599a7ab05..51493f409358 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -646,9 +646,6 @@ int a6xx_gmu_reset(struct a6xx_gpu *a6xx_gpu)
 	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
 		(val & 1), 100, 1000);
 
-	/* Force off the GX GSDC */
-	regulator_force_disable(gmu->gx);
-
 	/* Disable the resources */
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 	pm_runtime_put_sync(gmu->dev);
@@ -1173,7 +1170,6 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
 
 	pm_runtime_enable(gmu->dev);
-	gmu->gx = devm_regulator_get(gmu->dev, "vdd");
 
 	/* Get the list of clocks */
 	ret = a6xx_gmu_clocks_probe(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 35f765afae45..a871cae2fc5e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -52,8 +52,6 @@ struct a6xx_gmu {
 	int hfi_irq;
 	int gmu_irq;
 
-	struct regulator *gx;
-
 	struct iommu_domain *domain;
 	u64 uncached_iova_base;
 
-- 
2.18.0

