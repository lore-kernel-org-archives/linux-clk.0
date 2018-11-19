Return-Path: <SRS0=X/us=N6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DA9C43441
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D1FD2086A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="ovbUL+mT";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="KlISF6bz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1FD2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732155AbeKTKNY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 05:13:24 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55334 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbeKTKNY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Nov 2018 05:13:24 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0AA1D612F2; Mon, 19 Nov 2018 23:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671236;
        bh=oYam9LxkR87XzgaWihdvEc7whQBRvvyQxOaxx+4DZ1U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ovbUL+mTe/G175h8/S4mCEuuOzQS+8PTNgeSQzqKmhmeJNK6Kbk80Ef5F4DHTSYiB
         lvRIr7xqgpByPrJMS7+WyyqA/OYHfnJzvZgV6SDYQ8UBu/vD2mK27YurQvrBRdmd3a
         MREEFcdZPZe5ZGnBjuZxl0QZETzvrcsb5+FJWNUI=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2329760C5F;
        Mon, 19 Nov 2018 23:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671235;
        bh=oYam9LxkR87XzgaWihdvEc7whQBRvvyQxOaxx+4DZ1U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KlISF6bz8eQX9waIRufS3DmOx68Bh4fCRIMyaTZj9vUPH7uQ2kcyzBpuOGlx0EUqk
         kzfZxEXMdzfYVAN2XkAseNhV6jBCkMTdQP/HaUYDNf9q52nR+MdvqYg/96ZDPw72LI
         XONem/giJjrmg/Cjt5rW23sCkjiDgoLonQRIuRIc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2329760C5F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.orgi,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] clk: qcom: Add a dummy enable function for GX gdsc
Date:   Mon, 19 Nov 2018 16:47:05 -0700
Message-Id: <20181119234706.5821-4-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181119234706.5821-1-jcrouse@codeaurora.org>
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
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
 drivers/clk/qcom/gpucc-sdm845.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 7a11b70b33f4..06254329ea33 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -319,16 +319,38 @@ static struct gdsc gpu_cx_gdsc = {
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
-	.clk_hws = {
-		&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
-	},
-	.clk_count = 1,
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
 };
-- 
2.18.0

