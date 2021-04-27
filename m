Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DB8C433B4
	for <linux-clk@archiver.kernel.org>; Tue, 27 Apr 2021 16:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76DE0613E8
	for <linux-clk@archiver.kernel.org>; Tue, 27 Apr 2021 16:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbhD0QqS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Apr 2021 12:46:18 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:57268 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236397AbhD0QqP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Apr 2021 12:46:15 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id A11A4B7D487; Tue, 27 Apr 2021 18:45:26 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: Simplify usage of dev_err_probe()
Date:   Tue, 27 Apr 2021 18:45:22 +0200
Message-Id: <20210427164522.2886825-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

dev_err_probe() returns the error code passed as second parameter. Also if
the error code is -EPROBE_DEFER dev_err_probe() is silent, so there is no
need to check for this value before calling dev_err_probe().

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/clk/qcom/apcs-sdx55.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
index d0edabebf9c2..6810637f32e3 100644
--- a/drivers/clk/qcom/apcs-sdx55.c
+++ b/drivers/clk/qcom/apcs-sdx55.c
@@ -56,10 +56,8 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
 	int ret;
 
 	regmap = dev_get_regmap(parent, NULL);
-	if (!regmap) {
-		dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
-		return -ENODEV;
-	}
+	if (!regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
 
 	a7cc = devm_kzalloc(dev, sizeof(*a7cc), GFP_KERNEL);
 	if (!a7cc)
@@ -80,19 +78,15 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
 	a7cc->parent_map = apcs_mux_clk_parent_map;
 
 	a7cc->pclk = devm_clk_get(parent, "pll");
-	if (IS_ERR(a7cc->pclk)) {
-		ret = PTR_ERR(a7cc->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err_probe(dev, ret, "Failed to get PLL clk\n");
-		return ret;
-	}
+	if (IS_ERR(a7cc->pclk))
+		return dev_err_probe(dev, PTR_ERR(a7cc->pclk),
+				     "Failed to get PLL clk\n");
 
 	a7cc->clk_nb.notifier_call = a7cc_notifier_cb;
 	ret = clk_notifier_register(a7cc->pclk, &a7cc->clk_nb);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to register clock notifier\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register clock notifier\n");
 
 	ret = devm_clk_register_regmap(dev, &a7cc->clkr);
 	if (ret) {
-- 
2.30.2

