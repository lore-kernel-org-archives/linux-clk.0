Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8694C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 13:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF8B9610FB
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 13:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhDHNzW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 09:55:22 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15984 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhDHNzW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Apr 2021 09:55:22 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGN4l5N7GzyNZH;
        Thu,  8 Apr 2021 21:52:55 +0800 (CST)
Received: from huawei.com (10.67.174.37) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 21:55:04 +0800
From:   Chen Hui <clare.chenhui@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] clk: qcom: Add missing MODULE_DEVICE_TABLE
Date:   Thu, 8 Apr 2021 21:55:09 +0800
Message-ID: <20210408135509.208921-1-clare.chenhui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.37]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing MODULE_DEVICE_TABLE entries to support module autoloading,
as these drivers can be compiled as external modules.

Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
---
 drivers/clk/qcom/a53-pll.c      | 1 +
 drivers/clk/qcom/a7-pll.c       | 1 +
 drivers/clk/qcom/apss-ipq-pll.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 45cfc57bff92..af6ac17c7dae 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -93,6 +93,7 @@ static const struct of_device_id qcom_a53pll_match_table[] = {
 	{ .compatible = "qcom,msm8916-a53pll" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, qcom_a53pll_match_table);
 
 static struct platform_driver qcom_a53pll_driver = {
 	.probe = qcom_a53pll_probe,
diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
index e171d3caf2cf..c4a53e5db229 100644
--- a/drivers/clk/qcom/a7-pll.c
+++ b/drivers/clk/qcom/a7-pll.c
@@ -86,6 +86,7 @@ static const struct of_device_id qcom_a7pll_match_table[] = {
 	{ .compatible = "qcom,sdx55-a7pll" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, qcom_a7pll_match_table);
 
 static struct platform_driver qcom_a7pll_driver = {
 	.probe = qcom_a7pll_probe,
diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index 30be87fb222a..bef7899ad0d6 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -81,6 +81,7 @@ static const struct of_device_id apss_ipq_pll_match_table[] = {
 	{ .compatible = "qcom,ipq6018-a53pll" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, apss_ipq_pll_match_table);
 
 static struct platform_driver apss_ipq_pll_driver = {
 	.probe = apss_ipq_pll_probe,
-- 
2.17.1

