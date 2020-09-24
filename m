Return-Path: <SRS0=Q/QO=DB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D30C4346E
	for <linux-clk@archiver.kernel.org>; Thu, 24 Sep 2020 07:17:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0C8820936
	for <linux-clk@archiver.kernel.org>; Thu, 24 Sep 2020 07:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPFJuH/n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgIXHRL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Sep 2020 03:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgIXHRL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Sep 2020 03:17:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC57C0613CE
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2020 00:17:11 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so2616540wrn.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2020 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OPLVPEdChKxnt9NK8AkHtNdtFbeM/QHeLq/U0ibWymE=;
        b=GPFJuH/nuzsiQAUHAbzIjsViq2Fu29iOr4sq0HF8yVV2Mrvliikc4DWHn/+PM4jCQ+
         9yxVI/wvabtOgrWIHlMp1XQpIRDXEkQ2xkqvmA1yjbHhpx85obr5hs1uz7+Q8xIYXZ78
         +RhR7k6kOmSVnLf/wV9ZZS81ERj4BKH/O4eKz1GHtVFyWWJGgpLDOaF8C7+5A1TxvJk/
         rrdnlAeriiMo3NnoVK0nocIBc05SaYj8GDvQyRz/A5bOWD8zdG0c8t93d4Nu+U+BceRt
         bs3Alv7NN1ntZBSVcL20MIjlSIGuDk/dftnQjseiiUrUcjSCGO+Xm9+dfpA3+cE272Vl
         SAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OPLVPEdChKxnt9NK8AkHtNdtFbeM/QHeLq/U0ibWymE=;
        b=MdTSFJbD4LZ1oQpbZopxhk+vOfJzB/TiuaeiBxlFpxGg5WStVpqZ6hEB0aicWIlxMU
         pVuVp0kB1HF454YEimrPHNQE4a00nntoOJzGtwJyQbboLFLKVzXfBMsXshpuJyOKB5de
         sobkg+gPy4M4SCKGTJQmcF/XFAmHkqMBHbUX50xO2bXkgwE4++Fc7jDnkeDBH1HaMtIQ
         hAzWNDV4WOCkppc4f1ewJ8bT3Cmeed27R+NR0GsNKrPJ3qpNZhrEKmXoXubC2EDSn4UB
         27eMVa91TyjKe1clENY2dwXc9M1/opXHTOwjQFCbsB0o9DJ9xFpkPRHOLinYsjURVIKH
         OjOw==
X-Gm-Message-State: AOAM532Awc3V2zUvI0qzJH6lwZI99VtIvhWoDE0DSvZnPeEedTWK+FnA
        7o35EL5UwROjTr45WvvCH7w=
X-Google-Smtp-Source: ABdhPJwmX8eNc5ctJLapaEr+a3xzh+Z7tZ+7U88tlnWi3DqJTRbOH8pYFryYtJae596F03Nl+bVKRg==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr3626194wrn.2.1600931829949;
        Thu, 24 Sep 2020 00:17:09 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t15sm2400406wrp.20.2020.09.24.00.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 00:17:08 -0700 (PDT)
Date:   Thu, 24 Sep 2020 09:17:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Qilong Zhang <zhangqilong3@huawei.com>, mturquette@baylibre.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH -next] clk: tegra: clk-dfll: indicate correct error
 reason in tegra_dfll_register
Message-ID: <20200924071706.GB2480300@ulmo>
References: <20200918094642.108070-1-zhangqilong3@huawei.com>
 <160080466654.310579.9823605565645488149@swboyd.mtv.corp.google.com>
 <20200923081654.GC1110498@ulmo>
 <160090396030.310579.9633354457476529250@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <160090396030.310579.9633354457476529250@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 04:32:40PM -0700, Stephen Boyd wrote:
> Quoting Thierry Reding (2020-09-23 01:16:54)
> > On Tue, Sep 22, 2020 at 12:57:46PM -0700, Stephen Boyd wrote:
> > > Quoting Qilong Zhang (2020-09-18 02:46:42)
> > > > From: Zhang Qilong <zhangqilong3@huawei.com>
> > > >=20
> > > > Calling devm_ioremap means getting devices resource have been
> > > > successful. When remap operation failed, we should return '-ENOMEM'
> > > > instead of '-ENODEV' to differentiate between getting resource and
> > > > mapping memory for reminding callers. Moreover, it is not consistent
> > > > with devm_kzalloc operation.
> > > >=20
> > > > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > > > ---
> > > >  drivers/clk/tegra/clk-dfll.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-d=
fll.c
> > > > index cfbaa90c7adb..6637b73be9f1 100644
> > > > --- a/drivers/clk/tegra/clk-dfll.c
> > > > +++ b/drivers/clk/tegra/clk-dfll.c
> > > > @@ -1993,7 +1993,7 @@ int tegra_dfll_register(struct platform_devic=
e *pdev,
> > > >         td->base =3D devm_ioremap(td->dev, mem->start, resource_siz=
e(mem));
> > > >         if (!td->base) {
> > > >                 dev_err(td->dev, "couldn't ioremap DFLL control reg=
isters\n");
> > > > -               return -ENODEV;
> > > > +               return -ENOMEM;
> > >=20
> > > Can you remove the dev_err() lines too? They're pretty much useless.
> >=20
> > I find them somewhat useful because they indicate which particular
> > resource wasn't properly mapped. If we get an -ENOMEM without the error
> > message, we'll have to go and guess which one it is.
> >=20
>=20
> Doesn't that print the stacktrace when we run out of memory?

slab allocator functions like kmalloc() and friends do, but I'm not
aware of ioremap() doing so. Perhaps if it runs out of virtual memory
for the mapping it would, but there are other reasons why this can fail.

Thierry

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9sR/IACgkQ3SOs138+
s6Hlvw//QQNMM9XWXKW09KKmy62pXv0awk01NQcUtlhFcST+h8eIJDIFfQmgLJqQ
wvfgqg3S9j5acfND1AVa7dr5u+Y5gEzvLbNzHvjFUqh2w8H4+/t6Tpl5nygYBq9V
8ikQigp+vj8xBFCwYJehaRraSFrjyjIi0E3GoR4b0FwiQoku9vx+BGF8e9ozW4OL
fSJRZx9afQgzw05uEmL1zm8HTqzbDUZ6iVMJ3TD3SUCxjALa1gNM0TZtX5v6y4Ba
OQInFZcisSP2q26mN1xjL5MCev2Inysh/3Ti0JszPQa1FjKKpoN8VRza4NLWbLPY
TLAfjTnLmWhEnpNwfCx2c5bJBzEkFtAFD7waRbrGDTKjCXsllRygPsx0exO5rKLn
iu3//pVfGPFAZA4t9F4iIZgvfrZQMeGW3AZuKdX7upv+6msog0b2tsGAAndJwppA
trEyHb1y/0dMGYwj0wwxInU3oSKca3xJQtuNm7snLyJ23gaWfq+3RG5pVQX0CeTT
h96DdTddRw1l4jkfYVa1GOwwduaJtMg1wCdOqEluxqXwfvHkCiXUEnp5qd2IaxDV
QzXriI6fzFgNsC0h8IBGOg2x6dKQhLbffBr6dzEXSjdQMMqnSG6qzlwyExbKwWpb
jb9ebWYo+LdWJpdf4AG3J7QIvl0Xmq5yYufbO3Zti+rX0Vzyd6M=
=6DYc
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
