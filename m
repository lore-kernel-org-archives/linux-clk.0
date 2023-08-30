Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F934C6FA8F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Aug 2023 20:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238581AbjH3UJ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Aug 2023 16:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241966AbjH3UJd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Aug 2023 16:09:33 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498472D27F;
        Wed, 30 Aug 2023 13:00:13 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d7485d37283so5782139276.1;
        Wed, 30 Aug 2023 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693425552; x=1694030352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvBB5LcsItPGIg0EWgsOLnwri4Ho2gDJRdAN+y6MWmg=;
        b=ESvMtuiaUP814KG4tIB+lvnlhFzkG+FSk8KrmDgt7krHucqCsUO7P6E/K1rJcCchgy
         FIAoZgpZG+D9CSwoP64p0z0Vh4njj/89jF8PN0Csrpg9fO/7hh3e+3ItJrqSQZ81hO5j
         pKJBEgkUz8gi7Pvvs6wx7RTMlJ4D9+UM5599cZ4EkVskiDOqSrmFYPHV8u3pPi7PZfT3
         My0cl71FO+4zo6UWoCSBLMzUHWHITtVGSNxdTecq3oZpQilTnpER3la+J6aAnyxhjSyY
         hfF3MBpF/pI2Lk1tdSBcI+hEBwCHAkfXEf7VIl+lFsQZ5U+bGf0kqKHfG70MIDOyn9aD
         f8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693425552; x=1694030352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvBB5LcsItPGIg0EWgsOLnwri4Ho2gDJRdAN+y6MWmg=;
        b=Mh3io1x42ZZTn7y25T0a4fPxdFLWWHDebjrg7DSTzokXDCCXWkOZf3DJitZiuJbooI
         JJcOfW/CWLsziE26fZFkiOFPk8IR08ld3+VQudVbpI+iXrOEY70qocr9Dn2UGk0LAXMe
         4WmQ379OeS7B8+cC7MkGmUdBLOwIiAan2d2SFkkdgoCF8YLajlc7J/e2EerFc57Pxfh+
         d84NIa1h21yTTt+CUOo4uxbZJ2B04uYwpI7mxqXjPeHL7Wj3GersiI/BoNse1ijfjC9S
         RBIxESOQDyeGaClduXv+KWOZmVou6UYFvESu6cANVCIg2Bg6XYH9Kzhp822DJhsWU3/1
         PbcQ==
X-Gm-Message-State: AOJu0YwvzDHMBCP9+dMAyG1viHX1zg3up8kr8Rao4LhE9xtlXY5Q+isF
        WMQ8wnaaU94u1W2vgBHI142eApU4cphD1MVlpV0=
X-Google-Smtp-Source: AGHT+IG5m6A9UTfw4f3ZPN7qJ+0GBiRuVHh3vlhGF1hn8wHOvQrL8tG4URzkQibpiAY4OhUKEdYoE4Sv/QadmpRS+dU=
X-Received: by 2002:a25:c589:0:b0:d77:ec2f:63b with SMTP id
 v131-20020a25c589000000b00d77ec2f063bmr3376340ybe.5.1693425552314; Wed, 30
 Aug 2023 12:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230508114236.8444-1-marex@denx.de> <CAHCN7xJGMkf3MZWK5NqtUxnSTRaZdL-8f3ngUsOUKEdOmdUvXw@mail.gmail.com>
 <d99a1da1-1486-a4e6-c377-87effd3fd1bc@denx.de>
In-Reply-To: <d99a1da1-1486-a4e6-c377-87effd3fd1bc@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 30 Aug 2023 14:59:00 -0500
Message-ID: <CAHCN7xKGowhQbBDdnOKgcBptsM1VzD7YJB=ZAbL1Oge4rgnLUg@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
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

