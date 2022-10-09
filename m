Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7A9C433FE
	for <linux-clk@archiver.kernel.org>; Sun,  9 Oct 2022 02:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiJICvf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Oct 2022 22:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJICve (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 8 Oct 2022 22:51:34 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870A113CFB
        for <linux-clk@vger.kernel.org>; Sat,  8 Oct 2022 19:51:32 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MlRML1FYpzrS9Y;
        Sun,  9 Oct 2022 10:49:02 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 9 Oct 2022 10:51:30 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sun, 9 Oct
 2022 10:51:29 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC:     <angelogioacchino.delregno@collabora.com>, <wenst@chromium.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH] clk: mediatek: clk-mt8195-topckgen: Fix error return code in clk_mt8195_topck_probe()
Date:   Sun, 9 Oct 2022 10:50:56 +0800
Message-ID: <20221009025056.35311-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If devm_clk_hw_register_mux() fails in clk_mt8195_topck_probe(), it should return
error code.

Fixes: deeb2af77cf6 ("clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as generic mux")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 8cbab5ca2e58..1e016329c1d2 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1270,8 +1270,10 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 	hw = devm_clk_hw_register_mux(&pdev->dev, "mfg_ck_fast_ref", mfg_fast_parents,
 				      ARRAY_SIZE(mfg_fast_parents), CLK_SET_RATE_PARENT,
 				      (base + 0x250), 8, 1, 0, &mt8195_clk_lock);
-	if (IS_ERR(hw))
+	if (IS_ERR(hw)) {
+		r = PTR_ERR(hw);
 		goto unregister_muxes;
+	}
 	top_clk_data->hws[CLK_TOP_MFG_CK_FAST_REF] = hw;
 
 	r = clk_mt8195_reg_mfg_mux_notifier(&pdev->dev,
-- 
2.25.1

