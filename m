Return-Path: <SRS0=BIUh=BI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFC7C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B91E121D95
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgG2IEt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:04:49 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34490 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727978AbgG2IEt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 29 Jul 2020 04:04:49 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A7A421A0F4B;
        Wed, 29 Jul 2020 10:04:47 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B31D61A0F43;
        Wed, 29 Jul 2020 10:04:43 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E392140320;
        Wed, 29 Jul 2020 10:04:35 +0200 (CEST)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v7 05/11] clk: imx: scu: allow scu clk to take device pointer
Date:   Wed, 29 Jul 2020 16:00:12 +0800
Message-Id: <1596009618-25516-6-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Used to support runtime pm.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v7:
 * no changes
v3->v4:
 * add the missing dev poninter when call __imx_clk_scu in probe
v3: new patch
---
 drivers/clk/imx/clk-scu.c | 9 +++++----
 drivers/clk/imx/clk-scu.h | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index dae2529bf64e..a67cca0a32ad 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -387,8 +387,9 @@ static const struct clk_ops clk_scu_cpu_ops = {
 	.unprepare = clk_scu_unprepare,
 };
 
-struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
-			     int num_parents, u32 rsrc_id, u8 clk_type)
+struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
+			     const char * const *parents, int num_parents,
+			     u32 rsrc_id, u8 clk_type)
 {
 	struct clk_init_data init;
 	struct clk_scu *clk;
@@ -422,7 +423,7 @@ struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
 	clk->hw.init = &init;
 
 	hw = &clk->hw;
-	ret = clk_hw_register(NULL, hw);
+	ret = clk_hw_register(dev, hw);
 	if (ret) {
 		kfree(clk);
 		hw = ERR_PTR(ret);
@@ -453,7 +454,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	struct imx_scu_clk_node *clk = dev_get_platdata(dev);
 	struct clk_hw *hw;
 
-	hw = __imx_clk_scu(clk->name, clk->parents, clk->num_parents,
+	hw = __imx_clk_scu(NULL, clk->name, clk->parents, clk->num_parents,
 			   clk->rsrc, clk->clk_type);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index f7480898ea74..22976d64a96a 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -19,8 +19,9 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 				     const char * const *parents,
 				     int num_parents, u32 rsrc_id, u8 clk_type);
 
-struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
-			     int num_parents, u32 rsrc_id, u8 clk_type);
+struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
+			     const char * const *parents, int num_parents,
+			     u32 rsrc_id, u8 clk_type);
 
 void imx_clk_scu_unregister(void);
 
@@ -30,7 +31,7 @@ static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
 	if (clk_cells == 2)
 		return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
 	else
-		return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
+		return __imx_clk_scu(NULL, name, NULL, 0, rsrc_id, clk_type);
 }
 
 static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *parents,
@@ -40,7 +41,7 @@ static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *
 	if (clk_cells == 2)
 		return imx_clk_scu_alloc_dev(name, parents, num_parents, rsrc_id, clk_type);
 	else
-		return __imx_clk_scu(name, parents, num_parents, rsrc_id, clk_type);
+		return __imx_clk_scu(NULL, name, parents, num_parents, rsrc_id, clk_type);
 }
 
 struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
-- 
2.23.0

