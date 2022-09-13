Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AE9C6FA82
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 03:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiIMDK5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 23:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiIMDKz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 23:10:55 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BE821809;
        Mon, 12 Sep 2022 20:10:54 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRT1S3c5qznVFm;
        Tue, 13 Sep 2022 11:08:12 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 11:10:52 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 13 Sep
 2022 11:10:52 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <agross@kernel.org>, <andersson@kernel.org>, <sboyd@kernel.org>
Subject: [PATCH -next 1/2] clk: qcom: apcs-msm8916: Use dev_err_probe() helper
Date:   Tue, 13 Sep 2022 11:17:55 +0800
Message-ID: <20220913031756.983224-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

dev_err() can be replace with dev_err_probe() which will check if error
code is -EPROBE_DEFER.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/qcom/apcs-msm8916.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index 89e0730810ac..233885236409 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -83,12 +83,9 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	a53cc->parent_map = gpll0_a53cc_map;
 
 	a53cc->pclk = devm_clk_get(parent, NULL);
-	if (IS_ERR(a53cc->pclk)) {
-		ret = PTR_ERR(a53cc->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(a53cc->pclk))
+		return dev_err_probe(dev, PTR_ERR(a53cc->pclk),
+				     "failed to get clk\n");
 
 	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
 	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
-- 
2.25.1

