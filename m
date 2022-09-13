Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F6FECAAA1
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 03:11:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiIMDK6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 23:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiIMDKz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 23:10:55 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1CE21815;
        Mon, 12 Sep 2022 20:10:54 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRT0053MJzlVqP;
        Tue, 13 Sep 2022 11:06:56 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
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
Subject: [PATCH -next 2/2] clk: qcom: clk-spmi-pmic-div: Use dev_err_probe() helper
Date:   Tue, 13 Sep 2022 11:17:56 +0800
Message-ID: <20220913031756.983224-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913031756.983224-1-yangyingliang@huawei.com>
References: <20220913031756.983224-1-yangyingliang@huawei.com>
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
 drivers/clk/qcom/clk-spmi-pmic-div.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index f2cf55cee2fd..10b8d19d0662 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -237,12 +237,9 @@ static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
 	cc->nclks = nclks;
 
 	cxo = clk_get(dev, "xo");
-	if (IS_ERR(cxo)) {
-		ret = PTR_ERR(cxo);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get xo clock\n");
-		return ret;
-	}
+	if (IS_ERR(cxo))
+		return dev_err_probe(dev, PTR_ERR(cxo),
+				     "failed to get xo clock\n");
 	cxo_hz = clk_get_rate(cxo);
 	clk_put(cxo);
 
-- 
2.25.1

