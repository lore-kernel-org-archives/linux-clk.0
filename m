Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152FAEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 19:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjGYT7y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 15:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjGYT7w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 15:59:52 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589E12121
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 12:59:46 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-563c4244e8cso1248144a12.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690315186; x=1690919986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IxDBZdMkyPVkfoXPzWjPL3ahzhDL/DgYEiGpBQLj6A=;
        b=mUz0NhWLclz/0FjN0CORHr48t7MvxfG+/FYgzbc19u/MzWC01klUizoY9TwMdIOFS5
         CTzlVnmbnhsveMmnlU1UL5RDBSni8k/5qJve/hGgUpSdhnC2Ftlsci3Mv0nvlh97yLVH
         Uq4UjvLrWBanZa4r1i5skkpBiThbHnNSxp+OyJ5hbSXikl1XJUtjk+wXMeKrGjJ0iDCM
         SHC1lxhinAgPrIz4tkCZLKfyHvLCgtD2PJwmfIA0hb3BEjfgi2hf4IfKCcVd5SU6y0li
         jJ4/tF1DhpYhtqWfrmTuX6465/s0LxsyhAdLC/nFmhgqmVBzS5HhezhDOpVC3lnUfVsk
         xKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690315186; x=1690919986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IxDBZdMkyPVkfoXPzWjPL3ahzhDL/DgYEiGpBQLj6A=;
        b=KYG+A8Aj+9Ii19r5ByDOieF5IanXPFALvcrDaSwbw3wuTvOFpmK4UdoRq/8liw7xda
         Ydb0uA2DwWWybsVAqmHgYnvw5L22QFb8REcjQZ4x/TRN+s3/tiFKxb/zzwgH/L41RQvM
         Yy4mM6OCg+KG3lAFf43fhexWBXSbjQYQ720xSzva123WvTeh0wLv8azzRCUXCC1PWAYx
         wcS1x+0OsboooUBotKoJ2k4kNQ5Yd76Nn8VBteVBD8yKpsRr1+7U+6Z+vo/wLUx0zaI8
         yanPCnFOPpWvgd8QDSfZmAXNTi+cGgF9zUuLLE0plvkdCWUgX8RwRboXdQyIC/Qx4zBF
         1ctw==
X-Gm-Message-State: ABy/qLahR5If0Sf7HgGU44VI7cRqrRlGafu6Lk7vaPouJ/MgNP+QkeIR
        FUxyKqb7ev6dOfvPN9h4a53hdM81k6t/iCYSKZc=
X-Google-Smtp-Source: APBJJlGRpiKs+ulZqyb7VlxP2UNk5jqxxMaq2kzu2lSD98K8hska7sLqPlce2MLTOWiIvTmTKv3y4zyPerbwRGQRh2w=
X-Received: by 2002:a17:90b:790:b0:268:1b62:2f6c with SMTP id
 l16-20020a17090b079000b002681b622f6cmr195194pjz.2.1690315185637; Tue, 25 Jul
 2023 12:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7x+fs7k0y8Sps+0N7NUPVto8UhZD9E8DbVEuDRPv6bdDMg@mail.gmail.com>
 <20230714134938.2124861-1-m.felsch@pengutronix.de> <ZL976QadmcinquUk@linaro.org>
In-Reply-To: <ZL976QadmcinquUk@linaro.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 25 Jul 2023 14:59:34 -0500
Message-ID: <CAHCN7xJLDjYuE2eYvZqOE8yBLyyf6jx=Kte759_tbBrQ5aDuDg@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: pll14xx: align pdiv with reference manual
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, adrian.alonso@nxp.com,
        rasmus.villemoes@prevas.dk, bli@bang-olufsen.dk, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, abelvesa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jul 25, 2023 at 2:38=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> On 23-07-14 15:49:38, Marco Felsch wrote:
> > The PLL14xx hardware can be found on i.MX8M{M,N,P} SoCs and always come
> > with a 6-bit pre-divider. Neither the reference manuals nor the
> > datasheets of these SoCs do mention any restrictions. Furthermore the
> > current code doesn't respect the restrictions from the comment too.
> >
> > Therefore drop the restriction and align the max pre-divider (pdiv)
> > value to 63 to get more accurate frequencies.

I like this.

> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>
> I'm OK with this:
>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>

Reviewed-by: Adam Ford <aford173@gmail.com>

> > ---
> > Hi Adam,
> >
> > here is the patch I made for setting the exact video-pll settings.
> >
> > Regards,
> >   Marco
> >
> >
> >  drivers/clk/imx/clk-pll14xx.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14x=
x.c
> > index 7150c59bbfc95..dc6bc21dff41f 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
> > @@ -139,11 +139,10 @@ static void imx_pll14xx_calc_settings(struct clk_=
pll14xx *pll, unsigned long rat
> >       /*
> >        * Fractional PLL constrains:
> >        *
> > -      * a) 6MHz <=3D prate <=3D 25MHz
> > -      * b) 1 <=3D p <=3D 63 (1 <=3D p <=3D 4 prate =3D 24MHz)
> > -      * c) 64 <=3D m <=3D 1023
> > -      * d) 0 <=3D s <=3D 6
> > -      * e) -32768 <=3D k <=3D 32767
> > +      * a) 1 <=3D p <=3D 63
> > +      * b) 64 <=3D m <=3D 1023
> > +      * c) 0 <=3D s <=3D 6
> > +      * d) -32768 <=3D k <=3D 32767
> >        *
> >        * fvco =3D (m * 65536 + k) * prate / (p * 65536)
> >        */
> > @@ -186,7 +185,7 @@ static void imx_pll14xx_calc_settings(struct clk_pl=
l14xx *pll, unsigned long rat
> >       }
> >
> >       /* Finally calculate best values */
> > -     for (pdiv =3D 1; pdiv <=3D 7; pdiv++) {
> > +     for (pdiv =3D 1; pdiv <=3D 63; pdiv++) {
> >               for (sdiv =3D 0; sdiv <=3D 6; sdiv++) {
> >                       /* calc mdiv =3D round(rate * pdiv * 2^sdiv) / pr=
ate) */
> >                       mdiv =3D DIV_ROUND_CLOSEST(rate * (pdiv << sdiv),=
 prate);
> > --
> > 2.39.2
> >
