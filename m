Return-Path: <SRS0=z1pn=WQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FE9C3A59D
	for <linux-clk@archiver.kernel.org>; Tue, 20 Aug 2019 11:32:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FF67205C9
	for <linux-clk@archiver.kernel.org>; Tue, 20 Aug 2019 11:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbfHTLcM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Aug 2019 07:32:12 -0400
Received: from inva021.nxp.com ([92.121.34.21]:48910 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729699AbfHTLcM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Aug 2019 07:32:12 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7E75E20006A;
        Tue, 20 Aug 2019 13:32:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0013C20029A;
        Tue, 20 Aug 2019 13:32:04 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7FD414031C;
        Tue, 20 Aug 2019 19:31:55 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V4 05/11] clk: imx: scu: allow scu clk to take device pointer
Date:   Tue, 20 Aug 2019 07:13:19 -0400
Message-Id: <1566299605-15641-6-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Used to support runtime pm.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v3->v4:
 * add the missing dev poninter when call __imx_clk_scu in probe
v3: new patch
---
 drivers/clk/imx/clk-scu.c | 9 +++++----
 drivers/clk/imx/clk-scu.h | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 5f935b1..9005584 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -382,8 +382,9 @@ static const struct clk_ops clk_scu_cpu_ops = {
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
@@ -417,7 +418,7 @@ struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
 	clk->hw.init = &init;
 
 	hw = &clk->hw;
-	ret = clk_hw_register(NULL, hw);
+	ret = clk_hw_register(dev, hw);
 	if (ret) {
 		kfree(clk);
 		hw = ERR_PTR(ret);
@@ -448,7 +449,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	struct imx_scu_clk_node *clk = dev_get_platdata(dev);
 	struct clk_hw *hw;
 
-	hw = __imx_clk_scu(clk->name, clk->parents, clk->num_parents,
+	hw = __imx_clk_scu(NULL, clk->name, clk->parents, clk->num_parents,
 			   clk->rsrc, clk->clk_type);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 819dc32..a2c6b42 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -20,8 +20,9 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 				     const char * const *parents,
 				     int num_parents, u32 rsrc_id, u8 clk_type);
 
-struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
-			     int num_parents, u32 rsrc_id, u8 clk_type);
+struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
+			     const char * const *parents, int num_parents,
+			     u32 rsrc_id, u8 clk_type);
 
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
 					 u8 clk_type)
@@ -29,7 +30,7 @@ static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
 	if (clock_cells == 2)
 		return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
 	else
-		return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
+		return __imx_clk_scu(NULL, name, NULL, 0, rsrc_id, clk_type);
 }
 
 static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *parents,
@@ -38,7 +39,7 @@ static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *
 	if (clock_cells == 2)
 		return imx_clk_scu_alloc_dev(name, parents, num_parents, rsrc_id, clk_type);
 	else
-		return __imx_clk_scu(name, parents, num_parents, rsrc_id, clk_type);
+		return __imx_clk_scu(NULL, name, parents, num_parents, rsrc_id, clk_type);
 }
 
 struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
-- 
2.7.4

