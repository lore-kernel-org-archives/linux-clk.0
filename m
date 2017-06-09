Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-eopbgr00040.outbound.protection.outlook.com ([40.107.0.40]:20093
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751783AbdFITR3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 9 Jun 2017 15:17:29 -0400
From: Han Xu <han.xu@nxp.com>
To: Stefan Agner <stefan@agner.ch>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "sboyd@codeaurora.org" <sboyd@codeaurora.org>
CC: "A.S. Dong" <aisheng.dong@nxp.com>,
        "dwmw2@infradead.org" <dwmw2@infradead.org>,
        "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
        "boris.brezillon@free-electrons.com"
        <boris.brezillon@free-electrons.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "richard@nod.at" <richard@nod.at>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
        "LW@KARO-electronics.de" <LW@KARO-electronics.de>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 3/3] ARM: dts: imx7-colibri: add NAND support
Date: Fri, 9 Jun 2017 19:17:26 +0000
Message-ID: <dfe670d6-7238-00e3-8eb3-61909aef5ce6@nxp.com>
References: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
 <eed2e4bdf1823ac6548b2a21fb7c49fb123f467c.1496961128.git-series.stefan@agner.ch>
In-Reply-To: <eed2e4bdf1823ac6548b2a21fb7c49fb123f467c.1496961128.git-series.stefan@agner.ch>
Content-Type: text/plain; charset="Windows-1252"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 06/08/2017 05:34 PM, Stefan Agner wrote:
> The Colibri iMX7 modules come with 512MB on-module SLC NAND flash
> populated. Make use of it by enabling the GPMI controller.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
Acked-by: Han Xu <han.xu@nxp.com>
> ---
>   arch/arm/boot/dts/imx7-colibri.dtsi |  9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7=
-colibri.dtsi
> index 2d87489..ad4ce19 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -106,6 +106,15 @@
>   	fsl,magic-packet;
>   };
>  =20
> +&gpmi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> +	fsl,use-minimum-ecc;
> +	nand-on-flash-bbt;
> +	nand-ecc-mode =3D "hw";
> +	status =3D "okay";
> +};
> +
>   &i2c1 {
>   	clock-frequency =3D <100000>;
>   	pinctrl-names =3D "default";
