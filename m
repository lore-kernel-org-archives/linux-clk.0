Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398A8C4321E
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 20:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbiKPUfp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 15:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbiKPUfo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 15:35:44 -0500
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C4933AE7B
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 12:35:41 -0800 (PST)
Received: from localhost.localdomain ([146.241.88.137])
        by Aruba Outgoing Smtp  with ESMTPSA
        id vP8FomxyItoIqvP8Goagxh; Wed, 16 Nov 2022 21:35:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1668630940; bh=Fh4mbulo6FHv5De1d10u87IV2cruNNbHjVbqsAACBS8=;
        h=From:To:Subject:Date:MIME-Version;
        b=AGDVwmtS3aJ0mmwTavxzSBolO1TgCarY9OpvselZDyrW430kWoEAophTNw8bdaRrq
         UeHhLv5PaF+osPuQM9Xsy7XP+eu9Y8axIcHgZRJRwoTOSb93HX6GEpARpHC8aQ+ooX
         ZfmuDQzrschCBUgYt7NART4xRWocA7Yq9+s7OPetTZ+91+OpD7xQ7pzqsIvpM72Dct
         VxedLWvNM8rdt6daXInzNwD/ygQLD/QnVZwQ2dIG+yhT1SnFI4Sz6Og7praEtgf3nu
         0p33HJcj3mDhGugFvGhOjMSjv+sU6wip1+ERTifKEts7AoqWOJiVBHdYgF/rZM6I6O
         FbkAoQiDVGwCw==
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
Subject: [PATCH v3 1/4] clk: imx: imxrt1050: fix IMXRT1050_CLK_LCDIF_APB offsets
Date:   Wed, 16 Nov 2022 21:35:17 +0100
Message-Id: <20221116203520.8300-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAfxVgfJweJS6Vdvtz2HYiuEmyNRKGqCeoiUtpP+84sQyUnrk+eb21ftZA0ylW2DcVbxhyuERT/1QXde/oTq1AiAE6dN+PIsOmjOGhipYGnIOr4Hi3vr
 ZifsOOxsA0tBeg9YZWBKSAvQ6cBKguWG3PVfoavLilLaFiLGiUJWsUB2Zxgt0hysUt4T5wvLdvaFhZagAZ9oiGIBtcArrne8EGw1WO4CsB9kumNvjp3E/r8s
 jXq4/4IzK4Y6xVOYoB/MA1OjS8tbraBNpffVL1f4YLFF74OkrWRdeieAez/GhFigfZbgvzdFMHxSBiLuTd6Zzv3S9vm1stRRdFxo8t/maIHBt8tv5loakFZ5
 P7rUMN4cM6GCaqDcHWAEkjFwnNiLKF4yQK/Lj+Ga2tiXt4WH9fIFb2WHJazbcQlHuniLkVL9uQncH2bvKG2TG/fsxYQeXwUMwnrRK9/CZ+gsNMYddYAW59RI
 NxDai6GoWw+fDOjBMsUpMunL58vu9sFf77lEFicycuUPCE1z4SQOhUjlQxMVEd7YuxZ95cmSoUpwfYRtFdBfOncZdpt7lZRYN0LSe7m1SJ7kJvxAtUlj6+IR
 YrLUFc0iBESDXTJwqjNI3DKlaHPpRn/drmVEfpJXIysPX/TyvjbxtTvFbhMiOPhQOjhZo01VyWNIyyzElKN3bEpEIDnz+qm9idr5iZBDP0lXIY9SpxXbY8/c
 RjGzOvdlx/4VdkjRDQy3Y4vl1LdhbSFXohGq4Z8t+WmFEUtHVjR8ST2fsTissdnIIxCxYxcIMDadQoRy/eJndI7p8lJ+HnDQYBV8qZR3j7+DskyMrW/qQQ==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix IMXRT1050_CLK_LCDIF_APB offsets.

Cc: Jesse Taube <mr.bossman075@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* nothing done
V2->V3:
* added commit log and not only subject as suggested by Jesse Taube
---
 drivers/clk/imx/clk-imxrt1050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
index 9539d35588ee..26108e9f7e67 100644
--- a/drivers/clk/imx/clk-imxrt1050.c
+++ b/drivers/clk/imx/clk-imxrt1050.c
@@ -140,7 +140,7 @@ static int imxrt1050_clocks_probe(struct platform_device *pdev)
 	hws[IMXRT1050_CLK_USDHC1] = imx_clk_hw_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
 	hws[IMXRT1050_CLK_USDHC2] = imx_clk_hw_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
 	hws[IMXRT1050_CLK_LPUART1] = imx_clk_hw_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
-	hws[IMXRT1050_CLK_LCDIF_APB] = imx_clk_hw_gate2("lcdif", "lcdif_podf", ccm_base + 0x74, 10);
+	hws[IMXRT1050_CLK_LCDIF_APB] = imx_clk_hw_gate2("lcdif", "lcdif_podf", ccm_base + 0x70, 28);
 	hws[IMXRT1050_CLK_DMA] = imx_clk_hw_gate("dma", "ipg", ccm_base + 0x7C, 6);
 	hws[IMXRT1050_CLK_DMA_MUX] = imx_clk_hw_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
 	imx_check_clk_hws(hws, IMXRT1050_CLK_END);
-- 
2.34.1

