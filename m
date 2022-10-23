Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14DFFA373E
	for <linux-clk@archiver.kernel.org>; Sun, 23 Oct 2022 16:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiJWQlI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Oct 2022 12:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiJWQlH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 12:41:07 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A11534986
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 09:41:01 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 857AC848A1;
        Sun, 23 Oct 2022 18:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666543257;
        bh=6JQ7AfwduSszHXHlETY0G1z0X3gKVn5kR1ZBqvsrG18=;
        h=From:To:Cc:Subject:Date:From;
        b=IMXvZF6d+Pps1gb1WrqRbrVvr6+MRVNNWbwwdbfo6C0DQhH/cLqj2S96ZCqvztr6x
         hiGV5uDePrZMqf9MExHrACAfHCVDTGY7ls+8/c+CHuqW5Qp4La9zQK8UnjNqqS8txc
         RUx4urxzzYtKeyIN8UrOUq0l3y1ddB0qC/rSH9CDHdv4g/w0WwjiOsAfi/4Wa0c3Eq
         p2ZJAmlBKXJq1GyLTNETxxtDFZ6DRwulFKG2nBLzh5RC0xnkDU9agRGSYRkTto5P1l
         swPLmrb7yFn1ykqdXqosO8a9ncMxawWBIVpnvthPPQI0Apc0DHmD/kJZhTQLOlaR++
         R3YRaZAPLQ7cQ==
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
Subject: [PATCH] [RFC] soc: imx: gpcv2: Split clock prepare from clock enable in the domain
Date:   Sun, 23 Oct 2022 18:40:00 +0200
Message-Id: <20221023164000.555654-1-marex@denx.de>
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
   driver which also uses GPCv2 domain:
   - clk_prepare_lock() -> obtains clock core prepare_lock
   - pm_runtime_get*() -> obtains &blk_ctrl_genpd_lock_class

B) driver powers up a power domain and triggers the following sequence
   in GPCv2:
   - pm_runtime_get_sync() -> obtains &blk_ctrl_genpd_lock_class
   - clk_bulk_prepare_enable() -> obtains clock core prepare_lock

This can lead to a deadlock in case A and B runs on separate CPUs.

To avoid the deadlock, split clk_*prepare() from clk_*enable() and
call the former before pm_runtime_get_sync(). This way, the GPCv2
driver always claims the prepare_lock before blk_ctrl_genpd_lock_class
and the deadlock is avoided.

The imx8m and imx8mp block controller drivers likely need similar fix.

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
 drivers/soc/imx/gpcv2.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
index 88aee59730e39..ee9294ad25ba1 100644
--- a/drivers/soc/imx/gpcv2.c
+++ b/drivers/soc/imx/gpcv2.c
@@ -319,10 +319,16 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
 	u32 reg_val, pgc;
 	int ret;
 
+	ret = clk_bulk_prepare(domain->num_clks, domain->clks);
+	if (ret) {
+		dev_err(domain->dev, "failed to prepare reset clocks\n");
+		return ret;
+	}
+
 	ret = pm_runtime_get_sync(domain->dev);
 	if (ret < 0) {
 		pm_runtime_put_noidle(domain->dev);
-		return ret;
+		goto out_clock_unprepare;
 	}
 
 	if (!IS_ERR(domain->regulator)) {
@@ -338,7 +344,7 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
 	reset_control_assert(domain->reset);
 
 	/* Enable reset clocks for all devices in the domain */
-	ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
+	ret = clk_bulk_enable(domain->num_clks, domain->clks);
 	if (ret) {
 		dev_err(domain->dev, "failed to enable reset clocks\n");
 		goto out_regulator_disable;
@@ -402,12 +408,14 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
 	return 0;
 
 out_clk_disable:
-	clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
+	clk_bulk_disable(domain->num_clks, domain->clks);
 out_regulator_disable:
 	if (!IS_ERR(domain->regulator))
 		regulator_disable(domain->regulator);
 out_put_pm:
 	pm_runtime_put(domain->dev);
+out_clock_unprepare:
+	clk_bulk_unprepare(domain->num_clks, domain->clks);
 
 	return ret;
 }
-- 
2.35.1

