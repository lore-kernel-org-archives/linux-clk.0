Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93EAC83F29
	for <linux-clk@archiver.kernel.org>; Thu, 31 Aug 2023 04:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbjHaEdG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Aug 2023 00:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjHaEdF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 00:33:05 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA697C0;
        Wed, 30 Aug 2023 21:33:02 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-26b41112708so313113a91.3;
        Wed, 30 Aug 2023 21:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693456382; x=1694061182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WmUrUqdBQLctGxnIomaEYA9Qf5elBgZRtmHeFAg/fw=;
        b=IeUxpCYVp9NF8MR2AojVLjOAAqJIbPogUaWLrwdEl9SdNlg6rkVrFxRQaMUrWMyzCd
         ZaH+nwDn0303wLR5Y9eENiWhENUwAN65X1Lg6f5vWj6dVN6/3bQIRCxes4iLniY3BI/7
         +4QM93SlL6kzefDyFuYr9vp9NalVQb20cb6EqIRnKejYL3AkN5ePUxl+dLCS6PQC0Est
         cUVGEpbpYohbF+Gv9m04LuEv86U85ioMNOh9eJ3oGq85gCjdJY0LbSpQQaTZOJh7c2n2
         ZAZOWi9lXkvFWMa5Vki+dMyHOak/+HZ45vEXukK5H0KWNpYNVlz75Ydb65JV2swLGpLe
         sPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693456382; x=1694061182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WmUrUqdBQLctGxnIomaEYA9Qf5elBgZRtmHeFAg/fw=;
        b=DETe27HhhBpfz7V8JGikuf+KQXfUSRQwKP94vmhc5q2YZF4MZu6hbQ//+LZmhDzg6z
         fzE3hSr12lIjRNnyoWI8E7k+ia+ciOBIm2n+mS8TXht7qxFuLMVXdo5A10ythDhFrtpT
         9sJvtQKF2rT4u6Gc+U6sDCyQ5njj1KYEBpevrnoiF82C15UUEAOcmEr3tAju64XA4Ox8
         8Cf8Sg+4ZoCzOOQknlqu517knJwJr/Mo+mHmrt4exqajBwVWtPqKt+OGblMOovG2W0Un
         bvRQtXMQoluoiIx621of/5OnqDEgwPZYMvN9KRwEb+B6YRbe43oW5iiPb75qYTRCbtKD
         331g==
X-Gm-Message-State: AOJu0Yz9xQFEtZgVQ2EqbS5rlvL+y/7KGTmDbcWlZdOYU9TIJOdDO4+p
        oid5BgqzPwnUbkcPP18j5cC4+sXuICpEgoDk91O7OX/a3q7W/A==
X-Google-Smtp-Source: AGHT+IFyU5b7WMPdNa3waS6j7IAdUPn2DL26wcw0UMhQyEpUPB8ZOZx8GgRUXNTqeyxE/ztbhev6r1BWZs3ERh2Z4Fo=
X-Received: by 2002:a17:90b:1647:b0:268:14d7:bc34 with SMTP id
 il7-20020a17090b164700b0026814d7bc34mr4153557pjb.20.1693456381992; Wed, 30
 Aug 2023 21:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230508114236.8444-1-marex@denx.de> <CAHCN7xJGMkf3MZWK5NqtUxnSTRaZdL-8f3ngUsOUKEdOmdUvXw@mail.gmail.com>
 <d99a1da1-1486-a4e6-c377-87effd3fd1bc@denx.de> <CAHCN7xKGowhQbBDdnOKgcBptsM1VzD7YJB=ZAbL1Oge4rgnLUg@mail.gmail.com>
 <c8ab4eaa-20de-a586-0074-64cfe588a746@denx.de>
In-Reply-To: <c8ab4eaa-20de-a586-0074-64cfe588a746@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 30 Aug 2023 23:32:49 -0500
Message-ID: <CAHCN7xJ2Pxz4jB1EQbhA-tOMFheVWcWyXB53dW7sRvj0D2xi=Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
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

