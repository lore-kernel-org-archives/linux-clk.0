Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0A0C64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 11:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjB0LiZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjB0LiY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 06:38:24 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBD76590;
        Mon, 27 Feb 2023 03:38:23 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id fd25so3338533pfb.1;
        Mon, 27 Feb 2023 03:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voXU1aFLPbU64FvyAoB4Ubp+CYgK8G7O1vFzgNe7foI=;
        b=a+8LE4Vg+x3DS0k8dklwqF1X7fl6unc7pT/ksLQ33cMxOxDdlBjMbeP5YEkdEFAA89
         avg3WGrCVnlH/xumzzff+PYqG0hcI2P6M5kjNzU8GyeS0U75puZwhbTa1c0zDZe83A1k
         yk/Lmihno6mLhPC2Qy9+c2pMaqZy3gTipRCJNCw32KVhlpj8+s5OfaYPCR2CrFFMiKLu
         lMV5ZD9hRaYuTh/IfEjSlr58SO799SVi0vxenm1+HTIop6zM98QqrJexcdK2Yt06zkcp
         grZ+crBp8dAnN+LEdefd4AOd3uhsIAI5TwDVRdmLXcGhvt3wK4chcRZ9vSx+GQPXEhxt
         YDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voXU1aFLPbU64FvyAoB4Ubp+CYgK8G7O1vFzgNe7foI=;
        b=n3VokB134bs2GQa37zRRGKSammWtYGfmYAQYbQD2VLSdisDrabGraYvMBdqJND1ycf
         LbTM4e5HjiSsQjuFbEYTQF3qPeB77L1fVRapOhJLm50gytjGJaCZm3Cf4NDLxGMQ0zFy
         E5lmaz3NpWYwhkWfpTzwNRTOcpW7Jpftwk2nwd+pVhKI8X9OtEIhnM/l/HRxkyzIITLK
         K5VdE6HikxL1mI+C121vFjmNB4gYRfMsCFP86tEh8Y1QTS5Kac6+TTOTBFcUbXR4CRHg
         5GRwz+KmphEDcP/kQBB+kXJtu9rOH8rw6UvOuoFevTwWOp7hnYXeHajyE+Nymmu3NHD1
         D/AA==
X-Gm-Message-State: AO0yUKV9jQQNzHjctZq99dZoQDtystLVfpZXkUihOnmeiul88V09ivIZ
        eZh6cZch5oGllM2yKtR0rUMy+ZfvYKwgUjnHFpA=
X-Google-Smtp-Source: AK7set+e0Z+PIyxFts8dn6rqFzMntLwyNJuLWpuAkUtaQlqcYHkvEY8NF9rNxQwFCcLK03yacOcYyUJepVmb9f3UXXo=
X-Received: by 2002:a62:e401:0:b0:592:453c:320a with SMTP id
 r1-20020a62e401000000b00592453c320amr5654621pfh.5.1677497902338; Mon, 27 Feb
 2023 03:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20230223171114.59164-1-marex@denx.de> <20230223171114.59164-4-marex@denx.de>
 <3160821.5fSG56mABF@steina-w>
