Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D339D6C5
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 21:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905028; cv=pass; b=pELuYs34ZpoGht+jFSl4+PI1YUHdofFWduOSi2CeaD/cVBHUMSCqDLm7eFF/HNOjRAoFdcNbyTYgmNCU1IbVSAWtqoy5vPI8d7P6dIeqLSWgMEn2zjvIs4wXSOEUmkPV5NEC7PVtfxd7pRnv+HeDgF6MsjC9rrKMpGWsfJK1zz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905028; c=relaxed/simple;
	bh=2yz7R+TcGuKcoj2GOosWnULqksSP+0DDXTBxjsLgL8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bB1ZeQMx6uWeRLRc4m55RPr9PBdBcSxWwUOvCQmTiyR5lVH5PfVg+qQqB+sfgXAKoaZHPNMdgNZyAQXSmA4K0qptfB7T05lG+7rFHjurrCvWAI4TjYqd987yXYxXNx5ZA2QrJtaoamvtyoV3AGKPC4cx2djVw+5dkr9+6a51nCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFa5lEvk; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFa5lEvk"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38b13652c87so42315921fa.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 14:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774905026; cv=none;
        d=google.com; s=arc-20240605;
        b=bk13kYZc3IcUOsBqh6y+OeZkF1mG8nwK8n5y5+V6IO6s3TIKta7hCyK6LJzBWMX/iU
         dTg5sZhqvmpJHNgEkvLiZxoMbaT4Q32V1Ti/rEiCUN+nkMGj6+D8taivp5/ampZHqEWe
         6+tPip009oAAgAjG0R4i4ypmth2nbj+vfVu/ilTQrWzlgqwLt69oa3APf+hswzoiYTvf
         t3+CFleVgotPAtyr7Whs0Wq/jtjhyZ4H6yx76PLET6B67fYI83qzCW6/FSSOnp0p0He5
         eOswIBwCadqoR3ZOeF2uHOVVNEz+mfLzDgUKse3p8eR/hyxsLcuSKREf2mG9oEkBEZOs
         H1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8TD3W/4zBz5nuz2PaleCdN5+eVyzP0S1yj02GTL1f0U=;
        fh=lUhZ+j1/tHQ7RrM0DA96bfwHv3zq8OsGEqzucXxYjuE=;
        b=HyAa8+egJzur/qmlhBmEr8m9q8gDNRVMjq6N+V0tKZoUc4jUcY9gWxLH4BrohZ0z3H
         F76ThR0ZuTqU5e9nKTK83GQ+YPZ2uNDNZUJkguGzN/fOUtY6qOtzqGq15euIueIBZ9+j
         SlT2fNhcqGkHdIYGtQva0/7E3I7u/oKbYcRP2LVoZVZQjnLN7rJqi2WywUG+m+BDy68A
         Cf5Xtwu9InJsi2oDAvuusfW5wQlvOONFZ0ity7ipJIJaXSuXSnetUJhVY2z673AA7VPl
         HZ8zRPl9xBLgVyWph68I1edAnEVCZw+DGftzz+RHPISCs1aHQXEVmuZp1qnUXwJXGNkF
         ytRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905026; x=1775509826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TD3W/4zBz5nuz2PaleCdN5+eVyzP0S1yj02GTL1f0U=;
        b=NFa5lEvklTcVZj8/BcHi29k/6r6S3iGsGJ2vXGqUEwba8zk/P/48pNNbLAeepwtPHL
         tsIP2eIRrL+Vr82ikjQEU9AsXSzQzKL+rG9IBvjMZ8/M9kOzyPooH5cONNa2rwBy46G1
         a1TBjFVgwh/8cw22R4nbizqFcQxEGxgLmzznkgWfYMztdOid13F0J8/LnHC6x0HqVSny
         wjaNRxOT04sLK0WU97Z9mvoAFUHmnOr/85jY8akG8ivDftsDmx+2VodmkD2/2azLYRr8
         oCwXBWLDSUl5JcUo3cgSv/RqCgcrwcOpZ0Lxpi6ssjA6YWcOuHLaYSzDGCHZ7Czd5o2q
         pg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905026; x=1775509826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8TD3W/4zBz5nuz2PaleCdN5+eVyzP0S1yj02GTL1f0U=;
        b=kbtOX6Sju8HCo7bQTTnMx1TSnMRPqvbxKNv+YIuYsVqu65GaoSoe4By98s47+PEeq4
         9gvidv0wI0ofIl8W0baieILltkXE5vIHCin++dC8l0+u92pdH4wNuTT/Mx9a3Vrkp36j
         yD/sEN/AKP07SEhKhJPbwTpftlu/pXzQ3eHlOWC+RY3ebKuVjpN8Iv782gQRHiSafFZN
         W8p41DgktLkofc8nyJ+JTVLsaDbZzlBwS5/B0q72UKC6xHNrvFRajzjRc9PIoRZmYIDx
         zLFcSIzo2P2geVmlEWd7ecq9JLVJfcJ8Ldj2r2ize6iM4kW3KETgtzyXWdAtXHttCGki
         TInA==
X-Gm-Message-State: AOJu0YwJtLRLbWHdtmqI94Xh119+U3C4MlIzXLHXSoSIQUyrfQCTjN7z
	TOI3PgPGA9W6fYq515Ras+5AgpbMhPkju5/1AbD8z/KKVU1PwtFpriSdQwwv/VldGMnNs1r0BYY
	YahtmV/tWOtORjAiyV1hHCM5l1/uoYhmFPg==