On Wed, Aug 30, 2023 at 2:10=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 8/30/23 04:44, Adam Ford wrote:
>
> Hi,
>
> > I have a question about the clocking for eASRC and PDM.
> >
> >> +
> >> +                       audio_blk_ctrl: clock-controller@30e20000 {
> >> +                               compatible =3D "fsl,imx8mp-audio-blk-c=
trl";
> >> +                               reg =3D <0x30e20000 0x10000>;
> >> +                               #clock-cells =3D <1>;
> >> +                               clocks =3D <&clk IMX8MP_CLK_AUDIO_ROOT=
>,
> >> +                                        <&clk IMX8MP_CLK_SAI1>,
> >> +                                        <&clk IMX8MP_CLK_SAI2>,
> >> +                                        <&clk IMX8MP_CLK_SAI3>,
> >> +                                        <&clk IMX8MP_CLK_SAI5>,
> >> +                                        <&clk IMX8MP_CLK_SAI6>,
> >> +                                        <&clk IMX8MP_CLK_SAI7>;
> >> +                               clock-names =3D "ahb",
> >> +                                             "sai1", "sai2", "sai3",
> >> +                                             "sai5", "sai6", "sai7";
> >> +                               power-domains =3D <&pgc_audio>;
> >> +                       };
> >> +               };
> >> +
> >
> > I am trying to plumb in the micfil driver with a PDM microphone on a
> > Plus.  I have SAI3 and SAI5 audio working, but if I try to use the
> > micfil, the PDM clock doesn't get turned on, and the micfil doesn't
> > appear to see anything coming in.  I was curious why the
> > audio_blk_ctrl has clock entries for IMX8MP_CLK_SAIx, but there isn't
> > one for the PDM nor the ASRC clocks.
>
> I only ever needed SAI, so that was what was tested on the EVK .

That makes sense.

>
> > I added the MICFIL noted to the
> > 8mp in a previous patch [1], and I am trying to customize the MICFIL
> > node as follows:
> >
> > &micfil {
> > #sound-dai-cells =3D <0>;
> > pinctrl-names =3D "default";
> > pinctrl-0 =3D <&pinctrl_pdm>;
> > assigned-clocks =3D <&clk IMX8MP_CLK_PDM>;
> > assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
> > assigned-clock-rates =3D <196608000>;
> > status =3D "okay";
> > };
> >
> > I also noticed in the down-stream kernel, the pdm_ipg_clk and
> > pdm_root_clk are shared gates with separate parents.
> >
> > The PDM tree of the down-stream kernel looks like this:
> >   audio_pll1_ref_sel                0        0        0    24000000
> >       0     0  50000         Y
> >         audio_pll1                     0        0        0   393216000
> >          0     0  50000         Y
> >            audio_pll1_bypass           0        0        0   393216000
> >          0     0  50000         Y
> >               audio_pll1_out           0        0        0   393216000
> >          0     0  50000         N
> >                  pdm                   0        0        0   196608000
> >          0     0  50000         N
> >                     pdm_root           0        0        0   196608000
> >          0     0  50000         N
> >                        pdm_sel         0        0        0   196608000
> >          0     0  50000         Y
> >                           pdm_root_clk       0        0        0
> > 196608000          0     0  50000         N
> >
> > The PDM tree of the mainline looks like this:
> >
> >     audio_pll1_ref_sel                0        0        0    24000000
> >         0     0  50000         Y
> >         audio_pll1                     0        0        0   393216000
> >          0     0  50000         Y
> >            audio_pll1_bypass           0        0        0   393216000
> >          0     0  50000         Y
> >               audio_pll1_out           0        0        0   393216000
> >          0     0  50000         N
> >                  pdm                   0        0        0   196608000
> >          0     0  50000         N
> >                     pdm_root           0        0        0   196608000
> >          0     0  50000         N
> >                        pdm_sel         0        0        0   196608000
> >          0     0  50000         Y
> >
> > It seems like the "pdm_root_clk" generated by the shared audo-blk
> > down-sream driver is missing from the mainline.  I looked up the clock
> > I referenced when I attempted to enable the miffil, but
> > 'IMX8MP_CLK_AUDIOMIX_PDM_ROOT doesn't appear to be configured in
> > either clk-imx8mp.c or clk-imx8mp-audiomix.c.  Maybe it's obscured by
> > the macros, but it seems like the pdm_sel should somehow have an
> > additional variable for the shared clock and an additional clock like
> > pdm_root_clk assigned with it.
> >
> > I have similar configurations for Mini and Nano, and both of them are
> > able to record audio, so I think there might be a clock issue
> > somewhere related to the audiomix driver, and not a misconfiguration
> > of the sound-card or the micfil itself.
>
> Shouldn't the micfil be somehow a consumer of the pdm_sel clock , and
> enable those clock in the driver ?

Micfil references IMX8MP_CLK_AUDIOMIX_PDM_IPG, and
IMX8MP_CLK_AUDIOMIX_PDM_ROOT.  I am not convinced the
IMX8MP_CLK_AUDIOMIX_PDM_ROOT exists beyond a #define in an include
directory.  I tried making it use pdm_sel, but it threw an error.  I
am not near my system, so I'm sorry I don't have more details.

In the downstream kernel IMX8MP_CLK_AUDIOMIX_PDM_ROOT was a child of
pdm_sel, but I am not certain as to what the difference between them
was since they appeared to be shared.

adam
