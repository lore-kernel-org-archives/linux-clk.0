Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5DEC7EE31
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 11:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjB1LaK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 06:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjB1L3v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 06:29:51 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0111C2F79C;
        Tue, 28 Feb 2023 03:29:31 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id c23so9442796pjo.4;
        Tue, 28 Feb 2023 03:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VGPD9O7xgFtCXS003sZfrOoAyNn9vk4/6H99lAkdu1o=;
        b=jU/niE1WrfTm1NLwexIPBwLYJ4PBm6RHs5YOAz6xtutaOiRXbzwm/hKC5C5MH3C+xB
         yDPdTtIxj6gaOT/OJuoKC72bcKyWNOrRwlwsSTz0CXmeEmtCnhH1Nucv4hc/FL2DxdgQ
         EXco6PIIRTkjVDTViGq4ZJJMYtaDwq6lQnD3FFTsEsGU6R2LFFyMh69IK0ZXu+NeUlbU
         YVTw8NNuBvUdVVLA6tvnqQ0/DCbMgfhhxaMqRyd0zpoRE0ULBtRUFoDRDkC02jWXknIn
         npyreAyBny2lbyhL/7JLICbNh9kU1LSDKIJGX7Y56NssgXOhJzeDB1RYDx/mhQrh2Pvo
         b8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGPD9O7xgFtCXS003sZfrOoAyNn9vk4/6H99lAkdu1o=;
        b=AD6qIiXcD+cdM4MTWMHKKQ9aEzDN98MBaMSv4AV7ZTI4UkHMUGr7MylRmOQRRrFA7T
         Dwik6YcuL6Psp2JT/t3TKLcMbLaCT5WaSdeWHtXQUYQSA5ELshyPdLp3cU7hkj32tXor
         z6SZ6f909gvsSMAZoLI/KEfq5Xa83sFzW9nm6rg2CY9WcMqBthDEzEm2QFWdpit1f7Ej
         SiElG3UCbHaKS5LwsqCvWDITgl75MK1j/qFIOU9ez3Cp2imXCDvMIvZ8C6mzYfw1QjHg
         FR3mAjYTvjmpIVil7dIahevZay2aCgvdiQfoBc44qGageHXHD1G0QxiE2d0l5Bc7TjdP
         ghlA==
X-Gm-Message-State: AO0yUKWeEbz6NsmsNsgp4Z4jpx+pnz0tCjOQ+PNDiyLj2dsXERXx8dXb
        2B598JeU8eGJGCU/gfvYj/V07nvBOCH7pG3eYHQ=
X-Google-Smtp-Source: AK7set86lN+bt338TSYpTLlmOUzXkwHeJZLErNy9rjj31DPGBof8BrA5O7N01GKJPijodPOzi3RDL2dtCpqGcbELmvI=
X-Received: by 2002:a17:902:efd4:b0:19b:636:b153 with SMTP id
 ja20-20020a170902efd400b0019b0636b153mr840822plb.6.1677583765027; Tue, 28 Feb
 2023 03:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20230227174308.87286-1-marex@denx.de> <20230227174308.87286-5-marex@denx.de>
 <20230227185949.xaxltai4ksgrczmc@pengutronix.de> <c3b3c08c-989b-3868-c74f-426b8f1733a5@denx.de>
 <CAHCN7x+Jd+C2B+-igv=Pk0Ab4Tj7ecxRrdV85u5CSZ5DjFs5kA@mail.gmail.com>
 <3378fb83-d88d-4854-c096-b459672eef08@denx.de> <01f83ee3-51e0-4c7b-8abd-1a8e40abcdf2@denx.de>
In-Reply-To: <01f83ee3-51e0-4c7b-8abd-1a8e40abcdf2@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 28 Feb 2023 05:29:12 -0600
Message-ID: <CAHCN7xJC23KB+9XBRK8F8catugayjzFRS0DEdgvAG+GMsmhb9g@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
To:     Marek Vasut <marex@denx.de>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, linux-clk@vger.kernel.org,
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
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 28, 2023 at 12:48 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/28/23 07:43, Marek Vasut wrote:
> > On 2/28/23 03:44, Adam Ford wrote:
> >> On Mon, Feb 27, 2023 at 1:37 PM Marek Vasut <marex@denx.de> wrote:
> >>>
> >>> On 2/27/23 19:59, Marco Felsch wrote:
> >>> [...]
> >>>
> >>>>> @@ -344,6 +384,18 @@ &i2c3 {
> >>>>>       pinctrl-0 = <&pinctrl_i2c3>;
> >>>>>       status = "okay";
> >>>>>
> >>>>> +    wm8960: codec@1a {
> >>>>> +            #sound-dai-cells = <0>;
> >>>>> +            compatible = "wlf,wm8960";
> >>>>> +            reg = <0x1a>;
> >>>>
> >>>> The compatible should be the first property followed by the reg
> >>>> property.
> >>>
> >>> See my reply to the mx8mn sound-sai-cells patch , I am not sure here.
> >>> The rest is fixed in V6.
> >>>
> >>>>> +            clocks = <&audio_blk_ctrl
> >>>>> IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
> >>>>> +            clock-names = "mclk";
> >>>>> +            wlf,shared-lrclk;
> >>>>> +            wlf,hp-cfg = <3 2 3>;
> >>>>> +            wlf,gpio-cfg = <1 3>;
> >>>>> +            SPKVDD1-supply = <&reg_audio_pwr>;
> >>>>> +    };
> >>>>> +
> >>>>>       pca6416: gpio@20 {
> >>>>>               compatible = "ti,tca6416";
> >>>>>               reg = <0x20>;
> >>>
> >>> [...]
> >>>
> >>>>> @@ -668,6 +730,18 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS   0x140
> >>>>>               >;
> >>>>>       };
> >>>>>
> >>>>> +    pinctrl_sai3: sai3grp {
> >>>>> +            fsl,pins = <
> >>>>> +
> >>>>> MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC   0xd6
> >>>>> +
> >>>>> MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK    0xd6
> >>>>> +
> >>>>> MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00  0xd6
> >>>>> +
> >>>>> MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00  0xd6
> >>>>> +
> >>>>> MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK      0xd6
> >>>>> +
> >>>>> MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28              0xd6
> >>>>
> >>>> What is gpio04-io28 used for?
> >>>
> >>> Apparently unused, dropped.
> >>
> >> Isn't that the headphone detect GPIO?
> >>
> >> I think simple-audio-card,hp-det-gpio can reference it.
> >
> > Per the schematics of the MX8MP EVK, the pin is not connected on the
> > board-to-board connector EVK side, right ?
>
> Er, correction, that's AUD_NINT, which is WM8960 GPIO1 .

I only went by NXP's downstream device tree.  I didn't have the
schematics in front of me.  Sorry for the noise.

adam
