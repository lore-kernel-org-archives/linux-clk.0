Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5D7C43600
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 08:24:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13ACC611AE
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 08:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhDIIYQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 04:24:16 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16498 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbhDIIYI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Apr 2021 04:24:08 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGrgP6tDvzPpCB;
        Fri,  9 Apr 2021 16:21:05 +0800 (CST)
Received: from huawei.com (10.67.174.37) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 16:23:48 +0800
From:   Chen Hui <clare.chenhui@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <mani@kernel.org>,
        <georgi.djakov@linaro.org>, <sivaprak@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 -next 3/3] clk: qcom: apss-ipq-pll: Add missing MODULE_DEVICE_TABLE
Date:   Fri, 9 Apr 2021 16:23:52 +0800
Message-ID: <20210409082352.233810-4-clare.chenhui@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409082352.233810-1-clare.chenhui@huawei.com>
References: <20210409082352.233810-1-clare.chenhui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.37]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CONFIG_IPQ_APSS_PLL is tristate option and therefore this driver can
be compiled as a module. This patch adds missing MODULE_DEVICE_TABLE
definition which generates correct modalias for automatic loading of
this driver when it is built as an external module.

Fixes: ecd2bacfbbc4 ("clk: qcom: Add ipq apss pll driver")
Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/apss-ipq-pll.c | 1 +
 1 file changed, 1 insertion(+)

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

