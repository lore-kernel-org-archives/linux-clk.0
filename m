Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCC4C64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 09:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjB0JPw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 04:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjB0JPe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 04:15:34 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4763321A02;
        Mon, 27 Feb 2023 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677488938; x=1709024938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0rcMwdB8P83YSG9t94WroP2Hfiqi+LBOffRPprk7z1U=;
  b=aFNmlKKXcyfmMf6a5wasdPKUPjFRDvRjQDfcJLUC5+vnMFRh3FvZCPSV
   iDL3kKWYeLJTZFNmTq6m6KaCCYjKgyWCBTMstVQ/dNT1wXkvGlvPjtU92
   8ap5IZlg4qS5cWSVlXdGbTfV8q/cf1JTTF6jHoMj6QGoxC5fc3Qu6j6/p
   UwGP6FACTeM7XhfDMmOme6vKMYgV0P8PU8VLlQmZV6idj53tEtXm67UyR
   +QXi8+Ffeau/jtig/dvYuZOaicMchAcrhrQAllwYfN+dp1iWPKtbHWb64
   hoZHoydMFNWfvDC79R1IQtu3TkI4vbWc2/SFSilxs9Cqj9MnF9xc09GYB
   A==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669071600"; 
   d="scan'208";a="29328069"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Feb 2023 10:08:25 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 27 Feb 2023 10:08:25 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 27 Feb 2023 10:08:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677488905; x=1709024905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0rcMwdB8P83YSG9t94WroP2Hfiqi+LBOffRPprk7z1U=;
  b=DUsVvNlBYkKnUvV+1s4JaTZoRlcq2sQIoJwqnpFSIMLQlXco41Nh6OK/
   FIx0G7ZBWUZg0+C22N4/WHHW6KF/aibxwC8Ks4rNKvycPNj9HS4Lxbsd3
   VygBdmFXuu6ex7dv3fvphkRlQnlD0Hf+gMBFWqVCXdKNHzG98+y8IpqX7
   ON6jbCT+w2Zw5x6UCmHvsgNlr1v7cx5peCE68Q2I9gbDdc7/DH0mWoNzD
   rkDC4ObWYHQ5mjIrP4YTHqTypowuggMGVWrLlUucNCryOZYKXRqJW+F1p
   c9Djx09f3cyS5v37uKxh6G63dHOfcwe2db7PU5NE104nc7FOV6LFgDVnr
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669071600"; 
   d="scan'208";a="29328068"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Feb 2023 10:08:25 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A21E9280056;
        Mon, 27 Feb 2023 10:08:24 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc:     Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
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
Subject: Re: [PATCH v4 4/5] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Date:   Mon, 27 Feb 2023 10:08:24 +0100
Message-ID: <3160821.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230223171114.59164-4-marex@denx.de>
References: <20230223171114.59164-1-marex@denx.de> <20230223171114.59164-4-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

thanks for respinning this series.

