Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3ADC83F16
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 09:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjH0JqN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Aug 2023 05:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbjH0Jp7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Aug 2023 05:45:59 -0400
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 09F6710D
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 02:45:52 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id aCDYqs7H09KIfaCDtq3nYr; Sun, 27 Aug 2023 11:38:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1693129101;
        bh=qhuQ6UNsFUTemQzGujstryJyMiE4Em6qSWkpxgpWDqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DmXSgHOSFNiAOlGSQRm/3mR0BBWewJyG3gQrTv5gPGt12LklZqc0KIFph5X0/zrpU
         uzfu8+7vVNeej1qCEdwbVDpVzpbl4C8lycjMf/TkKF4uTiejqCAA2GpFpcwIrapAXY
         GqtIgaopOWS8rK6W899cKGzD4FDCV8ThCJYvWNCzqibNp9hWdzYobkvd+22X8rtZav
         uuUVwiDT7RwGOTKB3eP/edYGz90Stb4EX8FgH+mh9tdCLH/v+pRrH1TmeFg+4FvFId
         TbcEPYTkKIyY6cQF0ZPeDxgjdVxB1WaxsUeMUJd/HFYV1MTLP7TwVsGQYyPWdBj4of
         iYtrtFigrD4sg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 27 Aug 2023 11:38:21 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@nxp.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/5] clk: imx: imx8: Fix an error handling path if devm_clk_hw_register_mux_parent_data_table() fails
Date:   Sun, 27 Aug 2023 11:37:53 +0200
Message-Id: <6bd11f11ccbf23bb6735daf3b3780f1f24528647.1693126687.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693126687.git.christophe.jaillet@wanadoo.fr>
References: <cover.1693126687.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If a devm_clk_hw_register_mux_parent_data_table() call fails, it is likely
that the probe should fail with an error code.

Set ret before leaving the function.

Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative, review with care.
---
 drivers/clk/imx/clk-imx8-acm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index 87025a6772d0..0cd9aa3629f3 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -373,6 +373,7 @@ static int imx8_acm_clk_probe(struct platform_device *pdev)
 										sels[i].shift, sels[i].width,
 										0, NULL, NULL);
 		if (IS_ERR(hws[sels[i].clkid])) {
+			ret = PTR_ERR(hws[sels[i].clkid]);
 			pm_runtime_disable(&pdev->dev);
 			goto err_clk_register;
 		}
-- 
2.34.1

