Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D442F8E9C
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 07:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284586; cv=pass; b=RtMuM0hprWrwxf4w/EE8k4B5gZPxziq0BJ4jv+hpox7N+9ikKRvcJUjd+Zva3K/8dPNR/NpR4r7wOEv9PZ8tUdosFKsZRf9HtcdOL5IfVEeoYmb9elyf/yHokYs/ete8+TMMHpA50PY+85Qqg7PVouF2tq9Lowzxqgb23E08vYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284586; c=relaxed/simple;
	bh=6NnUuMFK7ZVPFmJ/RYM6gVqWzmsucRvdbM9ZcfpYsOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTK8JHu8MD+1nnsxOat87+aCi6eSB0gbohosZRnWw0yr1D5/Vbp6/e9mPsi9PS3Ju3rHGJTYsE+kH95NCAKO/7ja2kMQ/c7fmA2VzWCsr2QufxUtn3iEBCPzMVvvfq6fhY4LhgXMnPWabHuia25upi5EB0oUVo45Q/b32QVqz3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbUS0YJD; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbUS0YJD"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8ff15af279so378525a12.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 00:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782284584; cv=none;
        d=google.com; s=arc-20240605;
        b=cpJf5/uczEOcmH02ueLf8eSZp9sPIOErhRo3SZuOMsmusmoNWKaPsxYuQ4ArnHFUUe
         RVhkZ1nzE5tn++5+PEuylewywVOpqC81+e19xKj8jh00wnO09AMi7bFY2o5esHF9awgV
         brqu5MPiZiXtnGhVvpRmmlFYBd9R6UcjO1ovHX0++9bOcoGubMNnGLeHT6nxGAh1N5yJ
         79y3xJ6tAm6kCXppM8jsX1Dz6KyEu16eEC/XL8P2RHvj07Ty4rvmbBeXm41NFFRRs7OY
         945KmP0Vk1SC9Nc2mFEAjmmUUuOOQ7no3S3iCynjQaZ0Me2nuYmS8h/9paw4+s+0yTz9
         Cqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlK+fk93PJhltwmX3WNvBKy5MCGrZO4m1kl0DhorfTU=;
        fh=j/hKqcJi+ZbRR80FQyMzlGHKxFjhtUU3aEyfGMwdBuw=;
        b=f2PT6dRHv05+0mhSabMkWZi4hXuIuhWBu0om/FPyNkN/qwqHi82MKCbf/mKEXbTegh
         qDl7iVq7DHdyRqVR3f2CrcgzNcOZw/EsNexbnVscvzk9Xgt5I+bIYuaiAkKFsLlScYls
         6x8w7qWuyszo5euIkufbzOcSZ9ssJWTkQqeVgf2rrZvJuX2jYzbdrkEtW4MgRz9CUSWb
         aqVLr4bn7YymZII703BuOjqiUHFjbxs9ZF3yQKB8gZatG6aPJIXPWXJdkm5EMvdDD7xH
         JaRkusmnTOD/qEFjmwtB7+OuOKcJ6yBxGbwYImIZtAVQNgv4L2pU70kUXYPYHKJddhzo
         40DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782284584; x=1782889384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlK+fk93PJhltwmX3WNvBKy5MCGrZO4m1kl0DhorfTU=;
        b=CbUS0YJDkdxTytYkcywUUb+F7bICN7xN0mb9mnq74V8/ZofuJdL/b43L7KBqyx6P+V
         003fP8O1i0da5/rHNnZOE3wvNQMSsMGPPDLGzN94ed3/B6g8Ju26rMnjyEpyZEhMzYOb
         gJaXQaUqMWjdwb8H6FBntyGnv5sQgZaFr3jyJ5er2j61PO78ZFKBGr9VvTZfXzjxKCsX
         QoFpNMdD/hZSicUHS6K8+x/9H1tqSJxGY+fK0d2PTfBh0qzUgMm0O6MUKnN1wScxrvDM
         jpdGQre/REuVifEBfye3xK95KBqF4M/BPEapJ9WYragOXmhrim/DFVXyIL1V/FqR8m62
         6Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284584; x=1782889384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rlK+fk93PJhltwmX3WNvBKy5MCGrZO4m1kl0DhorfTU=;
        b=SmcpqK28wnnymVktXpqr1OsD36Aq0INlDGOpfbsW/cHWzfkWMxgci9yb27vExznNWW
         7tVWgkgPV6wSSaI0mSlI6LQXV5lVAmtMR1Xr2kaPLx9QsxemBLoA2aMh6/ZhUkzrELkd
         JavAOZ2wExsxL+x9PyiLTDnA8XlMHUDC+Msrtwd2+yS2VzkVrNbdkuHehYrq80OXPPYf
         sOAoIlCfa7+e2IycJo5zvXrQRw90wgfZDQXGlweJItzYKSHVUaOwpAu+Y6UyJGxAsz/+
         zeHAA5canyBVwzaLzkam/Ra21kwEYLqous63OZ4FAuMyG2Bfjvw7Zd4B5xK989T6j9CK
         ErfA==
