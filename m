Return-Path: <SRS0=VuHU=VV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F9AC76186
	for <linux-clk@archiver.kernel.org>; Wed, 24 Jul 2019 19:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1090C216C8
	for <linux-clk@archiver.kernel.org>; Wed, 24 Jul 2019 19:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbfGXTRU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Jul 2019 15:17:20 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49074 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbfGXTRU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Jul 2019 15:17:20 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7BC431A00DC;
        Wed, 24 Jul 2019 21:17:18 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6FB0E1A0067;
        Wed, 24 Jul 2019 21:17:18 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D943C205D8;
        Wed, 24 Jul 2019 21:17:17 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx8mm: Fix boot hang at clk init
Date:   Wed, 24 Jul 2019 22:17:15 +0300
Message-Id: <62d9c73aafcdc171edcd9e03fa81f451a42d5227.1563995813.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The assigned-clock-rates property is incorrect (shorter than
assigned-clocks) and boot hangs becuause incorrect rates are assigned.

Fix by inserting another <0>

Fixes: df1703896a17 ("arm64: dts: imx8mm: Init rates and parents configs for clocks")

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
Found in next-20190724 because that's when df1703896a17 was included.
Perhaps this should be squashed?

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index c9a7c0054c5c..8737f833cf9c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -461,10 +461,11 @@
 						<&clk IMX8MM_SYS_PLL3>,
 						<&clk IMX8MM_VIDEO_PLL1>;
 				assigned-clock-parents = <&clk IMX8MM_SYS_PLL3_OUT>,
 							 <&clk IMX8MM_SYS_PLL1_800M>;
 				assigned-clock-rates = <0>,
+							<0>,
 							<400000000>,
 							<750000000>,
 							<594000000>;
 			};
 
-- 
2.17.1

