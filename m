Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1773C64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 12:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjB0MBD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 07:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjB0MBC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 07:01:02 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B588E063;
        Mon, 27 Feb 2023 04:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677499260; x=1709035260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yraj+9NZxVEy7H/asyQnjEyahz4DMD1ru89T/gslw5c=;
  b=ARM6SuszCJl4ys/80OrPu9yRoY0HUDXUky4cVTcV86nR3cGiIj65WZ0/
   3CxlEgDQnTmG89nngDuojAVKhqB25I/ZlKw90zHKfmNcb1f/YT9420tUU
   os6a0mxg2EzdWpTtrkP7UzjvbsAKGSyElE/us/kZjOlg4D3lSkvFU4C+4
   FlUzSaH3uyoYamiVBFrKN0ioTecXxgokPSUFO4c80MwAfFgp7m8WyRxRh
   7VikGPbNZ66rEDX9w4OYXhXGa8LQr8Q/+I7E1KQcgL4LqQ3RQ4+2pVC14
   3GyqzsDQYnnD+s1Rs4KVT+W3Xck4Kz3PLrJc49UAF8kPvCRnmzVXdh/mL
   A==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669071600"; 
   d="scan'208";a="29333946"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Feb 2023 13:00:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 27 Feb 2023 13:00:57 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 27 Feb 2023 13:00:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677499257; x=1709035257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yraj+9NZxVEy7H/asyQnjEyahz4DMD1ru89T/gslw5c=;
  b=C5/rbEVjsW9kCZtFBxYj3YBrUyNkzk3Mi5Dm8iOf7fbazXfZwEdrhGZ3
   C+NgvIOOJBWwTNYSBeS2AgAiIS/9WiRrnQZenGK0S5pm1a869wwTPyNCS
   cOoKbP03JjcfAzI4OZETut3N0mrVi4vXSEQr16RGEDlJBIVJReMjJR1sy
   Ji3SN5T+mJDDpaDyUGFCUodt+i3k3K9gKaFGO7rtGnmWWgnZim1ewsGhB
   oz840wCnnYHJu4GUmgpYv6vID2s1tVrHg390Y9K6Wfwg4T/HUi373SfJe
   x0Ib4gdQJ2I0ATvkp+xAM4C9AfqoojAMJLcHuV93NDmKiZJxLXqIkiL9j
   g==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669071600"; 
   d="scan'208";a="29333945"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Feb 2023 13:00:57 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EDBBD280056;
        Mon, 27 Feb 2023 13:00:56 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>,
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
Date:   Mon, 27 Feb 2023 13:00:56 +0100
Message-ID: <4260396.ejJDZkT8p0@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAHCN7xLoV1wNSPBoxwK89Mj3JWZoEYKEd2MJTUZdDbL03k5Axw@mail.gmail.com>
References: <20230223171114.59164-1-marex@denx.de> <3160821.5fSG56mABF@steina-w> <CAHCN7xLoV1wNSPBoxwK89Mj3JWZoEYKEd2MJTUZdDbL03k5Axw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Montag, 27. Februar 2023, 12:38:10 CET schrieb Adam Ford:
> On Mon, Feb 27, 2023 at 3:46 AM Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi Marek,
> >=20
> > thanks for respinning this series.
> >=20
> > Am Donnerstag, 23. Februar 2023, 18:11:13 CET schrieb Marek Vasut:
> > > Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> > > needed to get audio operational on i.MX8MP .
> > >=20
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Abel Vesa <abelvesa@kernel.org>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Jacky Bai <ping.bai@nxp.com>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Cc: Peng Fan <peng.fan@nxp.com>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Richard Cochran <richardcochran@gmail.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-clk@vger.kernel.org
> > > ---
> > > V2: - Add AUDIO_AXI clock to audio gpc
> > >=20
> > >     - Use IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT for SDMA2 IPG clock
> > >=20
> > > V3: Rename audio_ahb to plain ahb
> > > V4: - Add RB/TB from Luca
> > >=20
> > >     - Rebase on next 20230223
> > >=20
> > > ---
> > >=20
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 153 ++++++++++++++++++++=
++
> > >  1 file changed, 153 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> > > ca8093ee4d0e4..56d2a6377a5a6 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -571,6 +571,13 @@ pgc_usb2_phy: power-domain@3 {
> > >=20
> > >                                               reg =3D
> >=20
> > <IMX8MP_POWER_DOMAIN_USB2_PHY>;
> >=20
> > >                                       };
> > >=20
> > > +                                     pgc_audio: power-domain@5 {
> > > +                                             #power-domain-
> >=20
> > cells =3D <0>;
> >=20
> > > +                                             reg =3D
> >=20
> > <IMX8MP_POWER_DOMAIN_AUDIOMIX>;
> >=20
> > > +                                             clocks =3D <&clk
> >=20
> > IMX8MP_CLK_AUDIO_ROOT>,
> >=20
> > > +                                                      <&clk
> >=20
> > IMX8MP_CLK_AUDIO_AXI>;
> >=20
> > > +                                     };
> > > +
> > >=20
> > >                                       pgc_gpu2d: power-domain@6 {
> > >                                      =20
> > >                                               #power-domain-
> >=20
> > cells =3D <0>;
> >=20
> > >                                               reg =3D
> >=20
> > <IMX8MP_POWER_DOMAIN_GPU2D>;
> >=20
> > > @@ -1119,6 +1126,152 @@ opp-1000000000 {
> > >=20
> > >                       };
> > >              =20
> > >               };
> > >=20
> > > +             aips5: bus@30c00000 {
> > > +                     compatible =3D "fsl,aips-bus", "simple-bus";
> > > +                     reg =3D <0x30c00000 0x400000>;
> > > +                     #address-cells =3D <1>;
> > > +                     #size-cells =3D <1>;
> > > +                     ranges;
> > > +
> > > +                     spba-bus@30c00000 {
> > > +                             compatible =3D "fsl,spba-bus", "simple-
> >=20
> > bus";
> >=20
> > > +                             reg =3D <0x30c00000 0x100000>;
> >=20
> > Is there an SPBA bus for every AIPS? I'm wondering why some aips do have
> > an
> > spba below and some do not.
>=20
> The SPBA buses are listed in the TRM, and they appear to be mostly
> covering serial devices (UART, SPI, SAI, etc), but some are excluded.
> As to why it is this way is more of a question for NXP.  Check out
> chapter 2 of the TRM for the AIPS memory maps.

Thanks, I did find those AIPS parts. But the issue regarding SPBA is not so=
=20
clear. Apparently the spba compatible is checked by the SDMA driver.

Best regards,
Alexander

> adam
>=20
> > > +                             #address-cells =3D <1>;
> > > +                             #size-cells =3D <1>;
> > > +                             ranges;
> > > +
> > > +                             sai1: sai@30c10000 {
> > > +                                     compatible =3D "fsl,imx8mp-
> >=20
> > sai", "fsl,imx8mq-sai";
> >=20
> > > +                                     reg =3D <0x30c10000 0x10000>;
> > > +                                     interrupts =3D <GIC_SPI 95
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                                     clocks =3D <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI1_IPG>,
> >=20
> > > +                                              <&clk
> >=20
> > IMX8MP_CLK_DUMMY>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI1_MCLK2>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI1_MCLK3>;
> >=20
> > > +                                     clock-names =3D "bus",
> >=20
> > "mclk0", "mclk1", "mclk2", "mclk3";
> >=20
> > > +                                     dmas =3D <&sdma2 0 2 0>,
> >=20
> > <&sdma2 1 2 0>;
> >=20
> > Looking at Documentation/devicetree/bindings/dma/fsl,imx-sdma.yaml shou=
ld
> > the 2nd cell value be 24? This would be true for all other sai nodes.
> >=20
> > > +                                     dma-names =3D "rx", "tx";
> > > +                                     status =3D "disabled";
> > > +                             };
> > > +
> > > +                             sai2: sai@30c20000 {
> > > +                                     compatible =3D "fsl,imx8mp-
> >=20
> > sai", "fsl,imx8mq-sai";
> >=20
> > > +                                     reg =3D <0x30c20000 0x10000>;
> > > +                                     interrupts =3D <GIC_SPI 96
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                                     clocks =3D <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
> >=20
> > > +                                              <&clk
> >=20
> > IMX8MP_CLK_DUMMY>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI2_MCLK2>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI2_MCLK3>;
> >=20
> > > +                                     clock-names =3D "bus",
> >=20
> > "mclk0", "mclk1", "mclk2", "mclk3";
> >=20
> > > +                                     dmas =3D <&sdma2 2 2 0>,
> >=20
> > <&sdma2 3 2 0>;
> >=20
> > > +                                     dma-names =3D "rx", "tx";
> > > +                                     status =3D "disabled";
> > > +                             };
> > > +
> > > +                             sai3: sai@30c30000 {
> > > +                                     compatible =3D "fsl,imx8mp-
> >=20
> > sai", "fsl,imx8mq-sai";
> >=20
> > > +                                     reg =3D <0x30c30000 0x10000>;
> > > +                                     interrupts =3D <GIC_SPI 50
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                                     clocks =3D <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
> >=20
> > > +                                              <&clk
> >=20
> > IMX8MP_CLK_DUMMY>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI3_MCLK2>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI3_MCLK3>;
> >=20
> > > +                                     clock-names =3D "bus",
> >=20
> > "mclk0", "mclk1", "mclk2", "mclk3";
> >=20
> > > +                                     dmas =3D <&sdma2 4 2 0>,
> >=20
> > <&sdma2 5 2 0>;
> >=20
> > > +                                     dma-names =3D "rx", "tx";
> > > +                                     status =3D "disabled";
> > > +                             };
> > > +
> > > +                             sai5: sai@30c50000 {
> > > +                                     compatible =3D "fsl,imx8mp-
> >=20
> > sai", "fsl,imx8mq-sai";
> >=20
> > > +                                     reg =3D <0x30c50000 0x10000>;
> > > +                                     interrupts =3D <GIC_SPI 90
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                                     clocks =3D <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> >=20
> > > +                                              <&clk
> >=20
> > IMX8MP_CLK_DUMMY>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI5_MCLK2>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI5_MCLK3>;
> >=20
> > > +                                     clock-names =3D "bus",
> >=20
> > "mclk0", "mclk1", "mclk2", "mclk3";
> >=20
> > > +                                     dmas =3D <&sdma2 8 2 0>,
> >=20
> > <&sdma2 9 2 0>;
> >=20
> > > +                                     dma-names =3D "rx", "tx";
> > > +                                     status =3D "disabled";
> > > +                             };
> > > +
> > > +                             sai6: sai@30c60000 {
> > > +                                     compatible =3D "fsl,imx8mp-
> >=20
> > sai", "fsl,imx8mq-sai";
> >=20
> > > +                                     reg =3D <0x30c60000 0x10000>;
> > > +                                     interrupts =3D <GIC_SPI 90
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                                     clocks =3D <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI6_IPG>,
> >=20
> > > +                                              <&clk
> >=20
> > IMX8MP_CLK_DUMMY>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI6_MCLK2>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI6_MCLK3>;
> >=20
> > > +                                     clock-names =3D "bus",
> >=20
> > "mclk0", "mclk1", "mclk2", "mclk3";
> >=20
> > > +                                     dmas =3D <&sdma2 10 2 0>,
> >=20
> > <&sdma2 11 2 0>;
> >=20
> > > +                                     dma-names =3D "rx", "tx";
> > > +                                     status =3D "disabled";
> > > +                             };
> > > +
> > > +                             sai7: sai@30c80000 {
> > > +                                     compatible =3D "fsl,imx8mp-
> >=20
> > sai", "fsl,imx8mq-sai";
> >=20
> > > +                                     reg =3D <0x30c80000 0x10000>;
> > > +                                     interrupts =3D <GIC_SPI 111
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                                     clocks =3D <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI7_IPG>,
> >=20
> > > +                                              <&clk
> >=20
> > IMX8MP_CLK_DUMMY>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI7_MCLK1>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI7_MCLK2>,
> >=20
> > > +                                              <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SAI7_MCLK3>;
> >=20
> > > +                                     clock-names =3D "bus",
> >=20
> > "mclk0", "mclk1", "mclk2", "mclk3";
> >=20
> > > +                                     dmas =3D <&sdma2 12 2 0>,
> >=20
> > <&sdma2 13 2 0>;
> >=20
> > > +                                     dma-names =3D "rx", "tx";
> > > +                                     status =3D "disabled";
> > > +                             };
> > > +                     };
> > > +
> > > +                     sdma3: dma-controller@30e00000 {
> > > +                             compatible =3D "fsl,imx8mp-sdma",
> >=20
> > "fsl,imx8mq-sdma";
> >=20
> > > +                             reg =3D <0x30e00000 0x10000>;
> > > +                             interrupts =3D <GIC_SPI 34
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                             clocks =3D <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> >=20
> > > +                                      <&clk
> >=20
> > IMX8MP_CLK_AUDIO_ROOT>;
> >=20
> > > +                             clock-names =3D "ipg", "ahb";
> > > +                             #dma-cells =3D <3>;
> > > +                             fsl,sdma-ram-script-name =3D "imx/sdma/
> >=20
> > sdma-imx7d.bin";
> >=20
> > > +                     };
> > > +
> > > +                     sdma2: dma-controller@30e10000 {
> > > +                             compatible =3D "fsl,imx8mp-sdma",
> >=20
> > "fsl,imx8mq-sdma";
> >=20
> > > +                             reg =3D <0x30e10000 0x10000>;
> > > +                             interrupts =3D <GIC_SPI 103
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                             clocks =3D <&audio_blk_ctrl
> >=20
> > IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
> >=20
> > > +                                      <&clk
> >=20
> > IMX8MP_CLK_AUDIO_ROOT>;
> >=20
> > > +                             clock-names =3D "ipg", "ahb";
> > > +                             #dma-cells =3D <3>;
> > > +                             fsl,sdma-ram-script-name =3D "imx/sdma/
> >=20
> > sdma-imx7d.bin";
> >=20
> > > +                     };
> > > +
> > > +                     audio_blk_ctrl: blk-ctrl@30e20000 {
> >=20
> > Shouldn't the node name be 'clock-controller@30e20000' as mentioned in =
the
> > bindings?
> > But for the whole series:
> > Testes-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >=20
> > Best regards,
> > Alexander
> >=20
> > > +                             #clock-cells =3D <1>;
> > > +                             compatible =3D "fsl,imx8mp-audio-blk-
> >=20
> > ctrl";
> >=20
> > > +                             clocks =3D <&clk IMX8MP_CLK_AUDIO_ROOT>,
> > > +                                      <&clk IMX8MP_CLK_SAI1>,
> > > +                                      <&clk IMX8MP_CLK_SAI2>,
> > > +                                      <&clk IMX8MP_CLK_SAI3>,
> > > +                                      <&clk IMX8MP_CLK_SAI5>,
> > > +                                      <&clk IMX8MP_CLK_SAI6>,
> > > +                                      <&clk IMX8MP_CLK_SAI7>;
> > > +                             clock-names =3D "ahb",
> > > +                                           "sai1", "sai2",
> >=20
> > "sai3",
> >=20
> > > +                                           "sai5", "sai6",
> >=20
> > "sai7";
> >=20
> > > +                             power-domains =3D <&pgc_audio>;
> > > +                             power-domain-names =3D "audio";
> > > +                             reg =3D <0x30e20000 0x10000>;
> > > +                     };
> > > +             };
> > > +
> > >=20
> > >               aips4: bus@32c00000 {
> > >              =20
> > >                       compatible =3D "fsl,aips-bus", "simple-bus";
> > >                       reg =3D <0x32c00000 0x400000>;
> >=20
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


