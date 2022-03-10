Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E6FC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 10 Mar 2022 15:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbiCJP7g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:59:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239513AbiCJP7f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Mar 2022 10:59:35 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD8C15F373;
        Thu, 10 Mar 2022 07:58:31 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3B029200004;
        Thu, 10 Mar 2022 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646927906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Uy3xMiCeqQ87JLlqai2jsXrx2//qDPrOCXzM+XIFa1E=;
        b=aNoob1WG6iGF5gZu3S3nbzrYvvHwuLanw6TyZpoXeUkHVtensdopYAiFatLWaG42AHj6y1
        B1Zq2RY3CV3mk1nJC3ZO+/CYW2I7sXmhcZqPNuXdsShs0j9r/UwiaSHXPEZGKrqzFRmU8Z
        cqCt5mS7gMScPiy0uop43ZGrpM/lwBVYEf+BnkuMh5l5DeBiiRRETC+wNV1YhPEdsd5Xj7
        JC0GONCJm5XDuQK3MAWpPwyojbYrkcWVkbd2LGdqRbeVkSxkpSQgC/EFpVCBtgeSPsfur9
        oyeKc5GxIXHocC+fxL+DTYIxmW/SVnBBOd4nM/2Sr6wB5Q51WDd9NnqAqIdt+Q==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 9/9] ARM: dts: r9a06g032: Describe the DMA router
Date:   Thu, 10 Mar 2022 16:57:55 +0100
Message-Id: <20220310155755.287294-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220310155755.287294-1-miquel.raynal@bootlin.com>
References: <20220310155755.287294-1-miquel.raynal@bootlin.com>
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
index 640c3eb4bbcd..804f2d6f416f 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -75,6 +75,16 @@ sysctrl: system-controller@4000c000 {
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

