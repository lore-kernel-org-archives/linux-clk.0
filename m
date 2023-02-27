Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3239C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 18:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjB0SFz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 13:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjB0SFr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 13:05:47 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB357A80;
        Mon, 27 Feb 2023 10:05:21 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so6463138pjg.4;
        Mon, 27 Feb 2023 10:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mPlMXv9RJI8/oFUUFc+RfUGUZO2bZNQ4Ayc+xRFn3c=;
        b=By1hdEB7xxxN2kWGRWBOcLI13i8RhANt8RWn6SuIg1ojFHi5c6fgGpexO3pl76ELqk
         QVcFsvOc7BukBEpAK6SLjFt0QzjbjI5erzeQbNQnLVflQOCQbPOHBVfIiC26mS1ja/MX
         ptKHaxNaxRoPblImFN0UlMllMbJhLhQOaIb4bdYxH7WquWObfSISh8SC5zo+Zeorfvi9
         BGotYGwKraxBmQeTFNqIM2LtYVSROM31h5ynsdsV8oTPEw4c54B/dnObetZ9FlHqjboP
         7FEwgtTDl0bhVBP2SaPly2rO86rSFlCqBcyFn969Qf9R8vFR+u2xA6NnM9qvaPZ9YBeT
         jGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mPlMXv9RJI8/oFUUFc+RfUGUZO2bZNQ4Ayc+xRFn3c=;
        b=pgMYQfJSE2A2Z+hW8RhXskZ3CuSab7C/3efCE0p8zrKh+rGhxByTyvSjBETRgmicmi
         ssk8wLomEXKjjSS0GoMM9yVFpq4izb7LiGmcUgCevrf7jZIdNeC5swKs/UxxGkmowtPX
         T6ovK2HOul16sVwWZ8oQAn+NdIPkGMqd2I4lxQdJoWaueVz6xhZ1HXDCOpPsC+DSH9Iq
         vEgJz2t1c7RtgqWF2ohtf/h/8v+n8X0TRkjcDDz8Ati+zCrYoJTwt5glHecD7SvvIEcq
         j2iuSN+0Raw6ikffi793OaDUMyazpPz6F1VYzkZKxmykK7YzYaNpMNJ6RaOSahsbXN/V
         zAMA==
X-Gm-Message-State: AO0yUKV03NyYWo0qLmUObwGOk0M+ZsUi0BYd/smktlhALIx9V7fpJtwQ
        p0Swqzcnjih5vvLqf3dp1kkQJtERD0gaccSSg0Y=
X-Google-Smtp-Source: AK7set/sCYYETNno69V+PDf7R8xKuDmVtnx/nlOmyfqZlwSRzv+JYCUVBsf8oPkLy4vfgwJq2pyQgzG6NsgK47Wrenc=
X-Received: by 2002:a17:90a:578a:b0:234:bed1:1012 with SMTP id
 g10-20020a17090a578a00b00234bed11012mr48894pji.6.1677521120846; Mon, 27 Feb
 2023 10:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20230227174535.87657-1-marex@denx.de>
In-Reply-To: <20230227174535.87657-1-marex@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 27 Feb 2023 12:05:09 -0600
Message-ID: <CAHCN7x+a-9pZFepD=543ri+TK2y-TDf9Nc44iRqpBnvf_qMk_A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI nodes
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
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 27, 2023 at 11:58=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Add #sound-dai-cells properties to SAI nodes.
>

Should this have a fixes tag?

Fixes: 9e9860069725 ("arm64: dts: imx8mn: Add SAI nodes")

I don't know when these became required, and/or if this should be
back-ported or not.

Reviewed-by: Adam Ford <aford173@gmail.com>

adam

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
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mn.dtsi
> index ed9ac6c5047c0..bbec860ef8548 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> @@ -294,6 +294,7 @@ spba2: spba-bus@30000000 {
>                                 ranges;
>
>                                 sai2: sai@30020000 {
> +                                       #sound-dai-cells =3D <0>;
>                                         compatible =3D "fsl,imx8mn-sai", =
"fsl,imx8mq-sai";
>                                         reg =3D <0x30020000 0x10000>;
>                                         interrupts =3D <GIC_SPI 96 IRQ_TY=
PE_LEVEL_HIGH>;
> @@ -308,6 +309,7 @@ sai2: sai@30020000 {
>                                 };
>
>                                 sai3: sai@30030000 {
> +                                       #sound-dai-cells =3D <0>;
>                                         compatible =3D "fsl,imx8mn-sai", =
"fsl,imx8mq-sai";
>                                         reg =3D <0x30030000 0x10000>;
>                                         interrupts =3D <GIC_SPI 50 IRQ_TY=
PE_LEVEL_HIGH>;
> @@ -322,6 +324,7 @@ sai3: sai@30030000 {
>                                 };
>
>                                 sai5: sai@30050000 {
> +                                       #sound-dai-cells =3D <0>;
>                                         compatible =3D "fsl,imx8mn-sai", =
"fsl,imx8mq-sai";
>                                         reg =3D <0x30050000 0x10000>;
>                                         interrupts =3D <GIC_SPI 90 IRQ_TY=
PE_LEVEL_HIGH>;
> @@ -338,6 +341,7 @@ sai5: sai@30050000 {
>                                 };
>
>                                 sai6: sai@30060000 {
> +                                       #sound-dai-cells =3D <0>;
>                                         compatible =3D "fsl,imx8mn-sai", =
"fsl,imx8mq-sai";
>                                         reg =3D <0x30060000  0x10000>;
>                                         interrupts =3D <GIC_SPI 90 IRQ_TY=
PE_LEVEL_HIGH>;
> @@ -395,6 +399,7 @@ spdif1: spdif@30090000 {
>                                 };
>
>                                 sai7: sai@300b0000 {
> +                                       #sound-dai-cells =3D <0>;
>                                         compatible =3D "fsl,imx8mn-sai", =
"fsl,imx8mq-sai";
>                                         reg =3D <0x300b0000 0x10000>;
>                                         interrupts =3D <GIC_SPI 111 IRQ_T=
YPE_LEVEL_HIGH>;
> --
> 2.39.2
>
