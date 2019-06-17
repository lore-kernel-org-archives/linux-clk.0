Return-Path: <SRS0=KwYV=UQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DF7C31E57
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 11:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58A98208C0
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 11:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPh8MXqX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbfFQLOL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jun 2019 07:14:11 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42720 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfFQLOK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 07:14:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so9474545wrl.9;
        Mon, 17 Jun 2019 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sqIHJDo1zyyd5hh3Kshfucktme2Uym+hYCWdf2wNH5E=;
        b=PPh8MXqXAg6a7QTw8NKAmgQZwo6C3bWUVlw/ujnIRJi1r8tDBvTdl0/lRAydwfyCNG
         IHWjE0xGB3jNAJB/ic8jX/qwykLD2OEP/18cTZJGoKrj/USLS8HfyL8DYTyp1rp27PZB
         5d4TGMewD/zH0pmX0DsaD49o6O0JHUvX4PXGMvBzJClvSRoXbbTrs0RyprZc2pfo0tzb
         M14n/7be25H5UPiFIFIHFO7sAjVlR//PG+CAb5v9rcLdYNQ7JZPApz1x6argxxeFCl0A
         7O5Fuvb8zkTXb+iX1nzUSvydkRKudG01Yq+G5i9i4nL4pKnEdYogt9ptitbgJvwg2kwk
         E5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sqIHJDo1zyyd5hh3Kshfucktme2Uym+hYCWdf2wNH5E=;
        b=ZMEHzNe+T9DzXhnf1qSXToKXxshXp/NKbn2gG8nJHPV/+zl+XBjHhoYYWLm1vypj6u
         0SXa7AjP4iBgejYBCm5J3Qzq6niTsZgqS7BqBGqZO5mAirg2I4nkcdwMOgBND3TOhCxh
         Gmc4NFU8TC/SGEypwjcmPofTb/gaUnM4KdV8R1bd/3c24QDW7HlKbysKmMdygUEmwXRW
         Ep2H1rR1/VDvaF+3JimxBak7qDy1L26XJBltz1uIeh+D0GStB0f5PwTLOpvsf4tWDChY
         xFSgGlaGifXurIjRnQ5PdeBjtqtRytKKWC5LtYOU0pFUDa2qoZcjvMLCY7ePe/JlY+w/
         mICQ==
X-Gm-Message-State: APjAAAVpkgxwbsg8CcYdAHGxeHQCYVtQo+kv2YQBUwjh5W0+24BQ9HrM
        TzxyKtO06nbK0eGODtDI6fY=
X-Google-Smtp-Source: APXvYqwAeKFG2zq0mqI02ryCM+AKsHBHgYich60DIAXNO7wqFFRd08vgirs78u+J5yldLy142NS9aQ==
X-Received: by 2002:a5d:56c1:: with SMTP id m1mr61810922wrw.26.1560770048675;
        Mon, 17 Jun 2019 04:14:08 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x6sm12838717wru.0.2019.06.17.04.14.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 04:14:07 -0700 (PDT)
Date:   Mon, 17 Jun 2019 13:14:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: tegra: Warn if an enabled PLL is in IDDQ
Message-ID: <20190617111407.GH508@ulmo>
References: <20190613161225.2531-1-thierry.reding@gmail.com>
 <20190613161225.2531-2-thierry.reding@gmail.com>
 <b4c8a1fe-4d68-9999-8fc9-e7db3c64525f@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jaoouwwPWoQSJZYp"
Content-Disposition: inline
In-Reply-To: <b4c8a1fe-4d68-9999-8fc9-e7db3c64525f@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--jaoouwwPWoQSJZYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 11:39:48AM +0100, Jon Hunter wrote:
>=20
> On 13/06/2019 17:12, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > A PLL in IDDQ doesn't work, whether it's enabled or not. This is not a
> > configuration that makes sense, so warn about it.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra210.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-t=
egra210.c
> > index 4904ac4a75db..793c7acaf4e2 100644
> > --- a/drivers/clk/tegra/clk-tegra210.c
> > +++ b/drivers/clk/tegra/clk-tegra210.c
> > @@ -1003,8 +1003,12 @@ static void tegra210_pllre_set_defaults(struct t=
egra_clk_pll *pllre)
> >  		_pll_misc_chk_default(clk_base, pllre->params, 0, val,
> >  				~mask & PLLRE_MISC0_WRITE_MASK);
> > =20
> > -		/* Enable lock detect */
> > +		/* The PLL doesn't work if it's in IDDQ. */
> >  		val =3D readl_relaxed(clk_base + pllre->params->ext_misc_reg[0]);
> > +		if (val & PLLRE_MISC0_IDDQ)
> > +			pr_warn("unexpected IDDQ bit set for enabled clock\n");
> > +
> > +		/* Enable lock detect */
> >  		val &=3D ~mask;
> >  		val |=3D PLLRE_MISC0_DEFAULT_VALUE & mask;
> >  		writel_relaxed(val, clk_base + pllre->params->ext_misc_reg[0]);
>=20
> Looks like there are a few other instances of this that could be fixed
> as well.

Yeah. This is the only one that's showing up in logs, so I was
concentrating on this one. I'll make another pass over the driver and
clean up the rest of them in a separate patch.

Thierry

--jaoouwwPWoQSJZYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HdfwACgkQ3SOs138+
s6H1kg//dkHpum4GEhjtF1PdnpcjAg3rVv+Kh8Ec9JkpaRbEV13o1y7BVD/xoDr5
yg2MC5D/Cd+/dV8COtnnavd/hTOfVvlZoU90kGyuhEBOepZ1c88FYZE5YS0EAwjg
Zc2oSntdFHZZLSGQ0j6fOa9eSJgMx0tWaFgD60TARqhvIZmwnwXpqobAUGXglZAU
a8FMPPLP5I22mf6C0vHiE9BG9gtSAP90TelLiMH4SAZOI9xj7a1bZsEMhnmO7kzR
Y6tSDtxokWsB9DJ4cbJVC0QrJkAuptwBM2QcSzEi1aK9oKpk/DewRZQVyiJiIGfs
rnG2AhxEv6o2bLUnKHMaN5By4WYXWWXyBjsEYW5St3S1mcGilO0XOVefGlx/Iicg
P/tVWDnDMquy9lYrtAJeSvu0fc+selcXmcqqpGoODGCDqyaK3UOhQ4ssxX+9z+7D
S/FguYbW+4bx8ytaqQXrz/ZAvy4fAQmosPkFGEaV8WJKidb2nda6HSv/TAzdxUvc
XaVMrkJUXicATzl3+f4XdzQVBLMNTeHBlaBlM7Tz5bmdchIPw8jFFnDXkQgdEkYf
eBNI4HhMkv5M/axfid3AilXbj9rQZjKd73OXIt6rtuEYiH+flCq4U5Cx7zezE+KY
spWkHZXaCcsj1Nk8f3tLLGm23tcvoB17iZVO8DEyOdoBMG/t3m0=
=J6Bn
-----END PGP SIGNATURE-----

--jaoouwwPWoQSJZYp--
