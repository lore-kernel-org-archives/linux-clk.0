Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A285C4727E
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 08:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C375A238A1
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 08:16:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJKij98l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgIWIQ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Sep 2020 04:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbgIWIQ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Sep 2020 04:16:59 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFBCC061755
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 01:16:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k15so19939429wrn.10
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wXfMbPEEJPtHz7/zGPzds7QIm+hID07yQRLZ/GfrvLU=;
        b=PJKij98luu5F0gWrHChB3GzdJab8nb5pFhaT2qU2hn9WHX0FSlOTF15SJ5rPSgibTU
         3PaQcSTVmqUSFbZ6/HLjPe34eOUE+GcjIzh0A3D71uXDy/0UHcsoLFSJSDzvNwd9g+yY
         zvQGtF/+79M1r3GjdhSobXOUX4aJdldlvF6estgdUjKlEJGFrey6T+x4UZX+CY8nWrkx
         jY+R8TGcQuV6ATdgOZ6mYYRDSQQDyB4Sm6rI06xps/ItokOwaIPdumjsVvf+KjEls1S+
         IApdM7Yg6k9ZQGHvtk52Nn7Nb1VGpBIajnlVnE1WBDHnIEq6likx13ge/6RRZP8xqLfg
         n5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wXfMbPEEJPtHz7/zGPzds7QIm+hID07yQRLZ/GfrvLU=;
        b=p3YCt1svTgGuwkPYkfOKh8/J7X7Pz6zBZmOu+md8RLDSUgPx/zCvTmfFGJ4A7/A96L
         vO8ZmLLRlnCW54OmdOlAmN/pbdMaipXBvqAhOSrKXZAxXMyASy/aQB8/0n8cJEXrD30g
         1FjTwEvDUYy7TiTbCDfS/e7xW0TyzQ59kFFlCfi164Y3A6Vr8+U8wtiNAJCMsnnLcDsM
         N0zuWOGdmW/eAkVtaNaBCHakbue4DCD4YIPFQ+HnMiH0qachVbwtfheAwelPB7hMMmkv
         nZTlAllF1Tl0WFHsDAUX3tLySNzxHsmHTL1AAdqCIuihwJLB8nsK6Efp2DgGTKHBc3QY
         OC6A==
X-Gm-Message-State: AOAM532aNxwMDnRCVRSrH7mNjbCxrSZWSgN2dkdbLCWs7o/lhpYa/42M
        7FyIhaF/Y1FacVFT985mnCQ=
X-Google-Smtp-Source: ABdhPJyGt3sYgfwNYEo4C316zjpe7yV6Gly7xbZ8llEvIxlsvVJgGfmQbEVfRp0qaj1UZ/EokHY5Ig==
X-Received: by 2002:adf:82ce:: with SMTP id 72mr9659525wrc.404.1600849017395;
        Wed, 23 Sep 2020 01:16:57 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x2sm30019738wrl.13.2020.09.23.01.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 01:16:56 -0700 (PDT)
Date:   Wed, 23 Sep 2020 10:16:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Qilong Zhang <zhangqilong3@huawei.com>, mturquette@baylibre.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH -next] clk: tegra: clk-dfll: indicate correct error
 reason in tegra_dfll_register
Message-ID: <20200923081654.GC1110498@ulmo>
References: <20200918094642.108070-1-zhangqilong3@huawei.com>
 <160080466654.310579.9823605565645488149@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline
In-Reply-To: <160080466654.310579.9823605565645488149@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 12:57:46PM -0700, Stephen Boyd wrote:
> Quoting Qilong Zhang (2020-09-18 02:46:42)
> > From: Zhang Qilong <zhangqilong3@huawei.com>
> >=20
> > Calling devm_ioremap means getting devices resource have been
> > successful. When remap operation failed, we should return '-ENOMEM'
> > instead of '-ENODEV' to differentiate between getting resource and
> > mapping memory for reminding callers. Moreover, it is not consistent
> > with devm_kzalloc operation.
> >=20
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > ---
> >  drivers/clk/tegra/clk-dfll.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> > index cfbaa90c7adb..6637b73be9f1 100644
> > --- a/drivers/clk/tegra/clk-dfll.c
> > +++ b/drivers/clk/tegra/clk-dfll.c
> > @@ -1993,7 +1993,7 @@ int tegra_dfll_register(struct platform_device *p=
dev,
> >         td->base =3D devm_ioremap(td->dev, mem->start, resource_size(me=
m));
> >         if (!td->base) {
> >                 dev_err(td->dev, "couldn't ioremap DFLL control registe=
rs\n");
> > -               return -ENODEV;
> > +               return -ENOMEM;
>=20
> Can you remove the dev_err() lines too? They're pretty much useless.

I find them somewhat useful because they indicate which particular
resource wasn't properly mapped. If we get an -ENOMEM without the error
message, we'll have to go and guess which one it is.

Thierry

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rBHYACgkQ3SOs138+
s6F39A//cHqaIKkHU3elI71n4TWP5ENNI9KQSqn3+mratZgMW+47iVR5p3ikbQt6
GJ7fa17e0qJ9OVPjPQv7jwDX/eJMHwoNRffuwRjIXBuxPkQY860xb3yISh9AOZpx
IUB2em+8c8ukfJyTfmlxMw4tyI4IKiI+kL8ZlUY7pvpn6wdxOoHaD/v7+oUohh4Q
h4sLXkADnfZtFSlDpq23mTojCrGh6suYr7S15gJ8YlMcQ535BziCYv8tjYOTChly
qnRGFDqjKSigja95jmoFH478wqKzzyc9I0vKdixrgJT0BTvXTj4SrdSTbruI+ezt
VBj5TJe1R+qqhxEGSTWyKZSO9hq1GeO5aYNsU7Yk9Ydp4oSoNJAvDdORU4Vv/Hv4
uRE1Ndkdgied2ey1mmhsaW/QFuyrR98mOflw76oeA2px1rchvRb3v9x+2TNmQtDA
DoyUGWa4PeZJZqY8gyG8dHDNjJEceQw9hpjVc/FMmPsD9EijzriyNpcMU2XTiaJk
w9AZnNbf77PRcltMXJhGVVm3KuGJfKP/6/bmEUPXya+NhDl8yShT4ZEDpeNwzvUh
MkU6z1+6WwhOhVZ/MsIWg7nIJcYfXM98bJmQ3LbnuIIyZFiSJwEgtBFzQ1LcZluX
XLsYH+2aQviXHgLpgOXhxMbT1WONT8VCxiXug/ZL+i/mYFNliPM=
=jIGN
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--