X-Forwarded-Encrypted: i=1; AFNElJ+SxqyNO+9cC5cTTz2dBiLOXC9g0kU/AaViWAJbBS/Rj9DdVKfKsP3bd4ZUd67g4eEFBdD1mW4cpD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUcXjvveHDdvS3ecPrzKwp1AZm1hue/BDBYVR4UhiXJevn82Ld
	axvVMIhZIq5U6kak/muMkuoSAo2Clveodunrlxx0QVAkyitDbOd4KLI2gBMQwUZ7uzU7+RLaHeV
	uehb1128DQ+CIuv7MJlfX8z4cfAVowg==
X-Gm-Gg: AfdE7cl69j/b0bhuGVaOLA471sQnFe1h0SxGUPvqh/wvz0efOL7vzfKl2q6/GfqxQsc
	M47uTh8WVnum6WRJCODxzXOnWa6yzw72BpjKtXugqdGearkXE3tNikaFGHm55Lv/TLJs7nGfOkl
	9/d20O+00TmY5xgMjKnRPMn0Qii/V6ghLd3j3KxYOhhdKqwRPZlr3MDsir6/khkCMKDqb4af8LP
	qfIBBx3669V4t2fbMrLxu3aPjt8xSTXHy+6sTPfALzn3tNzdX9Q54e4WIoaBA/AOiTepqsiZpcQ
	YT9jRWeFFp2m3ltK9PUGQlB/
X-Received: by 2002:a05:6a21:10d:b0:3ba:ca7d:f8f0 with SMTP id
 adf61e73a8af0-3bd2d03331dmr2777776637.9.1782284584392; Wed, 24 Jun 2026
 00:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623090738.13773-1-mhun512@gmail.com> <ajqROjYdv28Yrqo5@redhat.com>
In-Reply-To: <ajqROjYdv28Yrqo5@redhat.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 24 Jun 2026 16:02:49 +0900
X-Gm-Features: AVVi8Cf9qcxjsGQb7x0dDnqnZi-YWmw2EKgRQkeo6x3PV864BQfmeqOIg5JwnPE
Message-ID: <CAGEsz8E=KwQko7sDQEftvFFbPu6f2Z1k7HLZVXn1FetCqqKKWw@mail.gmail.com>
Subject: Re: [PATCH] clk: palmas: unprepare clock on provider registration failure
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

Thanks for the review.

Agreed, v1 only handled the provider registration failure path and missed t=
he
driver remove path. I will send a v2 converting the provider registration t=
o
devm_of_clk_add_hw_provider() and making the external-control clk_prepare()
reference device-managed as well.

Best regards,
Myeonghun

2026=EB=85=84 6=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 10:59, =
Brian Masney <bmasney@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Myeonghun,
>
> Thanks for the patch!
>
> On Tue, Jun 23, 2026 at 06:07:34PM +0900, Myeonghun Pak wrote:
> > palmas_clks_init_configure() prepares the clock when an external contro=
l
> > pin is configured.  If the subsequent of_clk_add_hw_provider() call fai=
ls,
> > palmas_clks_probe() returns the error without dropping that prepare
> > reference.
> >
> > Unprepare the clock on that error path when external control is active,=
 so
> > the probe failure path balances the successful clk_prepare().
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
> >
> > Fixes: 942d1d674931 ("clk: Add driver for Palmas clk32kg and clk32kgaud=
io clocks")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >
> > ---
> >  drivers/clk/clk-palmas.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
> > index 39049f62db..ab9df2eedb 100644
> > --- a/drivers/clk/clk-palmas.c
> > +++ b/drivers/clk/clk-palmas.c
> > @@ -265,8 +265,11 @@ static int palmas_clks_probe(struct platform_devic=
e *pdev)
> >       }
> >
> >       ret =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, &cinfo=
->hw);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> >               dev_err(&pdev->dev, "Fail to add clock driver, %d\n", ret=
);
> > +             if (cinfo->ext_control_pin)
> > +                     clk_unprepare(cinfo->hw.clk);
> > +     }
>
> The driver currently only calls clk_unprepare() on an error path in
> palmas_clks_init_configure(). It leaks when the driver is removed.
>
> I think the cleanest approach to fixing this is to convert over to use
> devm_of_clk_add_hw_provider().
>
> Brian
>
