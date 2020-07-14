Return-Path: <SRS0=OSZ+=AZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06B9C433E4
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jul 2020 14:12:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C30CE2251F
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jul 2020 14:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgGNOMH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Jul 2020 10:12:07 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33132 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725821AbgGNOMG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Jul 2020 10:12:06 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 30AB8D7396B447D20511;
        Tue, 14 Jul 2020 22:12:03 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 14 Jul 2020 22:11:52 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH -next] clk: qcom: msm8996: Make symbol 'cpu_msm8996_clks' static
Date:   Tue, 14 Jul 2020 22:21:55 +0800
Message-ID: <20200714142155.35085-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sparse tool complains as follows:

drivers/clk/qcom/clk-cpu-8996.c:341:19: warning:
 symbol 'cpu_msm8996_clks' was not declared. Should it be static?

This variable is not used outside of clk-cpu-8996.c, so this commit
marks it static.

Fixes: 03e342dc45c9 ("clk: qcom: Add CPU clock driver for msm8996")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/qcom/clk-cpu-8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 77a2d2806e58..4a4fde8dd12d 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -338,7 +338,7 @@ static const struct regmap_config cpu_msm8996_regmap_config = {
 	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
 };
 
-struct clk_regmap *cpu_msm8996_clks[] = {
+static struct clk_regmap *cpu_msm8996_clks[] = {
 	&perfcl_pll.clkr,
 	&pwrcl_pll.clkr,
 	&perfcl_alt_pll.clkr,

