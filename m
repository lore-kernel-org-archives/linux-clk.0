Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3867FC433F5
	for <linux-clk@archiver.kernel.org>; Sun, 31 Oct 2021 02:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E48A60EBB
	for <linux-clk@archiver.kernel.org>; Sun, 31 Oct 2021 02:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbhJaCKP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Oct 2021 22:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbhJaCKH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 30 Oct 2021 22:10:07 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC8EC061570
        for <linux-clk@vger.kernel.org>; Sat, 30 Oct 2021 19:07:32 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t7so13780924pgl.9
        for <linux-clk@vger.kernel.org>; Sat, 30 Oct 2021 19:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2+ffyI9OZZpP3lY0AHhAJ8sA/wkP1dbrlB/3sN839Ik=;
        b=BmYkSErE+WwlMV8TFgrRz7sjh2rWQ6vQeNlaX/QLMAAH6ZftWSOGI0PaX7UVSvZzQz
         Od0EBQAWHab+Rpw2rnxi+vadNnOZ8KnnVH+vrxHgPxx3C+IzGwH5KXYwCcKU+xira1y5
         YRANqoM8C1UKhAWazgUsHjD/2F248wQYrlFhmsdfvTSXMmamrsKB/CLlI1exECx9UYYz
         a2SXDzAvNa7dxLbKLYV9whtKbuEzAeEzy3xNYmQE2F4ucnGjNXGw84OnOkeNgGebkPc8
         M4lrSbEEj9bwWE7Jxv8tPv1eQN/ne1A66i3HWUWJzq6DnCVRI3KrKxw6T/D4AYV1n3zz
         HRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2+ffyI9OZZpP3lY0AHhAJ8sA/wkP1dbrlB/3sN839Ik=;
        b=EYD8xhHIornjW+BMVb1PyDKH//D8GF12BcToE6A7CBK7v+8uGBQVyV4mpZjiBS8o8e
         0UZUBAF0usIjpjtg7UELr8fphAHuAgyHYqzMDc+/sTaS2I/wRq8h8YkxEGHPyMaXlXEs
         xbg+ElM5FfVIp5PHgqXw6eDj/NLEMMreQawPOnborXyx86/Ep+oKf8Ma2mglgnoD3a8a
         anusZl9SXByFqMFP0fr17lVDOadBs4KFtGibEABpnbS4mw3nuRGDOs9fekweOixlevSv
         oJ+6jJvINIgYhQi6rCllC6kRo3+7ALFjSEkvuWye4rB5qjqKqHmUInweDsU6Q3D66S/R
         /wRg==
X-Gm-Message-State: AOAM533jIn0iffOPQ+jLW0Be3xeUGYvLt/irfl58wdWawjlZEpcn3D9+
        6L/vcgPUJAvHKjcICtHJtzJnNA==
X-Google-Smtp-Source: ABdhPJyEwuKshFuDRGbY3NasksEfpyTOsE6hSALQC2rHV5Du28iQy4M6UN7UtFUNWYdkR9dXurI0JA==
X-Received: by 2002:a63:330f:: with SMTP id z15mr15312243pgz.42.1635646052031;
        Sat, 30 Oct 2021 19:07:32 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p9sm10748986pfn.7.2021.10.30.19.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 19:07:31 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/3] clk: qcom: smd-rpm: Drop the use of struct rpm_cc
Date:   Sun, 31 Oct 2021 10:07:14 +0800
Message-Id: <20211031020715.21636-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211031020715.21636-1-shawn.guo@linaro.org>
References: <20211031020715.21636-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Considering that struct rpm_cc is now identical to rpm_smd_clk_desc,
and function qcom_smdrpm_clk_hw_get() uses rpm_cc in a read-only manner,
rpm_cc can be dropped by getting the function use rpm_smd_clk_desc
directly.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a27c0e740ab7..dd3d373a1309 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -150,11 +150,6 @@ struct clk_smd_rpm_req {
 	__le32 value;
 };
 
-struct rpm_cc {
-	struct clk_smd_rpm **clks;
-	size_t num_clks;
-};
-
 struct rpm_smd_clk_desc {
 	struct clk_smd_rpm **clks;
 	size_t num_clks;
@@ -1157,20 +1152,19 @@ MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
 static struct clk_hw *qcom_smdrpm_clk_hw_get(struct of_phandle_args *clkspec,
 					     void *data)
 {
-	struct rpm_cc *rcc = data;
+	const struct rpm_smd_clk_desc *desc = data;
 	unsigned int idx = clkspec->args[0];
 
-	if (idx >= rcc->num_clks) {
+	if (idx >= desc->num_clks) {
 		pr_err("%s: invalid index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
 	}
 
-	return rcc->clks[idx] ? &rcc->clks[idx]->hw : ERR_PTR(-ENOENT);
+	return desc->clks[idx] ? &desc->clks[idx]->hw : ERR_PTR(-ENOENT);
 }
 
 static int rpm_smd_clk_probe(struct platform_device *pdev)
 {
-	struct rpm_cc *rcc;
 	int ret;
 	size_t num_clks, i;
 	struct qcom_smd_rpm *rpm;
@@ -1190,13 +1184,6 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
 	rpm_smd_clks = desc->clks;
 	num_clks = desc->num_clks;
 
-	rcc = devm_kzalloc(&pdev->dev, sizeof(*rcc), GFP_KERNEL);
-	if (!rcc)
-		return -ENOMEM;
-
-	rcc->clks = rpm_smd_clks;
-	rcc->num_clks = num_clks;
-
 	for (i = 0; i < num_clks; i++) {
 		if (!rpm_smd_clks[i])
 			continue;
@@ -1222,7 +1209,7 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_of_clk_add_hw_provider(&pdev->dev, qcom_smdrpm_clk_hw_get,
-				     rcc);
+					  (void *)desc);
 	if (ret)
 		goto err;
 
-- 
2.17.1

