Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2169FC77B75
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 11:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236229AbjEHLoU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 07:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236294AbjEHLoA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 07:44:00 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DAD10A1E;
        Mon,  8 May 2023 04:43:23 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 865CB80181;
        Mon,  8 May 2023 13:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1683546171;
        bh=51L8VF6JHVkdoSV/R1vrEuEulT3Pd9fUuUCKl2vethI=;
        h=From:To:Cc:Subject:Date:From;
        b=MCCJdB2sfFyjZQ7RdUfd1YmeoTzc8z8fwhEUr2jgMDyRkKG1cWfpQloqASWt+auDx
         xsmspuQJ+vFTyUTtbXrF3VEROxh8GtI3OHErv3p7lL03AYQCvEWH9MevDIr2n3fSkR
         C3rlLuJxdelh1b+GuXyJRGoXUyWTLWaNOOLsNvG4iVfTRDG5K87/iwp4ty+AnmdoVt
         6uHxW5LIJmqVRG9D0YWbbkbfDWv4xHw+t+GJBcT5ByJeKLUrAVSmvsEGlAdIdyHn/y
         l60kKby4vVUg9Bi/swST1jELEGjWawkI3r8uM4cE0sOl8LAyYzVDSpuY+qZkLSyue5
         wsw3Fb85XLLeg==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v8 1/2] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Date:   Mon,  8 May 2023 13:42:35 +0200
Message-Id: <20230508114236.8444-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
needed to get audio operational on i.MX8MP .

Acked-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: - Add AUDIO_AXI clock to audio gpc
    - Use IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT for SDMA2 IPG clock
V3: Rename audio_ahb to plain ahb
V4: - Add RB/TB from Luca
    - Rebase on next 20230223
V5: - Add TB from Adam and Alexander
    - Replace blk-ctrl@ with clock-controller@
    - Specify sound-dai-cells in sai nodes
V6: - Add RB from Fabio
    - Drop power-domain-names from audiomix block/clock controller
    - Move reg below compatible property
    - Move sound-dai-cells below reg property
    - Sort DT properties: compatible, regs, #cells, properties, status
V7: - Move #clock-cells below reg property
    - Add AB from Peng
    - Add RB from Marco, sort the tags
V8: Add TB from Richard
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 158 ++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index f81391993354f..149f4e7e1d9b5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -595,6 +595,13 @@ pgc_usb2_phy: power-domain@3 {
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
@@ -1167,6 +1174,157 @@ opp-1000000000 {
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
+					#sound-dai-cells = <0>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
+					dma-names = "rx", "tx";
+					interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
+				sai2: sai@30c20000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c20000 0x10000>;
+					#sound-dai-cells = <0>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 2 2 0>, <&sdma2 3 2 0>;
+					dma-names = "rx", "tx";
+					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
+				sai3: sai@30c30000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c30000 0x10000>;
+					#sound-dai-cells = <0>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 4 2 0>, <&sdma2 5 2 0>;
+					dma-names = "rx", "tx";
+					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
+				sai5: sai@30c50000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c50000 0x10000>;
+					#sound-dai-cells = <0>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 8 2 0>, <&sdma2 9 2 0>;
+					dma-names = "rx", "tx";
+					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
+				sai6: sai@30c60000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c60000 0x10000>;
+					#sound-dai-cells = <0>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 10 2 0>, <&sdma2 11 2 0>;
+					dma-names = "rx", "tx";
+					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
+				sai7: sai@30c80000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c80000 0x10000>;
+					#sound-dai-cells = <0>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 12 2 0>, <&sdma2 13 2 0>;
+					dma-names = "rx", "tx";
+					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+			};
+
+			sdma3: dma-controller@30e00000 {
+				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+				reg = <0x30e00000 0x10000>;
+				#dma-cells = <3>;
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
+				clock-names = "ipg", "ahb";
+				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+			};
+
+			sdma2: dma-controller@30e10000 {
+				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+				reg = <0x30e10000 0x10000>;
+				#dma-cells = <3>;
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
+					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
+				clock-names = "ipg", "ahb";
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+			};
+
+			audio_blk_ctrl: clock-controller@30e20000 {
+				compatible = "fsl,imx8mp-audio-blk-ctrl";
+				reg = <0x30e20000 0x10000>;
+				#clock-cells = <1>;
+				clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
+					 <&clk IMX8MP_CLK_SAI1>,
+					 <&clk IMX8MP_CLK_SAI2>,
+					 <&clk IMX8MP_CLK_SAI3>,
+					 <&clk IMX8MP_CLK_SAI5>,
+					 <&clk IMX8MP_CLK_SAI6>,
+					 <&clk IMX8MP_CLK_SAI7>;
+				clock-names = "ahb",
+					      "sai1", "sai2", "sai3",
+					      "sai5", "sai6", "sai7";
+				power-domains = <&pgc_audio>;
+			};
+		};
+
 		aips4: bus@32c00000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			reg = <0x32c00000 0x400000>;
-- 
2.39.2