In-Reply-To: <3160821.5fSG56mABF@steina-w>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 27 Feb 2023 05:38:10 -0600
Message-ID: <CAHCN7xLoV1wNSPBoxwK89Mj3JWZoEYKEd2MJTUZdDbL03k5Axw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 27, 2023 at 3:46 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Marek,
>
> thanks for respinning this series.
>
> Am Donnerstag, 23. Februar 2023, 18:11:13 CET schrieb Marek Vasut:
> > Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> > needed to get audio operational on i.MX8MP .
> >
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Abel Vesa <abelvesa@kernel.org>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Jacky Bai <ping.bai@nxp.com>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Richard Cochran <richardcochran@gmail.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-clk@vger.kernel.org
> > ---
> > V2: - Add AUDIO_AXI clock to audio gpc
> >     - Use IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT for SDMA2 IPG clock
> > V3: Rename audio_ahb to plain ahb
> > V4: - Add RB/TB from Luca
> >     - Rebase on next 20230223
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 153 ++++++++++++++++++++++
> >  1 file changed, 153 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> > ca8093ee4d0e4..56d2a6377a5a6 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -571,6 +571,13 @@ pgc_usb2_phy: power-domain@3 {
> >                                               reg =3D
> <IMX8MP_POWER_DOMAIN_USB2_PHY>;
> >                                       };
> >
> > +                                     pgc_audio: power-domain@5 {
> > +                                             #power-domain-
> cells =3D <0>;
> > +                                             reg =3D
> <IMX8MP_POWER_DOMAIN_AUDIOMIX>;
> > +                                             clocks =3D <&clk
> IMX8MP_CLK_AUDIO_ROOT>,
> > +                                                      <&clk
> IMX8MP_CLK_AUDIO_AXI>;
> > +                                     };
> > +
> >                                       pgc_gpu2d: power-domain@6 {
> >                                               #power-domain-
> cells =3D <0>;
> >                                               reg =3D
> <IMX8MP_POWER_DOMAIN_GPU2D>;
> > @@ -1119,6 +1126,152 @@ opp-1000000000 {
> >                       };
> >               };
> >
> > +             aips5: bus@30c00000 {
> > +                     compatible =3D "fsl,aips-bus", "simple-bus";
> > +                     reg =3D <0x30c00000 0x400000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     ranges;
> > +
> > +                     spba-bus@30c00000 {
> > +                             compatible =3D "fsl,spba-bus", "simple-
> bus";
> > +                             reg =3D <0x30c00000 0x100000>;
>
> Is there an SPBA bus for every AIPS? I'm wondering why some aips do have =
an
> spba below and some do not.


The SPBA buses are listed in the TRM, and they appear to be mostly
covering serial devices (UART, SPI, SAI, etc), but some are excluded.
As to why it is this way is more of a question for NXP.  Check out
chapter 2 of the TRM for the AIPS memory maps.

adam
>
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <1>;
> > +                             ranges;
> > +
> > +                             sai1: sai@30c10000 {
> > +                                     compatible =3D "fsl,imx8mp-
> sai", "fsl,imx8mq-sai";
> > +                                     reg =3D <0x30c10000 0x10000>;
> > +                                     interrupts =3D <GIC_SPI 95
> IRQ_TYPE_LEVEL_HIGH>;
> > +                                     clocks =3D <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI1_IPG>,
> > +                                              <&clk
> IMX8MP_CLK_DUMMY>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI1_MCLK2>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI1_MCLK3>;
> > +                                     clock-names =3D "bus",
> "mclk0", "mclk1", "mclk2", "mclk3";
> > +                                     dmas =3D <&sdma2 0 2 0>,
> <&sdma2 1 2 0>;
>
> Looking at Documentation/devicetree/bindings/dma/fsl,imx-sdma.yaml should=
 the
> 2nd cell value be 24? This would be true for all other sai nodes.
>
> > +                                     dma-names =3D "rx", "tx";
> > +                                     status =3D "disabled";
> > +                             };
> > +
> > +                             sai2: sai@30c20000 {
> > +                                     compatible =3D "fsl,imx8mp-
> sai", "fsl,imx8mq-sai";
> > +                                     reg =3D <0x30c20000 0x10000>;
> > +                                     interrupts =3D <GIC_SPI 96
> IRQ_TYPE_LEVEL_HIGH>;
> > +                                     clocks =3D <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
> > +                                              <&clk
> IMX8MP_CLK_DUMMY>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI2_MCLK2>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI2_MCLK3>;
> > +                                     clock-names =3D "bus",
> "mclk0", "mclk1", "mclk2", "mclk3";
> > +                                     dmas =3D <&sdma2 2 2 0>,
> <&sdma2 3 2 0>;
> > +                                     dma-names =3D "rx", "tx";
> > +                                     status =3D "disabled";
> > +                             };
> > +
> > +                             sai3: sai@30c30000 {
> > +                                     compatible =3D "fsl,imx8mp-
> sai", "fsl,imx8mq-sai";
> > +                                     reg =3D <0x30c30000 0x10000>;
> > +                                     interrupts =3D <GIC_SPI 50
> IRQ_TYPE_LEVEL_HIGH>;
> > +                                     clocks =3D <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
> > +                                              <&clk
> IMX8MP_CLK_DUMMY>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI3_MCLK2>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI3_MCLK3>;
> > +                                     clock-names =3D "bus",
> "mclk0", "mclk1", "mclk2", "mclk3";
> > +                                     dmas =3D <&sdma2 4 2 0>,
> <&sdma2 5 2 0>;
> > +                                     dma-names =3D "rx", "tx";
> > +                                     status =3D "disabled";
> > +                             };
> > +
> > +                             sai5: sai@30c50000 {
> > +                                     compatible =3D "fsl,imx8mp-
> sai", "fsl,imx8mq-sai";
> > +                                     reg =3D <0x30c50000 0x10000>;
> > +                                     interrupts =3D <GIC_SPI 90
> IRQ_TYPE_LEVEL_HIGH>;
> > +                                     clocks =3D <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> > +                                              <&clk
> IMX8MP_CLK_DUMMY>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI5_MCLK2>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI5_MCLK3>;
> > +                                     clock-names =3D "bus",
> "mclk0", "mclk1", "mclk2", "mclk3";
> > +                                     dmas =3D <&sdma2 8 2 0>,
> <&sdma2 9 2 0>;
> > +                                     dma-names =3D "rx", "tx";
> > +                                     status =3D "disabled";
> > +                             };
> > +
> > +                             sai6: sai@30c60000 {
> > +                                     compatible =3D "fsl,imx8mp-
> sai", "fsl,imx8mq-sai";
> > +                                     reg =3D <0x30c60000 0x10000>;
> > +                                     interrupts =3D <GIC_SPI 90
> IRQ_TYPE_LEVEL_HIGH>;
> > +                                     clocks =3D <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI6_IPG>,
> > +                                              <&clk
> IMX8MP_CLK_DUMMY>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI6_MCLK2>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI6_MCLK3>;
> > +                                     clock-names =3D "bus",
> "mclk0", "mclk1", "mclk2", "mclk3";
> > +                                     dmas =3D <&sdma2 10 2 0>,
> <&sdma2 11 2 0>;
> > +                                     dma-names =3D "rx", "tx";
> > +                                     status =3D "disabled";
> > +                             };
> > +
> > +                             sai7: sai@30c80000 {
> > +                                     compatible =3D "fsl,imx8mp-
> sai", "fsl,imx8mq-sai";
> > +                                     reg =3D <0x30c80000 0x10000>;
> > +                                     interrupts =3D <GIC_SPI 111
> IRQ_TYPE_LEVEL_HIGH>;
> > +                                     clocks =3D <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI7_IPG>,
> > +                                              <&clk
> IMX8MP_CLK_DUMMY>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI7_MCLK1>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI7_MCLK2>,
> > +                                              <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SAI7_MCLK3>;
> > +                                     clock-names =3D "bus",
> "mclk0", "mclk1", "mclk2", "mclk3";
> > +                                     dmas =3D <&sdma2 12 2 0>,
> <&sdma2 13 2 0>;
> > +                                     dma-names =3D "rx", "tx";
> > +                                     status =3D "disabled";
> > +                             };
> > +                     };
> > +
> > +                     sdma3: dma-controller@30e00000 {
> > +                             compatible =3D "fsl,imx8mp-sdma",
> "fsl,imx8mq-sdma";
> > +                             reg =3D <0x30e00000 0x10000>;
> > +                             interrupts =3D <GIC_SPI 34
> IRQ_TYPE_LEVEL_HIGH>;
> > +                             clocks =3D <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> > +                                      <&clk
> IMX8MP_CLK_AUDIO_ROOT>;
> > +                             clock-names =3D "ipg", "ahb";
> > +                             #dma-cells =3D <3>;
> > +                             fsl,sdma-ram-script-name =3D "imx/sdma/
> sdma-imx7d.bin";
> > +                     };
> > +
> > +                     sdma2: dma-controller@30e10000 {
> > +                             compatible =3D "fsl,imx8mp-sdma",
> "fsl,imx8mq-sdma";
> > +                             reg =3D <0x30e10000 0x10000>;
> > +                             interrupts =3D <GIC_SPI 103
> IRQ_TYPE_LEVEL_HIGH>;
> > +                             clocks =3D <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
> > +                                      <&clk
> IMX8MP_CLK_AUDIO_ROOT>;
> > +                             clock-names =3D "ipg", "ahb";
> > +                             #dma-cells =3D <3>;
> > +                             fsl,sdma-ram-script-name =3D "imx/sdma/
> sdma-imx7d.bin";
> > +                     };
> > +
> > +                     audio_blk_ctrl: blk-ctrl@30e20000 {
>
> Shouldn't the node name be 'clock-controller@30e20000' as mentioned in th=
e
> bindings?
> But for the whole series:
> Testes-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>
> Best regards,
> Alexander
>
> > +                             #clock-cells =3D <1>;
> > +                             compatible =3D "fsl,imx8mp-audio-blk-
> ctrl";
> > +                             clocks =3D <&clk IMX8MP_CLK_AUDIO_ROOT>,
> > +                                      <&clk IMX8MP_CLK_SAI1>,
> > +                                      <&clk IMX8MP_CLK_SAI2>,
> > +                                      <&clk IMX8MP_CLK_SAI3>,
> > +                                      <&clk IMX8MP_CLK_SAI5>,
> > +                                      <&clk IMX8MP_CLK_SAI6>,
> > +                                      <&clk IMX8MP_CLK_SAI7>;
> > +                             clock-names =3D "ahb",
> > +                                           "sai1", "sai2",
> "sai3",
> > +                                           "sai5", "sai6",
> "sai7";
> > +                             power-domains =3D <&pgc_audio>;
> > +                             power-domain-names =3D "audio";
> > +                             reg =3D <0x30e20000 0x10000>;
> > +                     };
> > +             };
> > +
> >               aips4: bus@32c00000 {
> >                       compatible =3D "fsl,aips-bus", "simple-bus";
> >                       reg =3D <0x32c00000 0x400000>;
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
