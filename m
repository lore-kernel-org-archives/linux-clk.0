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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2F8C43457
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0FA122259
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vk9W4Mlu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732247AbgJOB3i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732227AbgJOB3h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 21:29:37 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2FDC0D9425
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 17:13:43 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d23so579773pll.7
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 17:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UlbiRK9FPIASJdWjbFlxZN7JKEjeG321ukcvNxoIW+Y=;
        b=Vk9W4Mlu++ARKTCbhumJfJo840Ddq86v5pd4GoUMiZ/jn8R87NXlQrqOw7qIIGNcXt
         fU1NlnVPlWdNDyyJJCP2gdIg/b1Y1ZHCDcU5ZC6iCuS+ZRcexPofZIeE4cKqhzUFoJJW
         zRJktZcKqenkCO26pNfD4jRlhToWAoJ2wJrMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UlbiRK9FPIASJdWjbFlxZN7JKEjeG321ukcvNxoIW+Y=;
        b=D63o195Ymp+eCElC/VEjgNhS+E4eKIb+CAKpBm6eKTp4fNdEdRqTEHeWOulMQ1kkiB
         HsUZP+ALumK1Wv5HsIrKVfZk4wj5eRJa/bU/diXpNVuPGz9OsHulV4YpKu8j5as3UAKn
         0m/StGucBmO5LJA7YsETVxaS+j4o6V1fyqAoXfCLfsf4nk4TcZGT8+bjDl27GZJ1O6gQ
         FV8e7FzNZizDXsU0TAYOJlzenVS3RtI6FJmt5iNbmGfqh0APgXNLVGyuog9Ihs8Nb8JC
         LejQltYyDtIdiMekDvO8sDcuutZzW2Pim2jM4SOouDNmVBBqXgenTtuICFiCCYSQEqn8
         g5HQ==
X-Gm-Message-State: AOAM5309J6d3cV/IhuHI1R89RRao6Z0yaTfaQ++oCDlp97xyNPHtMwWS
        HQIprc9BbkPiFKJmMJbibGTzrQ==
X-Google-Smtp-Source: ABdhPJzUyM8QxDdPbJVsk13aEs2SgZMLJmPvtbxWE6eGgQv8WrXmx97oZcbONE04yikGH3baniEedg==
X-Received: by 2002:a17:90a:8c17:: with SMTP id a23mr1625454pjo.112.1602720823467;
        Wed, 14 Oct 2020 17:13:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id r16sm726485pjo.19.2020.10.14.17.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 17:13:42 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-soc@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
Date:   Wed, 14 Oct 2020 17:13:28 -0700
Message-Id: <20201014171259.v4.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201014171259.v4.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
References: <20201014171259.v4.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sc7180 lpass clock driver manages two different devices.  These
two devices were tangled together, using one probe and a lookup to
figure out the real probe.  I think it's cleaner to really separate
the probe for these two devices since they're really different things,
just both managed by the same driver.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

Changes in v3:
- ("clk: qcom: lpass-sc7180: Disentangle the two clock devices") new for v3.

 drivers/clk/qcom/lpasscorecc-sc7180.c | 101 ++++++++++++++++----------
 1 file changed, 62 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 2d15e33ec837..4ed766ca08bb 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -366,12 +366,38 @@ static void lpass_pm_clk_destroy(void *data)
 	pm_clk_destroy(data);
 }
 
+static int lpass_create_pm_clks(struct platform_device *pdev)
+{
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0)
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+	return ret;
+}
+
 static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
 	struct regmap *regmap;
 	int ret;
 
+	ret = lpass_create_pm_clks(pdev);
+	if (ret)
+		return ret;
+
 	lpass_core_cc_sc7180_regmap_config.name = "lpass_audio_cc";
 	desc = &lpass_audio_hm_sc7180_desc;
 	ret = qcom_cc_probe_by_index(pdev, 1, desc);
@@ -402,6 +428,11 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 static int lpass_hm_core_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
+	int ret;
+
+	ret = lpass_create_pm_clks(pdev);
+	if (ret)
+		return ret;
 
 	lpass_core_cc_sc7180_regmap_config.name = "lpass_hm_core";
 	desc = &lpass_core_hm_sc7180_desc;
@@ -409,55 +440,28 @@ static int lpass_hm_core_probe(struct platform_device *pdev)
 	return qcom_cc_probe_by_index(pdev, 0, desc);
 }
 
-static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
+static const struct of_device_id lpass_hm_sc7180_match_table[] = {
 	{
 		.compatible = "qcom,sc7180-lpasshm",
-		.data = lpass_hm_core_probe,
 	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_hm_sc7180_match_table);
+
+static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
 	{
 		.compatible = "qcom,sc7180-lpasscorecc",
-		.data = lpass_core_cc_sc7180_probe,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
 
-static int lpass_core_sc7180_probe(struct platform_device *pdev)
-{
-	int (*clk_probe)(struct platform_device *p);
-	int ret;
-
-	pm_runtime_enable(&pdev->dev);
-	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, "iface");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		return ret;
-	}
-
-	clk_probe = of_device_get_match_data(&pdev->dev);
-	if (!clk_probe)
-		return -EINVAL;
-
-	return clk_probe(pdev);
-}
-
 static const struct dev_pm_ops lpass_core_cc_pm_ops = {
 	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
 
 static struct platform_driver lpass_core_cc_sc7180_driver = {
-	.probe = lpass_core_sc7180_probe,
+	.probe = lpass_core_cc_sc7180_probe,
 	.driver = {
 		.name = "lpass_core_cc-sc7180",
 		.of_match_table = lpass_core_cc_sc7180_match_table,
@@ -465,17 +469,36 @@ static struct platform_driver lpass_core_cc_sc7180_driver = {
 	},
 };
 
-static int __init lpass_core_cc_sc7180_init(void)
+static const struct dev_pm_ops lpass_hm_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpass_hm_sc7180_driver = {
+	.probe = lpass_hm_core_probe,
+	.driver = {
+		.name = "lpass_hm-sc7180",
+		.of_match_table = lpass_hm_sc7180_match_table,
+		.pm = &lpass_hm_pm_ops,
+	},
+};
+
+static int __init lpass_sc7180_init(void)
 {
-	return platform_driver_register(&lpass_core_cc_sc7180_driver);
+	int ret;
+
+	ret = platform_driver_register(&lpass_core_cc_sc7180_driver);
+	if (ret)
+		return ret;
+	return platform_driver_register(&lpass_hm_sc7180_driver);
 }
-subsys_initcall(lpass_core_cc_sc7180_init);
+subsys_initcall(lpass_sc7180_init);
 
-static void __exit lpass_core_cc_sc7180_exit(void)
+static void __exit lpass_sc7180_exit(void)
 {
+	platform_driver_unregister(&lpass_hm_sc7180_driver);
 	platform_driver_unregister(&lpass_core_cc_sc7180_driver);
 }
-module_exit(lpass_core_cc_sc7180_exit);
+module_exit(lpass_sc7180_exit);
 
 MODULE_DESCRIPTION("QTI LPASS_CORE_CC SC7180 Driver");
 MODULE_LICENSE("GPL v2");
-- 
2.28.0.1011.ga647a8990f-goog

