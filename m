Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF86C64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 19:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjB0TAU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 14:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjB0TAQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 14:00:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DE11A964
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 11:00:05 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pWiiz-0003Sv-U9; Mon, 27 Feb 2023 19:59:49 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pWiiz-0008TH-4d; Mon, 27 Feb 2023 19:59:49 +0100
Date:   Mon, 27 Feb 2023 19:59:49 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
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
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Message-ID: <20230227185949.xaxltai4ksgrczmc@pengutronix.de>
References: <20230227174308.87286-1-marex@denx.de>
 <20230227174308.87286-5-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227174308.87286-5-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

thanks for switching to simple-audio-card :)

On 23-02-27, Marek Vasut wrote:
> Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
> This is all that is needed to get analog audio output operational
> on i.MX8MP EVK.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
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
> V2: No change
> V3: No change
> V4: - Update codec node name and phandle label
>     - Use just sound for the sound node name
>     - Rebase on next 20230223
> V5: - Drop regulator-always-on from codec regulator
>     - Add RB from Fabio
>     - TB by Alexander added and removed again, since the patch was reworked
>     - Switch to simple-audio-card
>     - Add sound-dai-cells to codec node
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 74 ++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 7816853162b3f..f2285ed9f70b1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -40,6 +40,15 @@ pcie0_refclk: pcie0-refclk {
>  		clock-frequency = <100000000>;
>  	};
>  
> +	reg_audio_pwr: regulator-audio-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "audio-pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;

We should have a proper pinctrl setup for the regulator device.

> +	};
> +
>  	reg_can1_stby: regulator-can1-stby {
>  		compatible = "regulator-fixed";
>  		regulator-name = "can1-stby";
> @@ -83,6 +92,37 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "wm8960-audio";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&cpudai>;
> +		simple-audio-card,bitclock-master = <&cpudai>;
> +		simple-audio-card,widgets =
> +			"Headphone", "Headphone Jack",
> +			"Speaker", "External Speaker",
> +			"Microphone", "Mic Jack";
> +		simple-audio-card,routing =
> +			"Headphone Jack", "HP_L",
> +			"Headphone Jack", "HP_R",
> +			"External Speaker", "SPK_LP",
> +			"External Speaker", "SPK_LN",
> +			"External Speaker", "SPK_RP",
> +			"External Speaker", "SPK_RN",
> +			"LINPUT1", "Mic Jack",
> +			"LINPUT3", "Mic Jack",
> +			"Mic Jack", "MICB";
> +
> +		cpudai: simple-audio-card,cpu {
> +			sound-dai = <&sai3>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&wm8960>;
> +		};
> +
> +	};
>  };
>  
>  &flexspi {
> @@ -344,6 +384,18 @@ &i2c3 {
>  	pinctrl-0 = <&pinctrl_i2c3>;
>  	status = "okay";
>  
> +	wm8960: codec@1a {
> +		#sound-dai-cells = <0>;
> +		compatible = "wlf,wm8960";
> +		reg = <0x1a>;

The compatible should be the first property followed by the reg
property.

> +		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
> +		clock-names = "mclk";
> +		wlf,shared-lrclk;
> +		wlf,hp-cfg = <3 2 3>;
> +		wlf,gpio-cfg = <1 3>;
> +		SPKVDD1-supply = <&reg_audio_pwr>;
> +	};
> +
>  	pca6416: gpio@20 {
>  		compatible = "ti,tca6416";
>  		reg = <0x20>;
> @@ -422,6 +474,16 @@ &pwm4 {
>  	status = "okay";
>  };
>  
> +&sai3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai3>;
> +	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
> +	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  &snvs_pwrkey {
>  	status = "okay";
>  };
> @@ -668,6 +730,18 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
>  		>;
>  	};
>  
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
> +			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
> +			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
> +			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
> +			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
> +			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0xd6

What is gpio04-io28 used for?

> +			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
> +		>;
> +	};

Regards,
  Marco