X-Gm-Gg: ATEYQzz/n7ZYJtLkVpMo3P/HVMViIw4YMk7Y63EGTdN1ny18SIZAezHOICALKnJmqMY
	pQT9m53NvlJ3g0Ivb2z2ipY8Mw1GJfqj31B/yPNKIb3Njdh1DOGxEOvs+bp1jad+gGdMR7PvY+2
	JkDwlmp6oTMDRQ81aG1DG5Iflzcf9dBRnmu2ywHPK844EUVXF3M2aSd2qatSf3kXM3RHcOwizaO
	ee1g5m0nXtCftOYkesjhV230l2OBrOddq6pOWoVGfp7FB/u2K12AfPaz1OsrkAy52U0mbnJeYmk
	kqHTBNU+IIXq1WvOUzCjwLACzUdPDMAp3IXJ+QuGQ0VQokuXXdO8YEeyZYn6nzCCDRXJ6+IPrjp
	X0eHT7Q==
X-Received: by 2002:a17:907:9813:b0:b97:6384:2317 with SMTP id
 a640c23a62f3a-b9b503516fdmr971809166b.17.1774904467434; Mon, 30 Mar 2026
 14:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327024032.6537-1-rosenp@gmail.com> <acp4q7L-mLecLxi_@redhat.com>
In-Reply-To: <acp4q7L-mLecLxi_@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 30 Mar 2026 14:00:56 -0700
X-Gm-Features: AQROBzDNi8aAdWXOAGt_l-u8LP2RNE0YU4POB4OgdKd3F9entWNh5rfi7hVbekM
Message-ID: <CAKxU2N9FEoxt6TrBLhWfBtio0wThWY32FnGhzAzaf6Pf0C15_g@mail.gmail.com>
Subject: Re: [PATCH] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 6:20=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Rosen,
>
> On Thu, Mar 26, 2026 at 07:40:32PM -0700, Rosen Penev wrote:
> > Combine allocations using kzalloc_flex and a flexible array member.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/clk/hisilicon/clkdivider-hi6220.c | 24 ++++++++---------------
> >  1 file changed, 8 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hi=
silicon/clkdivider-hi6220.c
> > index 1787ecefe601..14d72fd716c2 100644
> > --- a/drivers/clk/hisilicon/clkdivider-hi6220.c
> > +++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
> > @@ -35,8 +35,8 @@ struct hi6220_clk_divider {
> >       u8              shift;
> >       u8              width;
> >       u32             mask;
> > -     const struct clk_div_table *table;
> >       spinlock_t      *lock;
> > +     struct clk_div_table table[];
> >  };
> >
> >  #define to_hi6220_clk_divider(_hw)   \
> > @@ -108,24 +108,19 @@ struct clk *hi6220_register_clkdiv(struct device =
*dev, const char *name,
> >       u32 max_div, min_div;
> >       int i;
> >
> > -     /* allocate the divider */
> > -     div =3D kzalloc_obj(*div);
> > -     if (!div)
> > -             return ERR_PTR(-ENOMEM);
> > -
> >       /* Init the divider table */
> >       max_div =3D div_mask(width) + 1;
> >       min_div =3D 1;
> >
> > -     table =3D kzalloc_objs(*table, max_div + 1);
> > -     if (!table) {
> > -             kfree(div);
> > +     /* allocate the divider */
> > +     div =3D kzalloc_flex(*div, table, max_div + 1);
> > +     if (!div)
> >               return ERR_PTR(-ENOMEM);
> > -     }
> >
> >       for (i =3D 0; i < max_div; i++) {
> > -             table[i].div =3D min_div + i;
> > -             table[i].val =3D table[i].div - 1;
> > +             table =3D &div->table[i];
> > +             table->div =3D min_div + i;
> > +             table->val =3D table[i].div - 1;
>                              ^^^^^^^^^^^^^^^^^
> Sashiko has a question:
> https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gmail.com
>
>     Does this code read out-of-bounds and write incorrect values to the t=
able?
>
>     Because table is reassigned to point to &div->table[i], accessing tab=
le[i].div
>     in the following line effectively evaluates to div->table[2 * i].div.
>
>     For any i > 0, this reads uninitialized memory from further down the =
array,
>     and when 2 * i >=3D max_div + 1, it reads beyond the newly allocated =
flex array.
>     Could we use table->val =3D table->div - 1 instead?
yep. left that out accidentally.
>
> Brian
>
> >       }
> >
> >       init.name =3D name;
> > @@ -141,14 +136,11 @@ struct clk *hi6220_register_clkdiv(struct device =
*dev, const char *name,
> >       div->mask =3D mask_bit ? BIT(mask_bit) : 0;
> >       div->lock =3D lock;
> >       div->hw.init =3D &init;
> > -     div->table =3D table;
> >
> >       /* register the clock */
> >       clk =3D clk_register(dev, &div->hw);
> > -     if (IS_ERR(clk)) {
> > -             kfree(table);
> > +     if (IS_ERR(clk))
> >               kfree(div);
> > -     }
> >
> >       return clk;
> >  }
> > --
> > 2.53.0
> >
>
