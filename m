Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417E0C433E7
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E68812225E
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QfFbFDAW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389226AbgJOB7t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388969AbgJOB7j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 21:59:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE498C0613DE
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:13:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hk7so499248pjb.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XXXVW8LaNsSK90nR0fVqNTLLxxo+uN8rx6WyyMCGIqU=;
        b=QfFbFDAWvdwuJNtRGDEJ+4jQLfUu4dtYrqt375pRq+u0Dv2ZX2eDJlK45YLFadyX+m
         hpWDEVApkwfktJTstvyeNq1QJX+M8OGBGETL2KOqGWC1sh2+yk4MBRtbyMSQZoxNFX/i
         ZGPe0JO6EfJFxshk65T9Mxn+11MAkDIRtJTw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XXXVW8LaNsSK90nR0fVqNTLLxxo+uN8rx6WyyMCGIqU=;
        b=pi7k8ofFg7vTA6qbhQFQqBWcDl0zXnAx4aaPofn1CjDD0rkBC3jHXd5T28chNwKyxa
         20J5ohn2/eMppwK7WQb1CN7YPduccEnsKqhv378vaZZmHpC8zLsoByMoGjQ4kHTWVkYa
         pgDxU0OyQ5UGj1siO6YFaPcri16ueCbK723LTrMvDkjdbT/vyE1Yhc1s1Nb3DOzPjDrX
         62ugix4aTSoAdoXIBOjKpvMCxm7NEo4AsPedLJVvmBILIXm0C4w7UIGJpx2YJ8dCuhv1
         v/VX0XaKWIrHMslarGBfCzwbWkjJtAqqLhaM8aI+1i+Yi68Nz2s1PEM83BFeJsJKnQl4
         deNg==
X-Gm-Message-State: AOAM531mcPbYno/2ZHq2eNx92Pl9qbenW5N/2welUG9Mv8BcXBsuFTXY
        fXHlF1FbjM1qPLsEyXSr3ol07w==
X-Google-Smtp-Source: ABdhPJyWzB7PQNM2L2E7jMBzdy13qHYz2fsBChWv51asF/Dv9wMqyArFHgIaMI2T7Sc9RZwlGiO/5Q==
X-Received: by 2002:a17:90b:1392:: with SMTP id hr18mr1017220pjb.182.1602710010286;
        Wed, 14 Oct 2020 14:13:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id p19sm517713pfn.204.2020.10.14.14.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 14:13:29 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, linux-soc@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] clk: qcom: lpasscc-sc7810: Use devm in probe
Date:   Wed, 14 Oct 2020 14:05:21 -0700
Message-Id: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Let's convert the lpass clock control driver to use devm.  This is a
few more lines of code, but it will be useful in a later patch which
disentangles the two devices handled by this driver.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- ("clk: qcom: lpasscc-sc7810: Use devm in probe") new for v3.

 drivers/clk/qcom/lpasscorecc-sc7180.c | 38 +++++++++++++++------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 228d08f5d26f..abcf36006926 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -412,40 +412,44 @@ static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
 
+static void lpass_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
+static void lapss_pm_clk_destroy(void *data)
+{
+	pm_clk_destroy(data);
+}
+
 static int lpass_core_sc7180_probe(struct platform_device *pdev)
 {
 	int (*clk_probe)(struct platform_device *p);
 	int ret;
 
 	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
+	if (ret)
+		return ret;
+
 	ret = pm_clk_create(&pdev->dev);
 	if (ret)
-		goto disable_pm_runtime;
+		return ret;
+	ret = devm_add_action_or_reset(&pdev->dev, lapss_pm_clk_destroy, &pdev->dev);
+	if (ret)
+		return ret;
 
 	ret = pm_clk_add(&pdev->dev, "iface");
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		goto destroy_pm_clk;
+		return ret;
 	}
 
-	ret = -EINVAL;
 	clk_probe = of_device_get_match_data(&pdev->dev);
 	if (!clk_probe)
-		goto destroy_pm_clk;
-
-	ret = clk_probe(pdev);
-	if (ret)
-		goto destroy_pm_clk;
-
-	return 0;
-
-destroy_pm_clk:
-	pm_clk_destroy(&pdev->dev);
-
-disable_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
+		return -EINVAL;
 
-	return ret;
+	return clk_probe(pdev);
 }
 
 static const struct dev_pm_ops lpass_core_cc_pm_ops = {
-- 
2.28.0.1011.ga647a8990f-goog

