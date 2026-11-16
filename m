Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794818607;
	b=J6tAQ+NwoG3D8+HgT4uNNW03Ra894wN7GtymgmTZLPcSKSzz5f79O8XKyDxUFZZmxGdq
	 3LmK59zGkoZcBvwrCZMZp3w8W/Xzh1J3eMF857qdYseymzEAQ8uZCjfGFU5LJ9tR1B/M9
	 gfI3N5j1wXe0797m569QdKFAV/BCEhNG6B54Gqt2WO2tgIQZnPRWUe0Yct54+TXjcB0st
	 3WFsvq2vIEL7cb1RFJUpsellS+y6iatOK5tDkkLWY2fA4tVslfPPnfQcsRZfHWxh8tVQ7
	 iomWLT5H8ArwKB/krKgp4GB5dbdjkYpCBvVb2QPmUVB628gqB1ZILZbwdVfZegQ9kYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
	b=EU2r+As+AVzj+Wp092zPmb0UknlymN+LvekIA2ihi2a3f9uKeDxDyEwPqoqVXH6pvubD
	 +fBuNMcGeGNlYlLwrWApG6GmHh7odgYm1MkRJQ45d4qugu/WoeuODAJ8xKhGGWJTsy5vP
	 mv/K8DeICjYaon6OC0lfVbakRj/1g6mCWby7XdZmH2Xrh7C8mVJtAxU/FC1N4dOq+1stg
	 ES8iWKLkiqjO041bV5G7Se4Gc7qCGQoKos2U6fRgu2XOgLj/MtrdDbsA2njX3doXNIivB
	 xl1P37JFYgIHn198lnqU4cwMUlpWvO6dGdMBhe6JWlB6HKotchfp8hvrj/VPuOiz15Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFoLXRey;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1159606A323
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 08:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1159606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFoLXRey
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so8672582eec.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 00:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794818606; cv=none;
        d=google.com; s=arc-20260327;
        b=n7togouPpZRE7h8L8Mt7Qn/oOAC0hJyjjyr0Bm2pauCrKXjQNBmfRNGyys/wzcDiK6
         9CQ/v90wA3Nrhzr5R/DldcbWNG/SH3UGcl1gDKvYywG+V6PNjrsnlSIioYcVtiQoeirr
         IEEB2O7PybZlgStYBjRd8yqxmFNYb+xUrsrDEWKqZ+yUEzADyuy/YdxvXg94ow1zDzaP
         2/1zIGRvNtFsdNaFKf7r8EKxtsshmNj1DdZIRFkYGfPojblQRoL8P1efinJVyQuSClrO
         4ipoATCza6C06Gkd7X/A92+118PNNRqfYGLRj9Ao+Lz0IUGQDt9MFxzlOGvbXWfYs1f7
         mkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        fh=xQLUfWy/DIP2CubwKpIRggZu/8/1KzPQxZiUAH9mbIs=;
        b=CIT0krHBDkE4xBJjmu+r/L+5WIhgXuqUMnRIQ0sGhEFdHo+grlLF93hDETQBZJsRC5
         HXp4QE66Iwlmu9kekUr642NQ0Hs1cXPWERxVnO19mYKIutLu+DqjFP97N/0+wDHpdKfT
         8epF37OJQqpmzsQ1GhS6dBqBRBh1Dn+HEVqtJK1geABmCozHTW7+835VvFqD/14p5sf7
         h+EE2JALOs98otUODstriepulROvhTJS8s3+JtR53vSq1pZ1qGG5XmI/fCWQcB9wDyLT
         1qHLoUFmTl02MkBAg73bhtTCE575kWbpWbw0EdnT1mPwYtQX2udtaVLaOWW4kn1Kydli
         L/wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818606; x=1795423406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        b=aFoLXReyupk43dXE0Bd8Ij6BK2NiknSHpzjU1u40qyGksAAyb1bLMBlYS0s6NFh1AY
         dPupndtPEV5CcQ8zlesWggleFHSp6R7olXSiJO/2jaHX6dNXjIL/Nctv8liWpvh4lo14
         8aKPlNa22PYGuYtosrzw7gWAVoaVV9tiAIydtZySFSBvKhuIWR2RZKnknmWx95H6ADSQ
         DDUwPCOZGSB9bbc4bNTzxEDs+Gmtb0YnMyaqE2WmqcTLu2vdEjquvLLrjkp21BNAJ0ek
         fAYPIAfEfLo0z3CcBiFhWbmJwgnSrNENJLZ0ieUXzsWh1NwQ2KgwqBnU/Vc/zfqSGHa2
         2NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818606; x=1795423406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        b=H6raIASEks3xSDVfWLxcgxdI391ks5OaaGbINIIhVXy/fFCOhkrj5K9lfhAXa5HIJ+
         iUJ1ko7VNYKbtV2kBgXAX5kFWi7ONDePHxD9TIWi3gXM9wxFN4s9eCar3A619vfDHpyQ
         vjNhxD+rjKzFGB6Qns4K58I5jrnFaaRX5WAz3VdtQhKb6O2JD48kQOJFYOdK5VevvRJO
         hkYLESUP+1MRzzYG9NpC2p1wcSwbStbm0ro8T7rBA4pG4alNDV2Zdu/YcBWyAPcIj70t
         kN2B15djoOy9Wngp5PEfr6YWhY7kR3EoRoHPwmvQjUomMmfcXpR6D6SAnrC1LAupUG2K
         JpSg==
