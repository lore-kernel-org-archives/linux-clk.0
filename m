Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A018C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  4 Jan 2023 07:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbjADHoE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Jan 2023 02:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjADHoE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jan 2023 02:44:04 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417C8193F2;
        Tue,  3 Jan 2023 23:44:01 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Nn1ll4VwCzRqpv;
        Wed,  4 Jan 2023 15:42:27 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 15:43:58 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <andersson@kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ansuelsmth@gmail.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH] clk: qcom: krait-cc: fix wrong pointer passed to IS_ERR()
Date:   Wed, 4 Jan 2023 16:02:35 +0800
Message-ID: <20230104080235.1748953-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It should be 'mux' passed to IS_ERR/PTR_ERR().

Fixes: 56a655e1c41a ("clk: qcom: krait-cc: convert to parent_data API")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/qcom/krait-cc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
index 2f9287c263ec..410ae8390f1c 100644
--- a/drivers/clk/qcom/krait-cc.c
+++ b/drivers/clk/qcom/krait-cc.c
@@ -376,8 +376,8 @@ static int krait_cc_probe(struct platform_device *pdev)
 
 	for_each_possible_cpu(cpu) {
 		mux = krait_add_clks(dev, cpu, id->data);
-		if (IS_ERR(clk))
-			return PTR_ERR(clk);
+		if (IS_ERR(mux))
+			return PTR_ERR(mux);
 		clks[cpu] = mux->clk;
 	}
 
-- 
2.25.1

