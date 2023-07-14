Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE5DEB64DA
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jul 2023 13:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbjGNNjZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbjGNNjY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jul 2023 09:39:24 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D122D64
        for <linux-clk@vger.kernel.org>; Fri, 14 Jul 2023 06:39:23 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-785cbc5bfd2so75686539f.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Jul 2023 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689341963; x=1691933963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDIgu8AsPlCorihSRjbKNtab0Dj5E7qlVeeiy7clo3I=;
        b=X0/TbDoyWQGvDmCsBTo5QnYj1cDtVLQZVsAdmFY5jeF0+O5fNL7BG6CU2mbyfKaWLl
         V2mb+MCz6LtUT1onUsGe1Jl84o4WlT/leVroI5JE/5TQOsrwlVYRDlSpTrZYcDb9zBnb
         6DrJf9nifcXKhHDRFaHVriXakgS4+6+bAB1JS3RTqcxR/RhbowWoXunKj8ociYL+qCNV
         AOY3pPeqe91QMJXc189uAg8v9HFuod2AciH3umlOqCv3e3sQfFtcowHOjzAh1rVKnVIv
         /PVOeBWL/4AezXhkOxpOyMVd8s99F893YhabICcPF/jwywBdeuCjbIeI+tBB2pTdRar0
         9z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689341963; x=1691933963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDIgu8AsPlCorihSRjbKNtab0Dj5E7qlVeeiy7clo3I=;
        b=JzXPQ8/UJ9NVawEO4Bb5QJ1gD9obqs8s3jLaEaUzLmCVfHWVMYkgCavTbQ+kD5k5xs
         z3KpS/5iZ8Lz+wNJ+MzoKGd6mduYMq7WeLT2bPwmrLd97w5eJqOUpjtCVohuw/StblFR
         oQcJeei8OnLJjOLDRh9398H0jr+W/tqPRaGeZCedVp8azlE1vMlcBSJp9KijQGipMXK9
         Fm2DmMXSuGjzcI9a97doRibLEhE030vM9mLPR6YZZ9H7KEDEtIlmXF80akklrja5AkGj
         ccrB6vNeIY5q6uqDbre/K9SA2WPQJjDHBMaHV0kAgDCGgb744LEsMRRU+73ORb5dYiBv
         flkQ==
X-Gm-Message-State: ABy/qLbxn7hkR+G4o9HTmISEWMfJsgb0lB6JV3GaiZbrMM0piNsY0jY3
        o4TJLAABNk90OpQL/6LIjwX7oPOmz1U8J60D06BVlavJ
X-Google-Smtp-Source: APBJJlHpK+dzquqfJJt2U+ACWYd/aGDuqIM4yd4tcbGExHBm5l/uC5MVg0cKfDTL3GL9mYvU00o47s9IbNLxVZE2BUE=
X-Received: by 2002:a92:c9d1:0:b0:346:6274:5d70 with SMTP id
 k17-20020a92c9d1000000b0034662745d70mr4690134ilq.26.1689341962903; Fri, 14
 Jul 2023 06:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
 <20230713175435.z66efhro7mvnk5gg@pengutronix.de> <DB9PR04MB828202F64FB4F4724B23564FFC37A@DB9PR04MB8282.eurprd04.prod.outlook.com>
 <20230714070916.yybwlxpwiqdwjcw2@pengutronix.de>
In-Reply-To: <20230714070916.yybwlxpwiqdwjcw2@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 14 Jul 2023 08:39:11 -0500
Message-ID: <CAHCN7x+fs7k0y8Sps+0N7NUPVto8UhZD9E8DbVEuDRPv6bdDMg@mail.gmail.com>
Subject: Re: [EXT] Re: bounds of pdiv in clk-pll14xx.c
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Adrian Alonso <adrian.alonso@nxp.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "bli@bang-olufsen.dk" <bli@bang-olufsen.dk>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 14, 2023 at 2:22=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi Adrian,
>
> thanks for the fast reply :)
>
> On 23-07-13, Adrian Alonso wrote:
> > Hi,
> >
> > +Bligaard
> >
> > FRef for Audio/Video PLLs are usually 24Mhz/25Mhz;
>
> All PLLs are sourced by the external 24MHz osc if I understood the
> i.MX8M{N,M,P} reference manuals correctly.
>
> > But most common use case for dynamic reconf is for Audio PLL
> > Where prate =3D 2 4Mhz (FRef) could derive 44.1khz/44khz sample rates
>
> Video-plls are very device/use-case specific too.

I have spent a bunch of time trying to troubleshoot video stuff, and
some video_pll clocks are challenging to achieve, and I was trying to
figure out how to improve this driver.

>
> > b) 1 <=3D p <=3D 63; (1 <=3D p <=3D 4 if prate =3D 24MHz);
> >
> > Found out this old commit log:
> >
> > clk: imx: dynamic audio pll rate settings
> >
> > Add support for dynamic audio pll rate settings
> > Calculate optimal dividers close to required user freq request
> > Fractional PLL constrains:
> >  a). 6MHz <=3D Fref <=3D 25MHz;
> >  b). 1 <=3D p <=3D 63; if Fref is external cristal Fref =3D 24Mhz
> >      1 <=3D p <=3D 4;
>
> Where is this restriction of 1 <=3D p <=3D 4 (fref =3D 24MHz) mentioned? =
I
> wasn't able to find that limitation within the reference-manual nor the
> datasheet.

I looked too, and I couldn't find it either.

>
> >  c). 64 <=3D m <=3D 1023;
> >  d). 0 <=3D s <=3D 6;
> >  e). -32768 <=3D k <=3D 32767;
> >
> > Usage example:
> > ------------------------------------------------------------
> > cat /sys/devices/platform/30030000.sai/pll1
> > 722534400
> > echo 589824000 > /sys/devices/platform/30030000.sai/pll1
> > ------------------------------------------------------------
> >
> > clk_int_pll1443x_recalc_rate: 589823982:393:1:4:14155
> > mdiv =3D 393; pdiv =3D 1; sdiv =3D 4; kdiv =3D 14155;
> > Audio PLL rate =3D 589823982 Hz
> >
> > cat /sys/kernel/debug/clk/clk_summary
> > ------------------------------------------------------------
> >  audio_pll2_ref_sel  0            0    24000000 0 0
> >   audio_pll2         0            0   589823982 0 0
> >    audio_pll2_bypass 0            0   589823982 0 0
> >     audio_pll2_out   0            0   589823982 0 0
>
> With the reference manual mentioned: 1 <=3D p <=3D 63 restriction you may
> find the exact clock rate of: 589824000. So question is why do we have
> this limitation?

When you do this, what values of mpsk do you get (or at least what value of=
 p)?

I am going to re-test some of the video_pll stuff with p between 1 and
63 instead of 1 to 4 as well.  I am hoping it will solve some LCDIF
issues.

adam
>
> Regards,
>   Marco
