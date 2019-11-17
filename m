Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2366DC432C3
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06437206D6
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfKQM1l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:27:41 -0500
Received: from inva020.nxp.com ([92.121.34.13]:49386 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbfKQM1l (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 17 Nov 2019 07:27:41 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3B21A1A06D4;
        Sun, 17 Nov 2019 13:27:38 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E9F561A0717;
        Sun, 17 Nov 2019 13:27:33 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 29908402E0;
        Sun, 17 Nov 2019 20:27:25 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH RESEND v5 09/11] clk: imx: lpcg: allow lpcg clk to take device pointer
Date:   Sun, 17 Nov 2019 20:25:17 +0800
Message-Id: <1573993519-14308-10-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
References: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Used to support runtime pm.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v5: no changes
v3: new patch
---
 drivers/clk/imx/clk-lpcg-scu.c |  8 ++++----
 drivers/clk/imx/clk-scu.h      | 24 ++++++++++++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
index 5740064b2fdb..67b506319cc5 100644
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
index 2db226a2401f..6b29713a71d2 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -23,6 +23,11 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 			     const char * const *parents, int num_parents,
 			     u32 rsrc_id, u8 clk_type);
 
+struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
+				  const char *parent_name, unsigned long flags,
+				  void __iomem *reg, u8 bit_idx, bool hw_gate);
+void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
+
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
 					 u8 clk_type, u8 clk_cells)
 {
@@ -42,8 +47,19 @@ static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *
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

