Return-Path: <SRS0=Gp7K=VN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBA3C76195
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 15:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F46620665
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 15:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbfGPPXW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jul 2019 11:23:22 -0400
Received: from inva020.nxp.com ([92.121.34.13]:44520 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387878AbfGPPXW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jul 2019 11:23:22 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 977C31A0120;
        Tue, 16 Jul 2019 17:23:19 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BF9511A0071;
        Tue, 16 Jul 2019 17:23:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1D8E640302;
        Tue, 16 Jul 2019 23:23:07 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 09/11] clk: imx: lpcg: allow lpcg clk to take device pointer
Date:   Tue, 16 Jul 2019 23:01:03 +0800
Message-Id: <1563289265-10977-10-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Used to support runtime pm.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v3: new patch
---
 drivers/clk/imx/clk-lpcg-scu.c |  8 ++++----
 drivers/clk/imx/clk-scu.h      | 23 ++++++++++++++++++++---
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
index a73a799..3c092a0 100644
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
index a2c6b42..84efda3 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -24,6 +24,10 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 			     const char * const *parents, int num_parents,
 			     u32 rsrc_id, u8 clk_type);
 
+struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
+				  const char *parent_name, unsigned long flags,
+				  void __iomem *reg, u8 bit_idx, bool hw_gate);
+
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
 					 u8 clk_type)
 {
@@ -42,7 +46,20 @@ static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *
 		return __imx_clk_scu(NULL, name, parents, num_parents, rsrc_id, clk_type);
 }
 
-struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
-				unsigned long flags, void __iomem *reg,
-				u8 bit_idx, bool hw_gate);
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
+
 #endif
-- 
2.7.4

