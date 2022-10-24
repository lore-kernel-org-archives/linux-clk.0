Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599B0ECAAA1
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 19:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbiJXTLG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 15:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbiJXTKi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 15:10:38 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C002DD7
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 10:49:24 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B9BB480076;
        Mon, 24 Oct 2022 17:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666624195;
        bh=Yx8gNpZwSkH+u0dz5auO3h/0qkztyKzZiTPX1tvLoFU=;
        h=From:To:Cc:Subject:Date:From;
        b=XGZxABIi+H55GxLTX6rRXt74ktWxpKxOYYkieXir3zuLbfSGXrX/c8DnrhAhc78/N
         4v0HMA2xYraCRBohwE8or11wObxuF2L/Fs5RY8TzQNq4x2+O8FF/UPx4ya3mRJCDLU
         XdKiwcaNWx9lpdKrLHTN2tyna4Dd0CHfrKsBsV4O1x4ywlTkRlCfwbQhHcptf2jZrE
         VWyrAkSeLqhBDpOmRuzMuwYXEQWaSrFuyXsUMTfRbILguc3NsXJC+buM31K3lV9p8I
         CEvogBFJh57nBxrgsRTS1i6tLjDTbcODakOtLMgAIy1XtZE1fa/dCHha3xemFOCegC
         spUUPudaGmyfA==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@denx.de>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH] [RFC] soc: imx: imx8m-blk-ctrl: Split clock prepare from clock enable in the domain
Date:   Mon, 24 Oct 2022 17:09:47 +0200
Message-Id: <20221024150947.10739-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It is possible for clk_disable_unused() to trigger lockdep warning
regarding lock ordering in this driver. This happens in case of the
following conditions:

A) clock core clk_disable_unused() triggers the following sequence in a
   driver which also uses blkctrl domain:
   - clk_prepare_lock() -> obtains clock core prepare_lock
   - pm_runtime_get*() -> obtains &blk_ctrl_genpd_lock_class

B) driver powers up a power domain and triggers the following sequence
   in blkctrl:
   - pm_runtime_get_sync() -> obtains &blk_ctrl_genpd_lock_class
   - clk_bulk_prepare_enable() -> obtains clock core prepare_lock

This can lead to a deadlock in case A and B runs on separate CPUs.

To avoid the deadlock, split clk_*prepare() from clk_*enable() and
call the former before pm_runtime_get_sync(). This way, the blkctrl
driver always claims the prepare_lock before blk_ctrl_genpd_lock_class
and the deadlock is avoided.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-imx@nxp.com
To: linux-arm-kernel@lists.infradead.org
---
 drivers/soc/imx/imx8mp-blk-ctrl.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/imx/imx8mp-blk-ctrl.c b/drivers/soc/imx/imx8mp-blk-ctrl.c
index b7d4161fcda9c..571c98b5b005b 100644
--- a/drivers/soc/imx/imx8mp-blk-ctrl.c
+++ b/drivers/soc/imx/imx8mp-blk-ctrl.c
@@ -393,15 +393,21 @@ static int imx8mp_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 	struct imx8mp_blk_ctrl *bc = domain->bc;
 	int ret;
 
+	ret = clk_bulk_prepare(data->num_clks, domain->clks);
+	if (ret) {
+		dev_err(bc->dev, "failed to enable clocks\n");
+		return ret;
+	}
+
 	/* make sure bus domain is awake */
 	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
 	if (ret < 0) {
 		dev_err(bc->dev, "failed to power up bus domain\n");
-		return ret;
+		goto rpm_put;
 	}
 
 	/* enable upstream clocks */
-	ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
+	ret = clk_bulk_enable(data->num_clks, domain->clks);
 	if (ret) {
 		dev_err(bc->dev, "failed to enable clocks\n");
 		goto bus_put;
@@ -426,9 +432,11 @@ static int imx8mp_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 	return 0;
 
 clk_disable:
-	clk_bulk_disable_unprepare(data->num_clks, domain->clks);
+	clk_bulk_disable(data->num_clks, domain->clks);
 bus_put:
 	pm_runtime_put(bc->bus_power_dev);
+rpm_put:
+	clk_bulk_unprepare(data->num_clks, domain->clks);
 
 	return ret;
 }
-- 
2.35.1

