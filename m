Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499DDC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Dec 2022 09:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiL2Jiq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Dec 2022 04:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbiL2Jgq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Dec 2022 04:36:46 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE98C288
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 01:32:51 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NjNSM45NfzmWws;
        Thu, 29 Dec 2022 17:31:31 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 17:32:49 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC:     <johnson.wang@mediatek.com>, <edward-jw.yang@mediatek.com>,
        <angelogioacchino.delregno@collabora.com>, <wenst@chromium.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH] clk: mediatek: clk-pllfh: fix missing of_node_put() in fhctl_parse_dt()
Date:   Thu, 29 Dec 2022 17:29:46 +0800
Message-ID: <20221229092946.4162345-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The device_node pointer returned by of_find_compatible_node() with
refcount incremented, when finish using it, the refcount need be
decreased.

Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index f48780bec507..bc2b30a55f60 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -75,13 +75,13 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
-		return;
+		goto out_node_put;
 	}
 
 	num_clocks = of_clk_get_parent_count(node);
 	if (!num_clocks) {
 		pr_err("%s(): failed to get clocks property\n", __func__);
-		return;
+		goto out_node_put;
 	}
 
 	for (i = 0; i < num_clocks; i++) {
@@ -102,6 +102,9 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 		pllfh->state.ssc_rate = ssc_rate;
 		pllfh->state.base = base;
 	}
+
+out_node_put:
+	of_node_put(node);
 }
 
 static void pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_data)
-- 
2.25.1

