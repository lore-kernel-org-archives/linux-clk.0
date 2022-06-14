Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAD4CCA47A
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jun 2022 18:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237953AbiFNSDA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Jun 2022 14:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbiFNSC6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2022 14:02:58 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F3544768
        for <linux-clk@vger.kernel.org>; Tue, 14 Jun 2022 11:02:54 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 78E43843BE;
        Tue, 14 Jun 2022 20:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655229772;
        bh=MAysBBjgyA3FjvwK3iNFtkDvLH0+9ggWAMl6LBXhNCs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dx3JPlpgSIPRl5MWiQceqT13EAJpGOcC+jqNBUpFms/XMtQppcCwEyMbuDh97Zj4H
         OfhLHgWiRGGCmx+RTUrWEX9chwix/Nl5IB5jtvGku8R4M+ZRx9xLs+XuRn6+GmFwT3
         WRmr9CUMyEoQ7EZVM4XtKVENshthd1yijF5yyk4g4y9PjHxTzOTTnW6XRDeMkWcyr6
         sLs2dgFyKo7t24nLDD66cDBPdP1FsFuEEVQtf0pAudlY5eE181cJOFfliHg9eNZpLN
         5drYos6OOJ4z0XflU8QfdW0vDaQe0rC4UMmmRKtsEz7st3IdR8V0mESQkIe9oo6KuH
         2hj/d2VeIbJ5w==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: [PATCH v2 3/4] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Date:   Tue, 14 Jun 2022 20:02:38 +0200
Message-Id: <20220614180239.778334-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614180239.778334-1-marex@denx.de>
References: <20220614180239.778334-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
needed to get audio operational on i.MX8MP .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
To: linux-clk@vger.kernel.org
Cc: linux-imx@nxp.com
---
V2: - Add AUDIO_AXI clock to audio gpc
    - Use IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT for SDMA2 IPG clock
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 153 ++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 4dc6dfaa45418..f50f6a53d93a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -552,6 +552,13 @@ pgc_usb2_phy: power-domain@3 {
 						reg = <IMX8MP_POWER_DOMAIN_USB2_PHY>;
 					};
 
+					pgc_audio: power-domain@5 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MP_POWER_DOMAIN_AUDIOMIX>;
+						clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
+							 <&clk IMX8MP_CLK_AUDIO_AXI>;
+					};
+
 					pgc_gpu2d: power-domain@6 {
 						#power-domain-cells = <0>;
 						reg = <IMX8MP_POWER_DOMAIN_GPU2D>;
@@ -1045,6 +1052,152 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
+		aips5: bus@30c00000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x30c00000 0x400000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			spba-bus@30c00000 {
+				compatible = "fsl,spba-bus", "simple-bus";
+				reg = <0x30c00000 0x100000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+
+				sai1: sai@30c10000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c10000 0x10000>;
+					interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai2: sai@30c20000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c20000 0x10000>;
+					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 2 2 0>, <&sdma2 3 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai3: sai@30c30000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c30000 0x10000>;
+					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 4 2 0>, <&sdma2 5 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai5: sai@30c50000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c50000 0x10000>;
+					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 8 2 0>, <&sdma2 9 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai6: sai@30c60000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c60000 0x10000>;
+					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 10 2 0>, <&sdma2 11 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai7: sai@30c80000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c80000 0x10000>;
+					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 12 2 0>, <&sdma2 13 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+			};
+
+			sdma3: dma-controller@30e00000 {
+				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+				reg = <0x30e00000 0x10000>;
+				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
+				clock-names = "ipg", "ahb";
+				#dma-cells = <3>;
+				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+			};
+
+			sdma2: dma-controller@30e10000 {
+				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+				reg = <0x30e10000 0x10000>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
+					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
+				clock-names = "ipg", "ahb";
+				#dma-cells = <3>;
+				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+			};
+
+			audio_blk_ctrl: blk-ctrl@30e20000 {
+				#clock-cells = <1>;
+				compatible = "fsl,imx8mp-audio-blk-ctrl";
+				clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
+					 <&clk IMX8MP_CLK_SAI1>,
+					 <&clk IMX8MP_CLK_SAI2>,
+					 <&clk IMX8MP_CLK_SAI3>,
+					 <&clk IMX8MP_CLK_SAI5>,
+					 <&clk IMX8MP_CLK_SAI6>,
+					 <&clk IMX8MP_CLK_SAI7>;
+				clock-names = "audio_ahb",
+					      "sai1", "sai2", "sai3",
+					      "sai5", "sai6", "sai7";
+				power-domains = <&pgc_audio>;
+				power-domain-names = "audio";
+				reg = <0x30e20000 0x10000>;
+			};
+		};
+
 		aips4: bus@32c00000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			reg = <0x32c00000 0x400000>;
-- 
2.35.1

