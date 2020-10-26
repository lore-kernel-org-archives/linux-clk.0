Return-Path: <SRS0=xpy6=EB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC1CC4363A
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 19:33:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 389A02085B
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 19:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1793267AbgJZTdZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Oct 2020 15:33:25 -0400
Received: from inva021.nxp.com ([92.121.34.21]:32838 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1793208AbgJZTdG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Oct 2020 15:33:06 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C7EEA20089E;
        Mon, 26 Oct 2020 20:33:04 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BBE46201712;
        Mon, 26 Oct 2020 20:33:04 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id F2EBC20308;
        Mon, 26 Oct 2020 20:33:03 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v4 14/14] arm64: dts: imx8mp: Add hdmi_blk_ctl node
Date:   Mon, 26 Oct 2020 21:32:30 +0200
Message-Id: <1603740750-10385-15-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603740750-10385-1-git-send-email-abel.vesa@nxp.com>
References: <1603740750-10385-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some of the features of the hdmi_ctl will be used by some
different drivers in a way those drivers will know best, so adding the
syscon compatible we allow those to do just that. Only the resets
and the clocks are registered bit the clk-blk-ctl driver.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 291e135..378f31b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -749,6 +749,13 @@
 				#clock-cells = <1>;
 				#reset-cells = <1>;
 			};
+
+			hdmi_blk_ctl: clock-controller@32fc0000 {
+				compatible = "fsl,imx8mp-hdmi-blk-ctl", "syscon";
+				reg = <0x32fc0000 0x1000>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
 		};
 
 		aips5: bus@30c00000 {
-- 
2.7.4

