Return-Path: <SRS0=+J6A=OF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC51C43441
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 17:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23F5B2086E
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 17:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="XGE+M5b5";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="jS9BK03U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23F5B2086E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbeK0EPY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Nov 2018 23:15:24 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:57456 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbeK0EPY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Nov 2018 23:15:24 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 95E8560722; Mon, 26 Nov 2018 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1543252838;
        bh=OjMRv6pXcTLlNXk8skoToltceq1fM+BRv+33qnwp1gQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XGE+M5b50eBMRVaPyvxseiG6Fh+L1cbrAM/a3YEngk8i7iWa6LKe4U+o12zMfu+WR
         NzxFZ9HtK3OkRHVC8Tw6XxFaFvEsvoD5XNff+3lcdkwlgjn7Wsc4wscowEIQm8IP9A
         Vy2lC6vzBVFnIITlur99EL2CXG9E0PKldFwHtxY0=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E903C60392;
        Mon, 26 Nov 2018 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1543252837;
        bh=OjMRv6pXcTLlNXk8skoToltceq1fM+BRv+33qnwp1gQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jS9BK03Un5/8s1spz+u7esEDANtLheWcIL4JZ+qL0m8wfYd9kQzhk1Vi3pTOJxNNW
         Lh91uRepT/epMYCBUER5B0RHRa3PM9wwwvaT9scPZzEaekzfQgCMfOFJCa5P6+IMOC
         zAPbOho0fn85qBQN+06oGcHy3shlahjATZEV0Gpo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E903C60392
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: Add a dummy enable function for GX gdsc
Date:   Mon, 26 Nov 2018 10:20:32 -0700
Message-Id: <20181126172032.11567-3-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181126172032.11567-1-jcrouse@codeaurora.org>
References: <20181126172032.11567-1-jcrouse@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Most of the time the CPU should not be touching the GX
domain on the GPU except for a very special use case when
the CPU needs to force the GX headswitch off. Add a
dummy enable function for the GX gdsc to simulate success
so that the pm_runtime reference counting is correct.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/clk/qcom/gpucc-sdm845.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 11222f487a65..7266e9a1d77e 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -131,11 +131,37 @@ static struct gdsc gpu_cx_gdsc = {
 	.flags = VOTABLE,
 };
 
+/*
+ * On SDM845 the GPU GX domain is *almost* entirely controlled by the GMU
+ * running in the CX domain so the CPU doesn't need to know anything about the
+ * GX domain EXCEPT....
+ *
+ * Hardware constraints dictate that the GX be powered down before the CX. If
+ * the GMU crashes it could leave the GX on. In order to successfully bring back
+ * the device the CPU needs to disable the GX headswitch. There being no sane
+ * way to reach in and touch that register from deep inside the GPU driver we
+ * need to set up the infrastructure to be able to ensure that the GPU can
+ * ensure that the GX is off during this super special case. We do this by
+ * defining a GX gdsc with a dummy enable function and a "default" disable
+ * function.
+ *
+ * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
+ * driver. During power up, nothing will happen from the CPU (and the GMU will
+ * power up normally but during power down this will ensure that the GX domain
+ * is *really* off - this gives us a semi standard way of doing what we need.
+ */
+static int gx_gdsc_enable(struct generic_pm_domain *domain)
+{
+	/* Do nothing but give genpd the impression that we were successful */
+	return 0;
+}
+
 static struct gdsc gpu_gx_gdsc = {
 	.gdscr = 0x100c,
 	.clamp_io_ctrl = 0x1508,
 	.pd = {
 		.name = "gpu_gx_gdsc",
+		.power_on = gx_gdsc_enable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
-- 
2.18.0

