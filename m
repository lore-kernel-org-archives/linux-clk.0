Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F22C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 19:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjB0TBw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 14:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjB0TBu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 14:01:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0491C2595D
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 11:01:37 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pWikW-00045q-Qe; Mon, 27 Feb 2023 20:01:24 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pWikV-00009S-Iq; Mon, 27 Feb 2023 20:01:23 +0100
Date:   Mon, 27 Feb 2023 20:01:23 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Fabio Estevam <festevam@gmail.com>,
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
Subject: Re: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI
 nodes
Message-ID: <20230227190123.znifdqympsantpt6@pengutronix.de>
References: <20230227174535.87657-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227174535.87657-1-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On 23-02-27, Marek Vasut wrote:
> Add #sound-dai-cells properties to SAI nodes.
> 
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
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> index ed9ac6c5047c0..bbec860ef8548 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> @@ -294,6 +294,7 @@ spba2: spba-bus@30000000 {
>  				ranges;
>  
>  				sai2: sai@30020000 {
> +					#sound-dai-cells = <0>;

Please don't add it in front of the compatible and the reg property.

Regards,
  Marco

>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x30020000 0x10000>;
>  					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> @@ -308,6 +309,7 @@ sai2: sai@30020000 {
>  				};
>  
>  				sai3: sai@30030000 {
> +					#sound-dai-cells = <0>;
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x30030000 0x10000>;
>  					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> @@ -322,6 +324,7 @@ sai3: sai@30030000 {
>  				};
>  
>  				sai5: sai@30050000 {
> +					#sound-dai-cells = <0>;
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x30050000 0x10000>;
>  					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> @@ -338,6 +341,7 @@ sai5: sai@30050000 {
>  				};
>  
>  				sai6: sai@30060000 {
> +					#sound-dai-cells = <0>;
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x30060000  0x10000>;
>  					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> @@ -395,6 +399,7 @@ spdif1: spdif@30090000 {
>  				};
>  
>  				sai7: sai@300b0000 {
> +					#sound-dai-cells = <0>;
>  					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
>  					reg = <0x300b0000 0x10000>;
>  					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.39.2
> 
> 