Am Donnerstag, 23. Februar 2023, 18:11:13 CET schrieb Marek Vasut:
> Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> needed to get audio operational on i.MX8MP .
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 153 ++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> ca8093ee4d0e4..56d2a6377a5a6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -571,6 +571,13 @@ pgc_usb2_phy: power-domain@3 {
>  						reg =3D=20
<IMX8MP_POWER_DOMAIN_USB2_PHY>;
>  					};
>=20
> +					pgc_audio: power-domain@5 {
> +						#power-domain-
cells =3D <0>;
> +						reg =3D=20
<IMX8MP_POWER_DOMAIN_AUDIOMIX>;
> +						clocks =3D <&clk=20
IMX8MP_CLK_AUDIO_ROOT>,
> +							 <&clk=20
IMX8MP_CLK_AUDIO_AXI>;
> +					};
> +
>  					pgc_gpu2d: power-domain@6 {
>  						#power-domain-
cells =3D <0>;
>  						reg =3D=20
<IMX8MP_POWER_DOMAIN_GPU2D>;
> @@ -1119,6 +1126,152 @@ opp-1000000000 {
>  			};
>  		};
>=20
> +		aips5: bus@30c00000 {
> +			compatible =3D "fsl,aips-bus", "simple-bus";
> +			reg =3D <0x30c00000 0x400000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;
> +
> +			spba-bus@30c00000 {
> +				compatible =3D "fsl,spba-bus", "simple-
bus";
> +				reg =3D <0x30c00000 0x100000>;

Is there an SPBA bus for every AIPS? I'm wondering why some aips do have an=
=20
spba below and some do not.

> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +				ranges;
> +
> +				sai1: sai@30c10000 {
> +					compatible =3D "fsl,imx8mp-
sai", "fsl,imx8mq-sai";
> +					reg =3D <0x30c10000 0x10000>;
> +					interrupts =3D <GIC_SPI 95=20
IRQ_TYPE_LEVEL_HIGH>;
> +					clocks =3D <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI1_IPG>,
> +						 <&clk=20
IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI1_MCLK2>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI1_MCLK3>;
> +					clock-names =3D "bus",=20
"mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas =3D <&sdma2 0 2 0>,=20
<&sdma2 1 2 0>;

Looking at Documentation/devicetree/bindings/dma/fsl,imx-sdma.yaml should t=
he=20
2nd cell value be 24? This would be true for all other sai nodes.

> +					dma-names =3D "rx", "tx";
> +					status =3D "disabled";
> +				};
> +
> +				sai2: sai@30c20000 {
> +					compatible =3D "fsl,imx8mp-
sai", "fsl,imx8mq-sai";
> +					reg =3D <0x30c20000 0x10000>;
> +					interrupts =3D <GIC_SPI 96=20
IRQ_TYPE_LEVEL_HIGH>;
> +					clocks =3D <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
> +						 <&clk=20
IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI2_MCLK2>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI2_MCLK3>;
> +					clock-names =3D "bus",=20
"mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas =3D <&sdma2 2 2 0>,=20
<&sdma2 3 2 0>;
> +					dma-names =3D "rx", "tx";
> +					status =3D "disabled";
> +				};
> +
> +				sai3: sai@30c30000 {
> +					compatible =3D "fsl,imx8mp-
sai", "fsl,imx8mq-sai";
> +					reg =3D <0x30c30000 0x10000>;
> +					interrupts =3D <GIC_SPI 50=20
IRQ_TYPE_LEVEL_HIGH>;
> +					clocks =3D <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
> +						 <&clk=20
IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI3_MCLK2>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI3_MCLK3>;
> +					clock-names =3D "bus",=20
"mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas =3D <&sdma2 4 2 0>,=20
<&sdma2 5 2 0>;
> +					dma-names =3D "rx", "tx";
> +					status =3D "disabled";
> +				};
> +
> +				sai5: sai@30c50000 {
> +					compatible =3D "fsl,imx8mp-
sai", "fsl,imx8mq-sai";
> +					reg =3D <0x30c50000 0x10000>;
> +					interrupts =3D <GIC_SPI 90=20
IRQ_TYPE_LEVEL_HIGH>;
> +					clocks =3D <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> +						 <&clk=20
IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI5_MCLK2>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI5_MCLK3>;
> +					clock-names =3D "bus",=20
"mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas =3D <&sdma2 8 2 0>,=20
<&sdma2 9 2 0>;
> +					dma-names =3D "rx", "tx";
> +					status =3D "disabled";
> +				};
> +
> +				sai6: sai@30c60000 {
> +					compatible =3D "fsl,imx8mp-
sai", "fsl,imx8mq-sai";
> +					reg =3D <0x30c60000 0x10000>;
> +					interrupts =3D <GIC_SPI 90=20
IRQ_TYPE_LEVEL_HIGH>;
> +					clocks =3D <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI6_IPG>,
> +						 <&clk=20
IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI6_MCLK2>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI6_MCLK3>;
> +					clock-names =3D "bus",=20
"mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas =3D <&sdma2 10 2 0>,=20
<&sdma2 11 2 0>;
> +					dma-names =3D "rx", "tx";
> +					status =3D "disabled";
> +				};
> +
> +				sai7: sai@30c80000 {
> +					compatible =3D "fsl,imx8mp-
sai", "fsl,imx8mq-sai";
> +					reg =3D <0x30c80000 0x10000>;
> +					interrupts =3D <GIC_SPI 111=20
IRQ_TYPE_LEVEL_HIGH>;
> +					clocks =3D <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI7_IPG>,
> +						 <&clk=20
IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI7_MCLK1>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI7_MCLK2>,
> +						 <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SAI7_MCLK3>;
> +					clock-names =3D "bus",=20
"mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas =3D <&sdma2 12 2 0>,=20
<&sdma2 13 2 0>;
> +					dma-names =3D "rx", "tx";
> +					status =3D "disabled";
> +				};
> +			};
> +
> +			sdma3: dma-controller@30e00000 {
> +				compatible =3D "fsl,imx8mp-sdma",=20
"fsl,imx8mq-sdma";
> +				reg =3D <0x30e00000 0x10000>;
> +				interrupts =3D <GIC_SPI 34=20
IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> +					 <&clk=20
IMX8MP_CLK_AUDIO_ROOT>;
> +				clock-names =3D "ipg", "ahb";
> +				#dma-cells =3D <3>;
> +				fsl,sdma-ram-script-name =3D "imx/sdma/
sdma-imx7d.bin";
> +			};
> +
> +			sdma2: dma-controller@30e10000 {
> +				compatible =3D "fsl,imx8mp-sdma",=20
"fsl,imx8mq-sdma";
> +				reg =3D <0x30e10000 0x10000>;
> +				interrupts =3D <GIC_SPI 103=20
IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&audio_blk_ctrl=20
IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
> +					 <&clk=20
IMX8MP_CLK_AUDIO_ROOT>;
> +				clock-names =3D "ipg", "ahb";
> +				#dma-cells =3D <3>;
> +				fsl,sdma-ram-script-name =3D "imx/sdma/
sdma-imx7d.bin";
> +			};
> +
> +			audio_blk_ctrl: blk-ctrl@30e20000 {

Shouldn't the node name be 'clock-controller@30e20000' as mentioned in the=
=20
bindings?
But for the whole series:
Testes-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander

> +				#clock-cells =3D <1>;
> +				compatible =3D "fsl,imx8mp-audio-blk-
ctrl";
> +				clocks =3D <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +					 <&clk IMX8MP_CLK_SAI1>,
> +					 <&clk IMX8MP_CLK_SAI2>,
> +					 <&clk IMX8MP_CLK_SAI3>,
> +					 <&clk IMX8MP_CLK_SAI5>,
> +					 <&clk IMX8MP_CLK_SAI6>,
> +					 <&clk IMX8MP_CLK_SAI7>;
> +				clock-names =3D "ahb",
> +					      "sai1", "sai2",=20
"sai3",
> +					      "sai5", "sai6",=20
"sai7";
> +				power-domains =3D <&pgc_audio>;
> +				power-domain-names =3D "audio";
> +				reg =3D <0x30e20000 0x10000>;
> +			};
> +		};
> +
>  		aips4: bus@32c00000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
>  			reg =3D <0x32c00000 0x400000>;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


