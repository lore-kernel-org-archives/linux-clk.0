Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44E5C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 20:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbiKPUfq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 15:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234171AbiKPUfo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 15:35:44 -0500
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0CDAFDF91
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 12:35:42 -0800 (PST)
Received: from localhost.localdomain ([146.241.88.137])
        by Aruba Outgoing Smtp  with ESMTPSA
        id vP8FomxyItoIqvP8Goagy7; Wed, 16 Nov 2022 21:35:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1668630941; bh=1RxVW5KCpXhFgBaNJICWglbFF2k9iM5qSPI06vp6GtA=;
        h=From:To:Subject:Date:MIME-Version;
        b=SgIhU2f7sEyliYuzsEt7hogNnLjCmcVbdyUvUDxu9Lsb/kVPONA55jYl2vzzIPIY5
         WuVENV8TXAveIkwdIzXPm0eFkw21qoB9/gRakuLrSXmfdlEvsmP3qMpTCUXW5j0gIx
         jOuYp/R/V01Lcfpmjk1ogHfmaGSIpeRqmtON6/G5zkdWDKs+0bxMWI8q+Gtz9RctAJ
         7+YTpaufX+nY9zPgg0NiPWE4wXXh6bibqpCifq/OEqLPASWFSy9kUbgUW3XfETw94h
         RvoInXePEabZb3v340i/wCiZsl5LO4XZCZ9kKUayvCW5p8v45wRJ5TYyVMPc7k3Gdc
         YQ2V38x/kudSA==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bough Chen <haibo.chen@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v3 2/4] clk: imx: imxrt1050: add IMXRT1050_CLK_LCDIF_PIX clock gate
Date:   Wed, 16 Nov 2022 21:35:18 +0100
Message-Id: <20221116203520.8300-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116203520.8300-1-giulio.benetti@benettiengineering.com>
References: <20221116203520.8300-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKx5FaIqFqCLaT2bT8qPI6x3L75kwSQJ5uxMO0unSZ4wyoq+uJXhGIapuYj7clSrWTQ20i7AliQJ3FilnPs95o2V8fAEVOKSrAMjXBg7A43WCf9G/jS7
 dIN3zjFFLJ18RjyssxB0DTLAXsB+nEH2o9xrbz1AWP+36rfFcwO0+6mlHNaqe2LUhGGpeLjjktejOC+cpnK0vqK7TN6RAaCHqmp5o570wGMEmsNCgyVq4dAW
 qjfR6V08cslB3LuZ68szQPnlORgIklaLQ/uDHyiZaFqGlxqGoadT15Y7VxyC1mPdSMdh1hDgtyJrzvS0SIpyu+xWsNH2W2Ii4D/pn3URjYYymkCitIxy+bqX
 JjCHix84n1k0Dt7P3xBHYqCg2ZTzPuQJ+XnnzGabonCmUmilcLynV6bxsi4y+NvUvSDvplcwZ6JRLiXYxJhAUoHAnl8ETt7STgSWhAUH1Kf8NB+q9Ry6CuHi
 9b5sLyLYyU5ex36pP/dbCJA+QNUkkbU62tKx5nv1ms0LExJj7SNFd16X5a6e53wggvXAUpDekJWxjFIJuZ76anyXy1w1FzS6XFxQBmiZAy5vFJkhSV1+SfXa
 IJLiqy2+ynJevWM5iRbL0D/CmTTy4fJIE4SaxDwYO/Vjps6cK4ze2PFdHxVbdRkjqJ51TEBtm6H6WmtNrXgTUCIpqFgSba59sHHOekUslvm8bDqUl8085aek
 tYNF+LTfVaTnfCGh4HdcoT2oayNYmEBltgzmBQVGr9TeE03LshHU0lgmuZw6B7S46Eq07cjb52oHxNoqBB5yw00t9MiL0dblGiW2MWoMWSF8IV58P7Ut8A==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add IMXRT1050_CLK_LCDIF_PIX clock gate.

Cc: Jesse Taube <mr.bossman075@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Jesse Taube <mr.bossman075@gmail.com>
---
V1->V2:
* nothing done
V2->V3:
* added commit log and not only subject as suggested by Jesse Taube
* added Jesse Taube's Acked-by:
---
 drivers/clk/imx/clk-imxrt1050.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
index 26108e9f7e67..39f77c03b892 100644
--- a/drivers/clk/imx/clk-imxrt1050.c
+++ b/drivers/clk/imx/clk-imxrt1050.c
@@ -141,6 +141,7 @@ static int imxrt1050_clocks_probe(struct platform_device *pdev)
 	hws[IMXRT1050_CLK_USDHC2] = imx_clk_hw_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
 	hws[IMXRT1050_CLK_LPUART1] = imx_clk_hw_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
 	hws[IMXRT1050_CLK_LCDIF_APB] = imx_clk_hw_gate2("lcdif", "lcdif_podf", ccm_base + 0x70, 28);
+	hws[IMXRT1050_CLK_LCDIF_PIX] = imx_clk_hw_gate2("lcdif_pix", "lcdif", ccm_base + 0x74, 10);
 	hws[IMXRT1050_CLK_DMA] = imx_clk_hw_gate("dma", "ipg", ccm_base + 0x7C, 6);
 	hws[IMXRT1050_CLK_DMA_MUX] = imx_clk_hw_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
 	imx_check_clk_hws(hws, IMXRT1050_CLK_END);
-- 
2.34.1

