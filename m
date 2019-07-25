Return-Path: <SRS0=7G01=VW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B78FC7618B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jul 2019 09:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C47422C7C
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jul 2019 09:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387744AbfGYJu6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Jul 2019 05:50:58 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57110 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbfGYJu5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Jul 2019 05:50:57 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4B2FF20066C;
        Thu, 25 Jul 2019 11:50:56 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3CBE9200667;
        Thu, 25 Jul 2019 11:50:56 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6BD3E205E8;
        Thu, 25 Jul 2019 11:50:55 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>
Cc:     Li Jun <jun.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx8mm: Fix boot hang at clk init
Date:   Thu, 25 Jul 2019 12:50:53 +0300
Message-Id: <718c781b77081d6974fd91d5dff7b0f8737757b0.1564048197.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The assigned-clock-rates property is incorrect (4 elements while
assigned-clocks has length 5) and boot hangs while assigning some
unexpected rates.

Fix by inserting another <400000000>, the intention is to assign both
IMX8MM_CLK_AUDIO_AHB and IMX8MM_CLK_IPG_AUDIO_ROOT 400mhz.

Fixes: df1703896a17 ("arm64: dts: imx8mm: Init rates and parents configs for clocks")

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

---
Changes since v1:
* Insert and 400mhz instead of <0>
Link to v1: https://patchwork.kernel.org/patch/11057515/

Should probably be squashed into df1703896a17

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index c9a7c0054c5c..7bbdcebc6b57 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -461,10 +461,11 @@
 						<&clk IMX8MM_SYS_PLL3>,
 						<&clk IMX8MM_VIDEO_PLL1>;
 				assigned-clock-parents = <&clk IMX8MM_SYS_PLL3_OUT>,
 							 <&clk IMX8MM_SYS_PLL1_800M>;
 				assigned-clock-rates = <0>,
+							<400000000>,
 							<400000000>,
 							<750000000>,
 							<594000000>;
 			};
 
-- 
2.17.1