On Wed, Aug 30, 2023 at 3:50=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 8/30/23 21:59, Adam Ford wrote:
> > On Wed, Aug 30, 2023 at 2:10=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 8/30/23 04:44, Adam Ford wrote:
> >>
> >> Hi,
> >>
> >>> I have a question about the clocking for eASRC and PDM.
> >>>
> >>>> +
> >>>> +                       audio_blk_ctrl: clock-controller@30e20000 {
> >>>> +                               compatible =3D "fsl,imx8mp-audio-blk=
-ctrl";
> >>>> +                               reg =3D <0x30e20000 0x10000>;
> >>>> +                               #clock-cells =3D <1>;
> >>>> +                               clocks =3D <&clk IMX8MP_CLK_AUDIO_RO=
OT>,
> >>>> +                                        <&clk IMX8MP_CLK_SAI1>,
> >>>> +                                        <&clk IMX8MP_CLK_SAI2>,
> >>>> +                                        <&clk IMX8MP_CLK_SAI3>,
> >>>> +                                        <&clk IMX8MP_CLK_SAI5>,
> >>>> +                                        <&clk IMX8MP_CLK_SAI6>,
> >>>> +                                        <&clk IMX8MP_CLK_SAI7>;
> >>>> +                               clock-names =3D "ahb",
> >>>> +                                             "sai1", "sai2", "sai3"=
,
> >>>> +                                             "sai5", "sai6", "sai7"=
;
> >>>> +                               power-domains =3D <&pgc_audio>;
> >>>> +                       };
> >>>> +               };
> >>>> +
> >>>
> >>> I am trying to plumb in the micfil driver with a PDM microphone on a
> >>> Plus.  I have SAI3 and SAI5 audio working, but if I try to use the
> >>> micfil, the PDM clock doesn't get turned on, and the micfil doesn't
> >>> appear to see anything coming in.  I was curious why the
> >>> audio_blk_ctrl has clock entries for IMX8MP_CLK_SAIx, but there isn't
> >>> one for the PDM nor the ASRC clocks.
> >>
> >> I only ever needed SAI, so that was what was tested on the EVK .
> >
> > That makes sense.
> >
> >>
> >>> I added the MICFIL noted to the
> >>> 8mp in a previous patch [1], and I am trying to customize the MICFIL
> >>> node as follows:
> >>>
> >>> &micfil {
> >>> #sound-dai-cells =3D <0>;
> >>> pinctrl-names =3D "default";
> >>> pinctrl-0 =3D <&pinctrl_pdm>;
> >>> assigned-clocks =3D <&clk IMX8MP_CLK_PDM>;
> >>> assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
> >>> assigned-clock-rates =3D <196608000>;
> >>> status =3D "okay";
> >>> };
> >>>
> >>> I also noticed in the down-stream kernel, the pdm_ipg_clk and
> >>> pdm_root_clk are shared gates with separate parents.
> >>>
> >>> The PDM tree of the down-stream kernel looks like this:
> >>>    audio_pll1_ref_sel                0        0        0    24000000
> >>>        0     0  50000         Y
> >>>          audio_pll1                     0        0        0   3932160=
00
> >>>           0     0  50000         Y
> >>>             audio_pll1_bypass           0        0        0   3932160=
00
> >>>           0     0  50000         Y
> >>>                audio_pll1_out           0        0        0   3932160=
00
> >>>           0     0  50000         N
> >>>                   pdm                   0        0        0   1966080=
00
> >>>           0     0  50000         N
> >>>                      pdm_root           0        0        0   1966080=
00
> >>>           0     0  50000         N
> >>>                         pdm_sel         0        0        0   1966080=
00
> >>>           0     0  50000         Y
> >>>                            pdm_root_clk       0        0        0
> >>> 196608000          0     0  50000         N
> >>>
> >>> The PDM tree of the mainline looks like this:
> >>>
> >>>      audio_pll1_ref_sel                0        0        0    2400000=
0
> >>>          0     0  50000         Y
> >>>          audio_pll1                     0        0        0   3932160=
00
> >>>           0     0  50000         Y
> >>>             audio_pll1_bypass           0        0        0   3932160=
00
> >>>           0     0  50000         Y
> >>>                audio_pll1_out           0        0        0   3932160=
00
> >>>           0     0  50000         N
> >>>                   pdm                   0        0        0   1966080=
00
> >>>           0     0  50000         N
> >>>                      pdm_root           0        0        0   1966080=
00
> >>>           0     0  50000         N
> >>>                         pdm_sel         0        0        0   1966080=
00
> >>>           0     0  50000         Y
> >>>
> >>> It seems like the "pdm_root_clk" generated by the shared audo-blk
> >>> down-sream driver is missing from the mainline.  I looked up the cloc=
k
> >>> I referenced when I attempted to enable the miffil, but
> >>> 'IMX8MP_CLK_AUDIOMIX_PDM_ROOT doesn't appear to be configured in
> >>> either clk-imx8mp.c or clk-imx8mp-audiomix.c.  Maybe it's obscured by
> >>> the macros, but it seems like the pdm_sel should somehow have an
> >>> additional variable for the shared clock and an additional clock like
> >>> pdm_root_clk assigned with it.
> >>>
> >>> I have similar configurations for Mini and Nano, and both of them are
> >>> able to record audio, so I think there might be a clock issue
> >>> somewhere related to the audiomix driver, and not a misconfiguration
> >>> of the sound-card or the micfil itself.
> >>
> >> Shouldn't the micfil be somehow a consumer of the pdm_sel clock , and
> >> enable those clock in the driver ?
> >
> > Micfil references IMX8MP_CLK_AUDIOMIX_PDM_IPG, and
> > IMX8MP_CLK_AUDIOMIX_PDM_ROOT.  I am not convinced the
> > IMX8MP_CLK_AUDIOMIX_PDM_ROOT exists beyond a #define in an include
> > directory.  I tried making it use pdm_sel, but it threw an error.  I
> > am not near my system, so I'm sorry I don't have more details.
> >
> > In the downstream kernel IMX8MP_CLK_AUDIOMIX_PDM_ROOT was a child of
> > pdm_sel, but I am not certain as to what the difference between them
> > was since they appeared to be shared.
>
> The pdm_sel is definitely a mux . Is there a follow-up gate after the mux=
 ?

Not that I could see.  I think I was just overthinking it.  I saw the
IMX8MP_CLK_AUDIOMIX_PDM_ROOT in mx8mp-clock.h which matched the
reference in the downstream kernel, so I was expecting that to be the
same clock name.  When it didn't work, I thought I was missing
something because I only saw the pdm_sel mux and no direct reason or
reference to IMX8MP_CLK_AUDIOMIX_PDM_ROOT.  I have it working now.
Sorry for the noise.  I'll get my series cleaned up and push another
revision to add micfil node to the 8mp, and I'll probably remove the
IMX8MP_CLK_AUDIOMIX_PDM_ROOT imx8mp-clock.h so it doesn't throw
someone else off.

I appreciate your input.

adam
