Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D3AC10F14
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 00:19:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7E9F20870
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 00:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555892341;
	bh=8TAtCi0KBWZQUw50+QegpHrZjV3taZn5HDu/LkYP1Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OfQIDn8UKjNwtJ7/B5lUAGUzwrMRkvXeppoXhBDarnk4U/RZUECN3uLPgainOVz2g
	 ginjbAOOEuhsRSXnf8Gq+sFbNC0UV/wzmv9AgMrlsQG1VFWbmefHJ15FBFxryIqfNN
	 /2Ee5t01sJUoxwJUa7m6jkW+ty72lNQveGPwje/I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfDVATB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Apr 2019 20:19:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:59790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbfDVATB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 21 Apr 2019 20:19:01 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBFD1206BB;
        Mon, 22 Apr 2019 00:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555892339;
        bh=8TAtCi0KBWZQUw50+QegpHrZjV3taZn5HDu/LkYP1Mc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jKUk5FjkwV0dsZ+fE7Ec/xTbvFpE91jdPOWJ353OUcdKIB4dy9s3Hy15gRNMG7caH
         TKDmimtaTnnzYHr+KiRJOopGb/xxg9zpIdHRem/ADuHF4UAFJ+qycehhbh+Mlc20S1
         JqlyD5TWOvkkt2UTsEZHc07BuIMgeJv37b3iRTIA=
Date:   Mon, 22 Apr 2019 08:18:41 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Robin Gong <yibin.gong@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Angus Ainslie <angus@akkea.ca>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "linux-pm@lists.infradead.org" <linux-pm@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mm-evk: Add BD71847 PMIC
Message-ID: <20190422001840.GG19962@dragon>
References: <cover.1555077720.git.leonard.crestez@nxp.com>
 <7df309d19cf7f311afe736c95666afe8697e1e5a.1555077720.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df309d19cf7f311afe736c95666afe8697e1e5a.1555077720.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 12, 2019 at 02:10:05PM +0000, Leonard Crestez wrote:
> The BUCK2 regulator is used for cpufreq voltage control, otherwise
> configuration is mostly static.
> 
> This uses the newly-implemented rohm,reset-snvs-powered property to
> properly handle the SNVS state of imx8mm.
> 
> Between BD71837 and BD71847 the BUCK3/4 regulators were removed but
> datasheet and board schematics kept the names for BUCK5/6/7/8. The
> driver however renumbered 5/6/7/8 to 3/4/5/6. Use the names from DT
> bindings and add comments to signal this.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 145 +++++++++++++++++++
>  1 file changed, 145 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> index 2d5d89475b76..098ccaefd169 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -37,10 +37,14 @@
>  		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
>  };
>  
> +&A53_0 {
> +	cpu-supply = <&buck2_reg>;
> +};
> +
>  &fec1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_fec1>;
>  	phy-mode = "rgmii-id";
>  	phy-handle = <&ethphy0>;
> @@ -93,10 +97,138 @@
>  	pinctrl-0 = <&pinctrl_wdog>;
>  	fsl,ext-reset-output;
>  	status = "okay";
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	status = "okay";
> +
> +	pmic@4b {
> +		reg = <0x4b>;
> +		compatible = "rohm,bd71847";

We usually start properties with 'compatible' than anything else.  So
please move 'reg' afterwards.

> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 GPIO_ACTIVE_LOW>;
> +		rohm,reset-snvs-powered;
> +
> +		regulators {
> +			#address-cells = <1>;
> +			#size-cells = <0>;

Looking at bindings doc, I'm not sure if we want the artificial address
cell (unit address and 'reg' property).  I think node names like
regulator-xxx should just work?

Shawn

> +
> +			buck1_reg: regulator@0 {
> +				reg = <0>;
> +				regulator-compatible = "BUCK1";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <1250>;
> +			};
> +
> +			buck2_reg: regulator@1 {
> +				reg = <1>;
> +				regulator-compatible = "BUCK2";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <1250>;
> +				rohm,dvs-run-voltage = <1000000>;
> +				rohm,dvs-idle-voltage = <900000>;
> +			};
> +
> +			buck3_reg: regulator@2 {
> +				// BUCK5 in datasheet
> +				reg = <2>;
> +				regulator-compatible = "BUCK3";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck4_reg: regulator@3 {
> +				// BUCK6 in datasheet
> +				reg = <3>;
> +				regulator-compatible = "BUCK4";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck5_reg: regulator@4 {
> +				// BUCK7 in datasheet
> +				reg = <4>;
> +				regulator-compatible = "BUCK5";
> +				regulator-min-microvolt = <1605000>;
> +				regulator-max-microvolt = <1995000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck6_reg: regulator@5 {
> +				// BUCK8 in datasheet
> +				reg = <5>;
> +				regulator-compatible = "BUCK6";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1_reg: regulator@6 {
> +				reg = <6>;
> +				regulator-compatible = "LDO1";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo2_reg: regulator@7 {
> +				reg = <7>;
> +				regulator-compatible = "LDO2";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo3_reg: regulator@8 {
> +				reg = <8>;
> +				regulator-compatible = "LDO3";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo4_reg: regulator@9 {
> +				reg = <9>;
> +				regulator-compatible = "LDO4";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo6_reg: regulator@11 {
> +				reg = <11>;
> +				regulator-compatible = "LDO6";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
>  &iomuxc {
>  	pinctrl-names = "default";
>  
>  	pinctrl_fec1: fec1grp {
>  		fsl,pins = <
> @@ -122,10 +254,23 @@
>  		fsl,pins = <
>  			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
>  		>;
>  	};
>  
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
> +			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmicirq {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x41
> +		>;
> +	};
> +
>  	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
>  		>;
>  	};
> -- 
> 2.17.1
> 
