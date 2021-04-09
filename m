Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B765C433B4
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 08:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBE2F611B0
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 08:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhDIIYO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 04:24:14 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15646 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhDIIYD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Apr 2021 04:24:03 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGrgK2SLMzpWlg;
        Fri,  9 Apr 2021 16:21:01 +0800 (CST)
Received: from huawei.com (10.67.174.37) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 16:23:48 +0800
From:   Chen Hui <clare.chenhui@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <mani@kernel.org>,
        <georgi.djakov@linaro.org>, <sivaprak@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 -next 2/3] clk: qcom: a53-pll: Add missing MODULE_DEVICE_TABLE
Date:   Fri, 9 Apr 2021 16:23:51 +0800
Message-ID: <20210409082352.233810-3-clare.chenhui@huawei.com>
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

CONFIG_QCOM_A53PLL is tristate option and therefore this driver can be
compiled as a module. This patch adds missing MODULE_DEVICE_TABLE
definition which generates correct modalias for automatic loading of
this driver when it is built as an external module.

Fixes: 0c6ab1b8f894 ("clk: qcom: Add A53 PLL support")
Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/a53-pll.c | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.17.1

