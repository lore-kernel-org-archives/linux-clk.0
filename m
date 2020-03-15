Return-Path: <SRS0=qW/6=5A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36C5C5ACD7
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 13:50:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADD3020663
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 13:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgCONuy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Mar 2020 09:50:54 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55444 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727778AbgCONuy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 15 Mar 2020 09:50:54 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 64BE41A04CE;
        Sun, 15 Mar 2020 14:50:52 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 96ABD1A0528;
        Sun, 15 Mar 2020 14:50:47 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0CB87402C1;
        Sun, 15 Mar 2020 21:50:40 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V6 12/12] clk: imx: scu: unregister clocks if add provider failed
Date:   Sun, 15 Mar 2020 21:43:56 +0800
Message-Id: <1584279836-29825-13-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unregister clocks if add provider failed

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

---
ChangeLog:
v6: new patch
---
 drivers/clk/imx/clk-imx8qxp.c | 11 +++++++++--
 drivers/clk/imx/clk-scu.c     | 13 +++++++++++++
 drivers/clk/imx/clk-scu.h     |  2 ++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 2ec3e0c4749d..e615214495c0 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -138,10 +138,17 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 				i, PTR_ERR(clks[i]));
 	}
 
-	if (clk_cells == 2)
+	if (clk_cells == 2) {
 		ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
-	else
+		if (ret)
+			imx_clk_scu_unregister();
+	} else {
+		/*
+		 * NOTE: we did not unregister clocks for the legacy way cause
+		 * it will be removed later.
+		 */
 		ret = of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
+	}
 
 	return ret;
 }
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 7b910922aecf..1933cf90ae30 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -595,3 +595,16 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 	/* For API backwards compatiblilty, simply return NULL for success */
 	return NULL;
 }
+
+void imx_clk_scu_unregister(void)
+{
+	struct imx_scu_clk_node *clk;
+	int i;
+
+	for (i = 0; i < IMX_SC_R_LAST; i++) {
+		list_for_each_entry(clk, &imx_scu_clks[i], node) {
+			clk_hw_unregister(clk->hw);
+			kfree(clk);
+		}
+	}
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index b1dfdaf0734e..e8352164923e 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -24,6 +24,8 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 			     const char * const *parents, int num_parents,
 			     u32 rsrc_id, u8 clk_type);
 
+void imx_clk_scu_unregister(void);
+
 struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
 				  const char *parent_name, unsigned long flags,
 				  void __iomem *reg, u8 bit_idx, bool hw_gate);
-- 
2.23.0

