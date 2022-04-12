Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BF0C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 19:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347412AbiDLTno (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 15:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359138AbiDLTmk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 15:42:40 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16CA4A3D2
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 12:40:04 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2D890200002;
        Tue, 12 Apr 2022 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649792398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gDMgEYZK2TXVp0tig+qscRTbrixY++njrNcYKAKseyE=;
        b=ULacIuA629hgYD2MgoH0xFbz65HWDpG6veG/exq1g5EC57bFBrh1V8/haFzMMGHwkPMPzJ
        4rEpoUOJAb+EOkyWMRjb9ibXvEKvHfz5ondy5mgXFkV3FYFVPdgR9Gp1bwiMDi4jfW13Wi
        guXEUnssmwirK9jA9oVRBC4LCtQg0cZSigFaMqxg4fQ5jR5KbJrNAbXMSXIM1eUo6dMBHA
        ybruFjo6MCE9wPi2APpxutZejWojipE6i1Yrs3ygR+YRP6moIZ1xCx+vyXLnbB3Op2zNi4
        2vD/fT65EVK92iwQKOCD/nOyfnBlHJtUaSpI13QurgjcxdPshmT7MCZVdzRB3Q==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v10 9/9] ARM: dts: r9a06g032: Describe the DMA router
Date:   Tue, 12 Apr 2022 21:39:36 +0200
Message-Id: <20220412193936.63355-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412193936.63355-1-miquel.raynal@bootlin.com>
References: <20220412193936.63355-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is a dmamux on this SoC which allows picking two different sources
for a single DMA request.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 839580ec21ee..c854aa4cfa77 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -91,6 +91,16 @@ sysctrl: system-controller@4000c000 {
 			clocks = <&ext_mclk>, <&ext_rtc_clk>,
 					<&ext_jtag_clk>, <&ext_rgmii_ref>;
 			clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			dmamux: dma-router@a0 {
+				compatible = "renesas,rzn1-dmamux";
+				reg = <0xa0 4>;
+				#dma-cells = <6>;
+				dma-requests = <32>;
+				dma-masters = <&dma0 &dma1>;
+			};
 		};
 
 		uart0: serial@40060000 {
-- 
2.27.0

