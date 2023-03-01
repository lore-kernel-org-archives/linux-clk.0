Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE137C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 09:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjCAJkv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjCAJku (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 04:40:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CBB34C03
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 01:40:47 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXIws-0007JD-P0; Wed, 01 Mar 2023 10:40:34 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXIwr-0005Jx-7U; Wed, 01 Mar 2023 10:40:33 +0100
Date:   Wed, 1 Mar 2023 10:40:33 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 4/5] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Message-ID: <20230301094033.m4z27bvrdvigs4r5@pengutronix.de>
References: <20230228215739.171071-1-marex@denx.de>
 <20230228215739.171071-4-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228215739.171071-4-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On 23-02-28, Marek Vasut wrote:
> Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> needed to get audio operational on i.MX8MP .
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: - Add AUDIO_AXI clock to audio gpc
>     - Use IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT for SDMA2 IPG clock
> V3: Rename audio_ahb to plain ahb
> V4: - Add RB/TB from Luca
>     - Rebase on next 20230223
> V5: - Add TB from Adam and Alexander
>     - Replace blk-ctrl@ with clock-controller@
>     - Specify sound-dai-cells in sai nodes
> V6: - Add RB from Fabio
>     - Drop power-domain-names from audiomix block/clock controller
>     - Move reg below compatible property
>     - Move sound-dai-cells below reg property
>     - Sort DT properties: compatible, regs, #cells, properties, status
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 158 ++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 524b4ccfcc553..7184b46fe0480 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -571,6 +571,13 @@ pgc_usb2_phy: power-domain@3 {
>  						reg = <IMX8MP_POWER_DOMAIN_USB2_PHY>;
>  					};
>  
> +					pgc_audio: power-domain@5 {
> +						#power-domain-cells = <0>;
> +						reg = <IMX8MP_POWER_DOMAIN_AUDIOMIX>;
> +						clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +							 <&clk IMX8MP_CLK_AUDIO_AXI>;
> +					};
> +
>  					pgc_gpu2d: power-domain@6 {
>  						#power-domain-cells = <0>;
>  						reg = <IMX8MP_POWER_DOMAIN_GPU2D>;
> @@ -1119,6 +1126,157 @@ opp-1000000000 {
>  			};
>  		};
>  
> +		aips5: bus@30c00000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0x30c00000 0x400000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			spba-bus@30c00000 {
> +				compatible = "fsl,spba-bus", "simple-bus";
> +				reg = <0x30c00000 0x100000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges;
> +
> +				sai1: sai@30c10000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c10000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai2: sai@30c20000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c20000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 2 2 0>, <&sdma2 3 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai3: sai@30c30000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c30000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 4 2 0>, <&sdma2 5 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai5: sai@30c50000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c50000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 8 2 0>, <&sdma2 9 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai6: sai@30c60000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c60000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 10 2 0>, <&sdma2 11 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai7: sai@30c80000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c80000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 12 2 0>, <&sdma2 13 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +			};
> +
> +			sdma3: dma-controller@30e00000 {
> +				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> +				reg = <0x30e00000 0x10000>;
> +				#dma-cells = <3>;
> +				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> +					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
> +				clock-names = "ipg", "ahb";
> +				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +			};
> +
> +			sdma2: dma-controller@30e10000 {
> +				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> +				reg = <0x30e10000 0x10000>;
> +				#dma-cells = <3>;
> +				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
> +					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
> +				clock-names = "ipg", "ahb";
> +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +			};
> +
> +			audio_blk_ctrl: clock-controller@30e20000 {
> +				#clock-cells = <1>;

Nit: Please move the #clock-cells below the reg property. With that
fixed feel free to add my

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>


> +				compatible = "fsl,imx8mp-audio-blk-ctrl";
> +				reg = <0x30e20000 0x10000>;
> +				clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +					 <&clk IMX8MP_CLK_SAI1>,
> +					 <&clk IMX8MP_CLK_SAI2>,
> +					 <&clk IMX8MP_CLK_SAI3>,
> +					 <&clk IMX8MP_CLK_SAI5>,
> +					 <&clk IMX8MP_CLK_SAI6>,
> +					 <&clk IMX8MP_CLK_SAI7>;
> +				clock-names = "ahb",
> +					      "sai1", "sai2", "sai3",
> +					      "sai5", "sai6", "sai7";
> +				power-domains = <&pgc_audio>;
> +			};
> +		};
> +
>  		aips4: bus@32c00000 {
>  			compatible = "fsl,aips-bus", "simple-bus";
>  			reg = <0x32c00000 0x400000>;
> -- 
> 2.39.2
> 
> 
