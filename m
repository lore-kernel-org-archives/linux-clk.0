Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229C2C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 09:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjCAJNL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbjCAJNG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 04:13:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508543B649
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 01:12:36 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXIVL-00038T-Hd; Wed, 01 Mar 2023 10:12:07 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXIVK-0003Xz-Vx; Wed, 01 Mar 2023 10:12:06 +0100
Date:   Wed, 1 Mar 2023 10:12:06 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mn: specify #sound-dai-cells for SAI
 nodes
Message-ID: <20230301091206.3e4qyh57hsorwzrp@pengutronix.de>
References: <20230228215244.166627-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228215244.166627-1-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-02-28, Marek Vasut wrote:
> Add #sound-dai-cells properties to SAI nodes.
> 
> Reviewed-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Fixes: 9e9860069725 ("arm64: dts: imx8mn: Add SAI nodes")
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

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
> V2: - Add RB from Adam and Fabio
>     - Add Fixes tag
>     - Move sound-dai-cells below regs
> ---
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> index ed9ac6c5047c0..9e0ddd6b7a322 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> @@ -296,6 +296,7 @@ spba2: spba-bus@30000000 {
>  				sai2: sai@30020000 {
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x30020000 0x10000>;
> +					#sound-dai-cells = <0>;
>  					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clk IMX8MN_CLK_SAI2_IPG>,
>  						<&clk IMX8MN_CLK_DUMMY>,
> @@ -310,6 +311,7 @@ sai2: sai@30020000 {
>  				sai3: sai@30030000 {
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x30030000 0x10000>;
> +					#sound-dai-cells = <0>;
>  					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clk IMX8MN_CLK_SAI3_IPG>,
>  						 <&clk IMX8MN_CLK_DUMMY>,
> @@ -324,6 +326,7 @@ sai3: sai@30030000 {
>  				sai5: sai@30050000 {
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x30050000 0x10000>;
> +					#sound-dai-cells = <0>;
>  					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clk IMX8MN_CLK_SAI5_IPG>,
>  						 <&clk IMX8MN_CLK_DUMMY>,
> @@ -340,6 +343,7 @@ sai5: sai@30050000 {
>  				sai6: sai@30060000 {
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x30060000  0x10000>;
> +					#sound-dai-cells = <0>;
>  					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clk IMX8MN_CLK_SAI6_IPG>,
>  						 <&clk IMX8MN_CLK_DUMMY>,
> @@ -397,6 +401,7 @@ spdif1: spdif@30090000 {
>  				sai7: sai@300b0000 {
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x300b0000 0x10000>;
> +					#sound-dai-cells = <0>;
>  					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clk IMX8MN_CLK_SAI7_IPG>,
>  						 <&clk IMX8MN_CLK_DUMMY>,
> -- 
> 2.39.2
> 
> 
