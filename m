Return-Path: <SRS0=BIUh=BI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334F2C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D01821D95
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgG2IEv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:04:51 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52716 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbgG2IEv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 29 Jul 2020 04:04:51 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 63AF220015A;
        Wed, 29 Jul 2020 10:04:49 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A4735200126;
        Wed, 29 Jul 2020 10:04:45 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id ABA99402DF;
        Wed, 29 Jul 2020 10:04:39 +0200 (CEST)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v7 09/11] clk: imx: lpcg: allow lpcg clk to take device pointer
Date:   Wed, 29 Jul 2020 16:00:16 +0800
Message-Id: <1596009618-25516-10-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Used to support runtime pm.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v7: no changes
v3: new patch
---
 drivers/clk/imx/clk-lpcg-scu.c |  8 ++++----
 drivers/clk/imx/clk-scu.h      | 24 ++++++++++++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
index 897a4c3c02e2..2242e5047a0e 100644
--- a/drivers/clk/imx/clk-lpcg-scu.c
+++ b/drivers/clk/imx/clk-lpcg-scu.c
@@ -80,9 +80,9 @@ static const struct clk_ops clk_lpcg_scu_ops = {
 	.disable = clk_lpcg_scu_disable,
 };
 
-struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
-				unsigned long flags, void __iomem *reg,
-				u8 bit_idx, bool hw_gate)
+struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
+				  const char *parent_name, unsigned long flags,
+				  void __iomem *reg, u8 bit_idx, bool hw_gate)
 {
 	struct clk_lpcg_scu *clk;
 	struct clk_init_data init;
@@ -106,7 +106,7 @@ struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
 	clk->hw.init = &init;
 
 	hw = &clk->hw;
-	ret = clk_hw_register(NULL, hw);
+	ret = clk_hw_register(dev, hw);
 	if (ret) {
 		kfree(clk);
 		hw = ERR_PTR(ret);
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 6a879526b3d5..faee1ba5c4ee 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -25,6 +25,11 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 
 void imx_clk_scu_unregister(void);
 
+struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
+				  const char *parent_name, unsigned long flags,
+				  void __iomem *reg, u8 bit_idx, bool hw_gate);
+void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
+
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
 					 u8 clk_type, u8 clk_cells)
 {
@@ -44,8 +49,19 @@ static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *
 		return __imx_clk_scu(NULL, name, parents, num_parents, rsrc_id, clk_type);
 }
 
-struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
-				unsigned long flags, void __iomem *reg,
-				u8 bit_idx, bool hw_gate);
-void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
+static inline struct clk_hw *imx_clk_lpcg_scu_dev(struct device *dev, const char *name,
+						  const char *parent_name, unsigned long flags,
+						  void __iomem *reg, u8 bit_idx, bool hw_gate)
+{
+	return __imx_clk_lpcg_scu(dev, name, parent_name, flags, reg,
+				  bit_idx, hw_gate);
+}
+
+static inline struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
+					      unsigned long flags, void __iomem *reg,
+					      u8 bit_idx, bool hw_gate)
+{
+	return __imx_clk_lpcg_scu(NULL, name, parent_name, flags, reg,
+				  bit_idx, hw_gate);
+}
 #endif
-- 
2.23.0

