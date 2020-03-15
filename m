Return-Path: <SRS0=qW/6=5A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AD3C10DCE
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 13:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3968F20663
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 13:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgCONuw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Mar 2020 09:50:52 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55338 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727498AbgCONuv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 15 Mar 2020 09:50:51 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F05D31A04DF;
        Sun, 15 Mar 2020 14:50:49 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2D8F31A04E7;
        Sun, 15 Mar 2020 14:50:45 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CD4854030B;
        Sun, 15 Mar 2020 21:50:36 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V6 07/12] clk: imx: scu: add suspend/resume support
Date:   Sun, 15 Mar 2020 21:43:51 +0800
Message-Id: <1584279836-29825-8-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Clock state will be lost when its power domain is completely off
during system suspend/resume. So we save and restore the state
accordingly in suspend/resume callback.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v5:
 * make suspend/resume function static
v4: no changes
v3: new patch
---
 drivers/clk/imx/clk-scu.c | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 7c7a839a3569..7b910922aecf 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -45,6 +45,10 @@ struct clk_scu {
 	struct clk_hw hw;
 	u16 rsrc_id;
 	u8 clk_type;
+
+	/* for state save&restore */
+	bool is_enabled;
+	u32 rate;
 };
 
 /*
@@ -427,6 +431,9 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 		hw = ERR_PTR(ret);
 	}
 
+	if (dev)
+		dev_set_drvdata(dev, clk);
+
 	return hw;
 }
 
@@ -483,10 +490,52 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
+{
+	struct clk_scu *clk = dev_get_drvdata(dev);
+
+	clk->rate = clk_hw_get_rate(&clk->hw);
+	clk->is_enabled = clk_hw_is_enabled(&clk->hw);
+
+	if (clk->rate)
+		dev_dbg(dev, "save rate %d\n", clk->rate);
+
+	if (clk->is_enabled)
+		dev_dbg(dev, "save enabled state\n");
+
+	return 0;
+}
+
+static int __maybe_unused imx_clk_scu_resume(struct device *dev)
+{
+	struct clk_scu *clk = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (clk->rate) {
+		ret = clk_scu_set_rate(&clk->hw, clk->rate, 0);
+		dev_dbg(dev, "restore rate %d %s\n", clk->rate,
+			!ret ? "success" : "failed");
+	}
+
+	if (clk->is_enabled) {
+		ret = clk_scu_prepare(&clk->hw);
+		dev_dbg(dev, "restore enabled state %s\n",
+			!ret ? "success" : "failed");
+	}
+
+	return ret;
+}
+
+static const struct dev_pm_ops imx_clk_scu_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_clk_scu_suspend,
+				      imx_clk_scu_resume)
+};
+
 static struct platform_driver imx_clk_scu_driver = {
 	.driver = {
 		.name = "imx-scu-clk",
 		.suppress_bind_attrs = true,
+		.pm = &imx_clk_scu_pm_ops,
 	},
 	.probe = imx_clk_scu_probe,
 };
-- 
2.23.0