X-Forwarded-Encrypted: i=1; AL+hErFXpJ4lo4Z6rzDnSeWLBR0bXXApFKDkDxNK3DlZfbXxWlo2yi7g2g2ixTYKt6ZrvtE/n3yZFJ+wyps=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QJXSIotHdwJedPA/ETUppsJBOQlxJZKukb6ZUykDiItHl5hUL
	FfRMQO7idL+gtMwpodI5atQfsfUm8zhPxBmPWI5lNIrMGB2/IioGOH8yQZyG5Dj7abuMZE2RsDn
	zaxnyZJfMcSD96GVfib0qloFNHhbmQGE=
X-Gm-Gg: AZFdTZetnvPKxEggSfhme0slTlKGq0CZ7if8zTDEVSDUl5ibDevYCVHgCXpVjn02hMT
	hX/Jz+kwj0S/AJqYDfftWanx/h5fZh6QLIJmClJUCSnaUldFs+4e8+favGTXQyfBL7+h3WAJOeZ
	lgv7JDq8sn42rVPnU9etkQaqVWUgoaMJT4hJlrtgluWTfChxnDFLaQXJnEWce2j0nyM3X4+lA/a
	rtyDz9yKQx6LilGlEM+KZbmkhmzl6x1Zkz5+BsOuMNe1oL/mb56Qkyg2VwYiuHEubmKZ7a5b4KQ
	qb2lQ+WnIfps+EX7u/4lmklFSILRdVil4OfPS9cZUaA6ipjDQ7iVAp3TeugqNpUdFKtpa1YZJPh
	zFRfWee/lZrY+A0ahWnIHbbZ03sKhTmLIhDGyABnIRWKJNZNbY+0OihDWTkQSqI7Kr4nogx0NLy
	BPIji4riZlQnWcW7fll9P9Gn4+0jJsdJmftuKdIO9jCd4Rbcdepvo=
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id
 5a478bee46e88-37967314a08mr9190579eec.24.1794818606016; Mon, 16 Nov 2026
 00:43:26 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113145708.261530-1-clamor95@gmail.com> <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4> <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
 <179478265643.13037.17097457582246933781.b4-reply@b4>
In-Reply-To: <179478265643.13037.17097457582246933781.b4-reply@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Nov 2026 10:43:14 +0200
X-Gm-Features: Aa3M54pMEr9UjE1zw6W6dd5jtUGbWeQ0qW9zBZkFj9pK7Jh0wgW3qgyddXi81sY
Message-ID: <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:4=
4 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:03 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are re=
quired
> > > > for the correct work of the CSI block. Add CSI pad A and pad B cloc=
k gates
> > > > with PLLD/PLLD2 parents, respectively.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/c=
lk-tegra114.c
> > > > index ec537efac692..08e425365469 100644
> > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(=
void __iomem *clk_base,
> > > >                                            0, 82, periph_clk_enb_re=
fcnt);
> > > >       clks[TEGRA114_CLK_DSIB] =3D clk;
> > > >
> > > > +     /* csia_pad */
> > > > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_=
RATE_PARENT,
> > > > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_l=
ock);
> > > > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > > > +
> > > > +     /* csib_pad */
> > > > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET=
_RATE_PARENT,
> > > > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2=
_lock);
> > > > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > > > +
> > >
> > > Change seems ok in itself, just a couple of things I'd like to check =
with you.
> > >
> > > Seems both the CSI and DSI can use the PLL D and D2. Can they be used=
 concurrently ?
> > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> > > DSI counter part does not have ?
> > >
> >
> > CSI pad clocks are used only by CSI and CSI does not change rate of
> > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > switched DSI clock parent while csi pad clocks do not touch clock
> > layout of CSI nor DSI.
>
> Ok but they end up possibly using the same PLL from what I can see here.
>
> So if the consumer of csiX_pad calls clk_set_rate() on it, while the DSI
> is using it, it won't go well. The rate of the underlying PLL may change
> since you have set CLK_SET_RATE_PARENT. Taken alone, there is no problem
> with this but can't CSI and DSI be active at the same time ?
>

The clk_set_rate() call for csi pad and csi cil clocks for dynamic
adjustments is not possible. These clocks are used only by CSI block
and among 6 clocks CSI uses it can change clock rate only for its own
clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
design and are not touched by any other driver.

This layout is used by Tegra30 for quite some time and I did not
observe any regressions of DSI/CSI caused by this configuration.

> >
> > Same layout is used in Tegra30 and Tegra114 inherits it.
> >
> > > Also the DSI get the PLL through a fixed factor 'out0' but not the CS=
I ? is it something
> > > you have checked ? it just seems a little odd.
> > >
> >
> > Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
> > hardware. CSI pad clocks do not have this setup in the hardware.
> >
>
> Ok
>
> --
> Jerome
>
